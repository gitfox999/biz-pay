package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CalcTest {
	public static void main(String[] args) throws SQLException {
		String openInfo = "";
		String[] earnRatePathArray = {"0.15*0.25","0.05*0.15","0*0.05","0.25*0.5","0.5*1","-0.1*0"};
		DbHelper dbHelper = new DbHelper();
		Connection connection = dbHelper.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("select sum(money) from sscorder as earn");
		ResultSet resultSet = preparedStatement.executeQuery();
		resultSet.next();
		int inMoney = resultSet.getInt(1);
		preparedStatement = connection.prepareStatement("select * from sscorder");
		resultSet = preparedStatement.executeQuery();
		int[] nums = new int[5];
//		String strNum = "";
//		char[] charNumArray;
		String[] openNumArray = new String[100000];
		for(int j = 0;j< openNumArray.length;j++){
//			strNum = String.format("%05d", j);
//			charNumArray = reverseArray(strNum.toCharArray());
//			charNumArray = strNum.toCharArray();
			double payMoneyAll = 0;
			for(int i=0;i<5;i++){
				int num = (int)(0+Math.random()*(9-0+1));
//				int num = Integer.valueOf(charNumArray[i]+"");
				nums[i] = num;
			}
			List<String> strings = panduan(nums);
			
			resultSet.beforeFirst();
			while (resultSet.next()) {
				String balltmp = resultSet.getInt("pos")+"_"+resultSet.getInt("num");
				double payMoney = resultSet.getDouble("emoney");
				for(String ballcur : strings){
					if(ballcur.equals(balltmp)){
						payMoneyAll += payMoney;
					}
				}
			}
			double tmpEarnMoney = inMoney - payMoneyAll;
			double earnRate = tmpEarnMoney / inMoney;
			openNumArray[j] = (j+1)+" "+getNo(nums)+" "+tmpEarnMoney+" "+String.valueOf(earnRate);
//			System.out.println(calcTimes+" "+getNo(nums)+"  "+tmpEarnMoney+"   "+String.valueOf(earnRate));
//			openNumArray[j] = (j+" "+getNo(nums)+"  "+tmpEarnMoney+"   "+String.valueOf(earnRate));
//			if(earnRate >= 0.1 && earnRate <= 0.2){
//				break;
//			}
//			if(earnRate >= 0.2 && earnRate <= 0.3){
//				break;
//			}
//			if(earnRate >= 0.0 && earnRate <= 0.1){
//				break;
//			}
//			if(earnRate >= 0.3 && earnRate <= 0.4){
//				break;
//			}
//			if(earnRate >= 0.4 && earnRate <= 0.5){
//				break;
//			}
//			if(earnRate >= 0.5 && earnRate <= 0.6){
//				break;
//			}
//			if(earnRate >= 0.6 && earnRate <= 0.7){
//				break;
//			}
//			if(earnRate >= 0.7 && earnRate <= 0.8){
//				break;
//			}
//			if(earnRate >= 0.8 && earnRate <= 0.9){
//				break;
//			}
//			if(earnRate >= 0.9 && earnRate <= 1){
//				break;
//			}
//			if(tmpEarnMoney <0){
//				winmoney = tmpEarnMoney;
//				oknum = "";
//				for(int i =4;i>=0;i--){
//					oknum += nums[i]+""; 
//				}
//				break;
//			}
//			if(tmpEarnMoney > maxWin){
//				maxWin = tmpEarnMoney;
//				oknum = "";
//				for(int i =4;i>=0;i--){
//					oknum += nums[i]+""; 
//				}
//			}
		}
		double minRate = 0,maxRate = 0,eartnRateTmp = 0;
		for (int i = 0; i < earnRatePathArray.length; i++) {
			String earnRatePathTmp = earnRatePathArray[i];
			String[] rateRangeArray = earnRatePathTmp.split("\\*");
			minRate = Double.parseDouble(rateRangeArray[0]);
			maxRate = Double.parseDouble(rateRangeArray[1]);
			boolean isHas = false;
			for (int k = 0; k < openNumArray.length; k++) {
				String[] openNumInfoArray = openNumArray[k].split(" ");
				eartnRateTmp = Double.parseDouble(openNumInfoArray[3]);
				if(eartnRateTmp >= minRate && eartnRateTmp <= maxRate){
					isHas = true;
					openInfo = openNumArray[k];
					break;
				}
			}
			if(isHas) break;
		}
		System.out.println(openInfo);
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
		
		if(nums[2] == nums[0] && nums[1] == nums[2]){strings.add("7_1");}
		if(isShun(nums[2],nums[1],nums[0])){strings.add("7_2");isqz=false;isqs=true;}
		if((nums[2] == nums[1] && nums[2] != nums[0]) 
				|| (nums[2] == nums[0] && nums[2] != nums[1])
				|| (nums[0] == nums[1] && nums[2] != nums[1])){strings.add("7_3");isqz=false;isqd=true;}
		if(isBanShun(nums[2],nums[1],nums[0]) && !isqs && !isqd){strings.add("7_4");isqz=false;}
		if(isqz){strings.add("7_5");}
		
		if(nums[2] == nums[3] && nums[1] == nums[2]){strings.add("8_1");iszz=false;isqz=false;}
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
}
