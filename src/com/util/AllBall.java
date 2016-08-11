package com.util;

public class AllBall {
//	public static Ball getBall(){
//		for(int i=1;i<6;i++){
//			for(int j=1;j<15;j++){
//				Ball ballTmp = new Ball();
//				ballTmp.setName("ball_"+i+"_"+j);
//				ballTmp.setNo(j);
//				ballTmp.setRate(i>10?1.98:9.8);
//			}
//		}
//	}
	
	public static double getRate(int pos,int no){
		if(pos < 6){
			if(no <11){
				return 9.8;
			}else{
				return 1.98;
			}
		}else if(pos == 6){
			if(no == 1 || no == 3 || no == 5){
				return 1.98;
			}else if(no == 2 || no == 4 || no ==6){
				return 1.97;
			}else if(no == 8){
				return 8.88;
			}else{
				return 0;
			}
		}else if(pos == 7 || pos == 8 || pos == 9){
			if(no == 1){
				return 66.01;
			}else if(no == 2){
				return 12.01;
			}else if(no == 3){
				return 2.81;
			}else if(no == 4 || no == 5){
				return 2.21;
			}else{
				return 0;
			}
		}else{
			return 0;
		}
	}
}
