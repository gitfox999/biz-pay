<%@page import="com.util.CurOrder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.Param"%>
<%@page import="com.util.AllBall"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	long openTime = (CurOrder.endDate.getTime() - (new Date()).getTime())/1000+10;
	StringBuffer sb = new StringBuffer("{\"number\":\""+CurOrder.qishu+"\",\"endtime\":84,\"opentime\":"+openTime
			+ ",\"oddslist\":{\"ball\":{");
	for(int i=1;i<10;i++){
		sb.append("\""+i+"\":{");
		for(int j=1;j<15;j++){
			sb.append("\""+j+"\":\""+AllBall.getRate(i, j)+"\"");
			sb.append(j != 14 ?",":"}");
		}
		sb.append(i != 9 ?",":"}}}");
	}
	response.getWriter().print(sb.toString());
%>