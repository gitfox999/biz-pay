package com.util;

import java.util.HashMap;
import java.util.Map;

public class OrderExplain {
	public static Map<String,String> getMap(){
		Map<String, String> orderMap = new HashMap<String, String>();
		for(int i = 1;i<6;i++){
			for(int j = 1;j<11;j++){
				orderMap.put(i+"_"+j, "第"+i+"位：第"+(j-1)+"球");
			}
			orderMap.put(i+"_11", "第"+i+"位：大");
			orderMap.put(i+"_12", "第"+i+"位：小");
			orderMap.put(i+"_13", "第"+i+"位：单");
			orderMap.put(i+"_14", "第"+i+"位：双");
		}
		orderMap.put("6_1", "总和大");
		orderMap.put("6_2", "总和小");
		orderMap.put("6_3", "总和单");
		orderMap.put("6_4", "总和双");
		orderMap.put("6_5", "龙");
		orderMap.put("6_6", "虎");
		orderMap.put("6_7", "和");
		for(int i = 7;i<10;i++){
			String w = "前三位";
			if(i == 8){
				w = "中三位";
			}
			if(i == 9){
				w = "后三位";
			}
			orderMap.put(i+"_1", w+"：豹子");
			orderMap.put(i+"_2", w+"：顺子");
			orderMap.put(i+"_3", w+"：对子");
			orderMap.put(i+"_4", w+"：半顺");
			orderMap.put(i+"_5", w+"：杂六");
		}
		return orderMap;
	}
}
