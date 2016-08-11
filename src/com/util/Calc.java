package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Calc {
	public static void main(String[] args) throws SQLException {
		int calcTimes = 0;
		String oknum = "";
		double maxWin = 0;
		double winmoney = 0;
		int earnMoney = 0;
		List<Integer> numsList = new ArrayList<Integer>(); 
		DbHelper dbHelper = new DbHelper();
		Connection connection = dbHelper.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("select sum(money) from sscorder as earn");
		ResultSet resultSet = preparedStatement.executeQuery();
		resultSet.next();
		earnMoney = resultSet.getInt(1);
		preparedStatement = connection.prepareStatement("select * from sscorder");
		resultSet = preparedStatement.executeQuery();
		int[] nums = new int[5];
		while (calcTimes < 30000) {
			double payMoneyAll = 0;
			int sumNum = 0;
			List<String> strings = new ArrayList<String>();
			for(int i=0;i<5;i++){
				int num = (int)(0+Math.random()*(9-0+1));
				sumNum +=num;
				nums[i] = num;
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
			if(nums[4] == nums[3] && nums[4] == nums[2]){strings.add("7_1");isqz=false;}
			if(isShun(nums[4],nums[3],nums[2])){strings.add("7_2");isqz=false;}
			if((nums[4] == nums[3] && nums[4] != nums[2])
					|| (nums[4] == nums[2] && nums[4] != nums[3])
					|| (nums[2] == nums[3] && nums[4] != nums[3])){strings.add("7_3");isqz=false;}
			if(isBanShun(nums[4],nums[3],nums[2])){strings.add("7_4");isqz=false;}
			if(isqz){strings.add("7_5");}
			
			if(nums[2] == nums[3] && nums[1] == nums[2]){strings.add("8_1");iszz=false;}
			if(isShun(nums[3],nums[2],nums[1])){strings.add("8_2");iszz=false;}
			if((nums[3] == nums[2] && nums[3] != nums[1]) 
					|| (nums[3] == nums[1] && nums[3] != nums[2])
					|| (nums[1] == nums[2] && nums[3] != nums[2])){strings.add("8_3");iszz=false;}
			if(isBanShun(nums[3],nums[2],nums[1])){strings.add("8_4");iszz=false;}
			if(iszz){strings.add("8_5");}
			
			if(nums[2] == nums[0] && nums[1] == nums[2]){strings.add("9_1");ishz=false;}
			if(isShun(nums[2],nums[1],nums[0])){strings.add("9_2");ishz=false;}
			if((nums[2] == nums[1] && nums[2] != nums[0]) 
					|| (nums[2] == nums[0] && nums[2] != nums[1])
					|| (nums[0] == nums[1] && nums[2] != nums[1])){strings.add("9_3");ishz=false;}
			if(isBanShun(nums[2],nums[1],nums[0])){strings.add("9_4");ishz=false;}
			if(ishz){strings.add("9_5");}
			
			resultSet.beforeFirst();
			while (resultSet.next()) {
				String balltmp = resultSet.getInt("pos")+"_"+resultSet.getInt("num");
				double payMoney = resultSet.getDouble("emoney")-1;
				for(String ballcur : strings){
					if(ballcur.equals(balltmp)){
						payMoneyAll += payMoney;
					}
				}
			}
			double tmpEarnMoney = earnMoney - payMoneyAll;
			System.out.println(calcTimes+"   "+tmpEarnMoney);
			oknum = "";
			for(int i =4;i>=0;i--){
				oknum += nums[i]+""; 
			}
			System.out.println(oknum);
//			if(tmpEarnMoney / earnMoney >= 0.1 && tmpEarnMoney / earnMoney <= 0.2){
//				oknum = "";
//				for(int i =4;i>=0;i--){
//					oknum += nums[i]+""; 
//				}
//				break;
//			}
			if(tmpEarnMoney <0){
				winmoney = tmpEarnMoney;
				oknum = "";
				for(int i =4;i>=0;i--){
					oknum += nums[i]+""; 
				}
				break;
			}
//			if(tmpEarnMoney > maxWin){
//				maxWin = tmpEarnMoney;
//				oknum = "";
//				for(int i =4;i>=0;i--){
//					oknum += nums[i]+""; 
//				}
//			}
			calcTimes++;
		}
		System.out.println(oknum+"--"+maxWin);
	}
	
	public static boolean isShun(int a,int b,int c){
		int[] score = {a,b,c};
		for (int i = 0; i < score.length -1; i++){    //最多做n-1趟排序  
            for(int j = 0 ;j < score.length - i - 1; j++){    //对当前无序区间score[0......length-i-1]进行排序(j的范围很关键，这个范围是在逐步缩小的)  
                if(score[j] < score[j + 1]){    //把小的值交换到后面  
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
		for (int i = 0; i < score.length -1; i++){    //最多做n-1趟排序  
            for(int j = 0 ;j < score.length - i - 1; j++){    //对当前无序区间score[0......length-i-1]进行排序(j的范围很关键，这个范围是在逐步缩小的)  
                if(score[j] < score[j + 1]){    //把小的值交换到后面  
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
	
	public void sysout(){
		System.out.println("asdf");;
	}
}
