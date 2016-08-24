<%@page import="com.util.CurOrder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
response.setCharacterEncoding("utf-8");
session.removeAttribute("id");
session.removeAttribute("name");
session.removeAttribute("money");
response.getWriter().write("<script type=\"text/javascript\">window.location='"+CurOrder.url+"/index.jsp';</script>");
%>