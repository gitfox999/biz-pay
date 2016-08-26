<%@page import="com.util.CurOrder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String open_qihao = request.getParameter("open_qihao");
	int msg = 0;
	if(CurOrder.isCanOrder(open_qihao)){
		msg = 1;
	}
	out.write("{\"msg\":"+msg+"}");
%>