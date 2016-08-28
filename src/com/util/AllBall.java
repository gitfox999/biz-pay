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
		BallRate ballRate = CurOrder.ballRate;
		if(pos < 6){
			if(no <11){
				return ballRate.danqiu;
			}else{
				return ballRate.daxiaodashuang;
			}
		}else if(pos == 6){
			if(no >= 1 || no <=6){
				return ballRate.daxiaodashuang;
			}else if(no == 7){
				return ballRate.he;
			}else{
				return 0;
			}
		}else if(pos == 7 || pos == 8 || pos == 9){
			if(no == 1){
				return ballRate.baozi;
			}else if(no == 2){
				return ballRate.shunzi;
			}else if(no == 3){
				return ballRate.duizi;
			}else if(no == 4){
				return  ballRate.banshun;
			}else if(no == 5){
				return  ballRate.zaliu;
			}else{
				return 0;
			}
		}else{
			return 0;
		}
	}
}
