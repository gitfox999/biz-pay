<%@page import="com.util.CurOrder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
response.setCharacterEncoding("utf-8");
if(session.getAttribute("id") == null){
	response.getWriter().write("<script type=\"text/javascript\">alert('您尚未登录，或登录已超时，请重新登录');window.location='"+CurOrder.url+"/index.jsp';</script>");
}
%>