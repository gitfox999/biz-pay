package com.util;

import java.util.HashMap;
import java.util.Map;

public class OrderExplain {
	public static Map<String,String> getMap(){
		Map<String, String> orderMap = new HashMap<String, String>();
		for(int i = 1;i<6;i++){
			for(int j = 1;j<11;j++){
				orderMap.put(i+"_"+j, "��"+i+"λ����"+(j-1)+"��");
			}
			orderMap.put(i+"_11", "��"+i+"λ����");
			orderMap.put(i+"_12", "��"+i+"λ��С");
			orderMap.put(i+"_13", "��"+i+"λ����");
			orderMap.put(i+"_14", "��"+i+"λ��˫");
		}
		orderMap.put("6_1", "�ܺʹ�");
		orderMap.put("6_2", "�ܺ�С");
		orderMap.put("6_3", "�ܺ͵�");
		orderMap.put("6_4", "�ܺ�˫");
		orderMap.put("6_5", "��");
		orderMap.put("6_6", "��");
		orderMap.put("6_7", "��");
		for(int i = 7;i<10;i++){
			String w = "ǰ��λ";
			if(i == 8){
				w = "����λ";
			}
			if(i == 9){
				w = "����λ";
			}
			orderMap.put(i+"_1", w+"������");
			orderMap.put(i+"_2", w+"��˳��");
			orderMap.put(i+"_3", w+"������");
			orderMap.put(i+"_4", w+"����˳");
			orderMap.put(i+"_5", w+"������");
		}
		return orderMap;
	}
}
