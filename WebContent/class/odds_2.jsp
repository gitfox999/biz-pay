<%@page import="com.util.AllBall"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	StringBuffer sb = new StringBuffer("{\"number\":\"20160807098\",\"endtime\":84,\"opentime\":328"
			+ ",\"oddslist\":{\"ball\":{");
	for(int i=1;i<8;i++){
		sb.append("\""+i+"\":{");
		for(int j=1;j<15;j++){
			sb.append("\""+j+"\":\""+AllBall.getRate(i, j)+"\"");
			sb.append(j != 14 ?",":"}");
		}
		sb.append(i != 9 ?",":"}}}");
	}
	response.getWriter().print(sb.toString());
%>