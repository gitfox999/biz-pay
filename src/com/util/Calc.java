package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class Calc {
	public void Open() throws SQLException {
		System.out.println("开始时间："+new Date());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date thisDoStartTime = CurOrder.startDate;
		Date thisDoEndTime = CurOrder.endDate;
		String thisDoQihao = CurOrder.qishu;
		int thisDoTims = CurOrder.curTimes;
		String startTime = simpleDateFormat.format(thisDoStartTime);
		String endTime = simpleDateFormat.format(thisDoEndTime);
		DbHelper dbHelper = new DbHelper();
		Connection connection = dbHelper.getConnection();
		//加载配置
    	CurOrder.loadConfig(connection);
		CurOrder.beforeOpen();
		String openInfo = "";
//		String[] earnRatePathArray = {"15*25","5*15","0*5","25*50","50*100","-10*0"};
		String[] earnRatePathArray = CurOrder.earnRatePathArray;
		String earnSql = "select sum(money) from sscorder as earn where otime >= '"+startTime+"' and otime <= '"+endTime+"'";
		PreparedStatement preparedStatement = connection.prepareStatement(earnSql);
		ResultSet resultSet = preparedStatement.executeQuery();
		resultSet.next();
		int inMoney = resultSet.getInt(1);
		preparedStatement = connection.prepareStatement("select * from sscorder where otime >= '"+startTime+"' and otime <= '"+endTime+"'");
		resultSet = preparedStatement.executeQuery();
		resultSet.last(); //结果集指针知道最后一行数据  
		int ordersArrayLength = resultSet.getRow();  
		    
		resultSet.beforeFirst();
		String[][] ordersArray = new String[ordersArrayLength][2];
		ordersArrayLength = 0;
		while (resultSet.next()) {
			String[] dataArray = new String[2];
			dataArray[0] = resultSet.getInt("pos")+"_"+resultSet.getInt("num");
			dataArray[1] = String.valueOf(resultSet.getInt("emoney"));
			ordersArray[ordersArrayLength++] = dataArray;
		}
		System.out.println("循环完时间："+new Date());
		int[] nums = new int[5];
		String[] openNumArray = new String[50000];
		for(int j = 0;j< openNumArray.length;j++){
			int payMoneyAll = 0;
			for(int i=0;i<5;i++){
				int num = (int)(0+Math.random()*(9-0+1));
				nums[i] = num;
			}
////			panduan(nums);
//			List<String> strings = panduan(nums);
////			List<String> strings = new ArrayList<String>();
//			Iterator<String> iterator;
//			for (String[] dataArray : ordersArray) {
//				String balltmp = dataArray[0];
//				int payMoney = Integer.valueOf(dataArray[1]);
//				iterator = strings.iterator();
//				while (iterator.hasNext()) {
//					String ballcur = (String) iterator.next();
//					if(ballcur.equals(balltmp)){
//						payMoneyAll += payMoney;
//						break;
//					}
//				}
//			}
			
			String[] strings = panduan2(nums);
			for (String[] dataArray : ordersArray) {
				String balltmp = dataArray[0];
				int payMoney = Integer.valueOf(dataArray[1]);
				for (int i = 0; i < strings.length; i++) {
					String ballcur = strings[i];
					if(ballcur.equals(balltmp)){
						payMoneyAll += payMoney;
						break;
					}
				}
			}
			
			int tmpEarnMoney = inMoney - payMoneyAll;
			double DearnRate = 0;
			if(tmpEarnMoney != 0D){
				DearnRate = (double)tmpEarnMoney / (double)inMoney;
			}
			openNumArray[j] = (j+1)+" "+getNo(nums)+" "+tmpEarnMoney+" "+String.valueOf(DearnRate);
		}
		System.out.println("万号选择完："+new Date());
		double minRate = 0,maxRate = 0,eartnRateTmp = 0;
		for (int i = 0; i < earnRatePathArray.length; i++) {
			String earnRatePathTmp = earnRatePathArray[i];
			String[] rateRangeArray = earnRatePathTmp.split("\\*");
			minRate = Double.parseDouble(rateRangeArray[0]);
			maxRate = Double.parseDouble(rateRangeArray[1]);
			boolean isHas = false;
			for (int k = 0; k < openNumArray.length; k++) {
				String[] openNumInfoArray = openNumArray[k].split(" ");
				eartnRateTmp = Double.parseDouble(openNumInfoArray[3])*100;
				if(eartnRateTmp >= minRate && eartnRateTmp <= maxRate){
					isHas = true;
					openInfo = openNumArray[k];
					break;
				}
			}
			if(isHas) break;
		}
		InsertNo insertNo = new InsertNo();
		String openNum = openInfo.split(" ")[1];
		char[] charNumArray = openNum.toCharArray();
		for(int i=0;i<5;i++){
			int num = Integer.valueOf(charNumArray[i]+"");
			nums[i] = num;
		}
		System.out.println("最优选择完："+new Date());
		List<String> numRules = panduan(nums);
		insertNo.insertAll(nums,numRules,openInfo,inMoney,thisDoStartTime,thisDoEndTime,thisDoQihao,thisDoTims);
		CurOrder.loaded();
	}
	
	public static boolean isShun(int a,int b,int c){
		int[] score = {a,b,c};
		for (int i = 0; i < score.length -1; i++){
            for(int j = 0 ;j < score.length - i - 1; j++){   
                if(score[j] < score[j + 1]){    
                    int temp = score[j];  
                    score[j] = score[j + 1];  
                    score[j + 1] = temp;  
                }  
            }              
        }  
        if(score[0]-score[1] == 1 && score[1]-score[2] == 1){
        	return true;
        }else if(score[0] == 9 && score[2] == 0 && (score[1] == 1|| score[1] == 8)){
        	return true;
        }else{
        	return false;
        }
	}
	
	public static boolean isBanShun(int a,int b,int c){
		int[] score = {a,b,c};
		for (int i = 0; i < score.length -1; i++){
            for(int j = 0 ;j < score.length - i - 1; j++){
                if(score[j] < score[j + 1]){
                    int temp = score[j];  
                    score[j] = score[j + 1];  
                    score[j + 1] = temp;  
                }  
            }              
        }  
        if((score[0]-score[1] == 1 && score[1]-score[2] != 1) || (score[0]-score[1] != 1 && score[1]-score[2] == 1)){
        	return true;
        }else if(score[0] == 9 && score[2] == 0 && (score[1] != 1 && score[1] != 8)){
        	return true;
        }else{
        	return false;
        }
	}
	
	public static String getNo(int[] nums){
//		String oknum = "";
//		for(int i =4;i>=0;i--){
//			oknum += nums[i]+""; 
//		}
//		return oknum;
		String oknum = "";
		for(int i =0;i<5;i++){
			oknum += nums[i]+""; 
		}
		return oknum;
	}
	
	public static char[] reverseArray(char[] Array) {  
		char[] new_array = new char[Array.length];  
        for (int i = 0; i < Array.length; i++) {  
            // 反转后数组的第一个元素等于源数组的最后一个元素：  
            new_array[i] = Array[Array.length - i - 1];  
        }  
        return new_array;  
    }
	
	public static List<String> panduan(int[] nums){
		int sumNum = 0;
		List<String> strings = new ArrayList<String>();
		for(int i=0;i<5;i++){
			int num = nums[i];
			sumNum +=num;
			String pos = (i+1)+"";
			strings.add(pos+"_"+(num+1));
			if(num>=5){strings.add(pos+"_11");}
			if(num<5){strings.add(pos+"_12");}
			if(num%2!=0){strings.add(pos+"_13");}
			if(num%2==0){strings.add(pos+"_14");}
		}
		if(sumNum >=23){strings.add("6_1");}
		if(sumNum <23){strings.add("6_2");}
		if(sumNum %2 != 0){strings.add("6_3");}
		if(sumNum %2 == 0){strings.add("6_4");}
		if(nums[0] - nums[4] >0){strings.add("6_5");}
		if(nums[0] - nums[4] <0){strings.add("6_6");}
		if(nums[0] == nums[4]){strings.add("6_7");}
		
		boolean isqz = true,iszz = true,ishz = true;
		boolean isqs = false,isqd = false,iszs = false,iszd = false,ishs = false,ishd = false;
		
		if(nums[2] == nums[0] && nums[1] == nums[2]){strings.add("7_1");isqz=false;}
		if(isShun(nums[2],nums[1],nums[0])){strings.add("7_2");isqz=false;isqs=true;}
		if((nums[2] == nums[1] && nums[2] != nums[0]) 
				|| (nums[2] == nums[0] && nums[2] != nums[1])
				|| (nums[0] == nums[1] && nums[2] != nums[1])){strings.add("7_3");isqz=false;isqd=true;}
		if(isBanShun(nums[2],nums[1],nums[0]) && !isqs && !isqd){strings.add("7_4");isqz=false;}
		if(isqz){strings.add("7_5");}
		
		if(nums[2] == nums[3] && nums[1] == nums[2]){strings.add("8_1");iszz=false;}
		if(isShun(nums[3],nums[2],nums[1])){strings.add("8_2");iszz=false;iszs=true;}
		if((nums[3] == nums[2] && nums[3] != nums[1]) 
				|| (nums[3] == nums[1] && nums[3] != nums[2])
				|| (nums[1] == nums[2] && nums[3] != nums[2])){strings.add("8_3");iszz=false;iszd=true;}
		if(isBanShun(nums[3],nums[2],nums[1]) && !iszs && !iszd){strings.add("8_4");iszz=false;}
		if(iszz){strings.add("8_5");}
		
		if(nums[4] == nums[3] && nums[4] == nums[2]){strings.add("9_1");ishz=false;}
		if(isShun(nums[4],nums[3],nums[2])){strings.add("9_2");ishz=false;ishs=true;}
		if((nums[4] == nums[3] && nums[4] != nums[2])
				|| (nums[4] == nums[2] && nums[4] != nums[3])
				|| (nums[2] == nums[3] && nums[4] != nums[3])){strings.add("9_3");ishz=false;ishd=true;}
		if(isBanShun(nums[4],nums[3],nums[2]) && !ishs && !ishd){strings.add("9_4");ishz=false;}
		if(ishz){strings.add("9_5");}
		
		return strings;
	}
	
	public String[] panduan2(int[] nums){
		List<String> strings = panduan(nums);
		String[] strArray = new String[strings.size()];
		Iterator<String> iterator = strings.iterator();
		int i =0;
		while (iterator.hasNext()) {
			strArray[i++] = (String) iterator.next();
		}
		return strArray;
	}
}
