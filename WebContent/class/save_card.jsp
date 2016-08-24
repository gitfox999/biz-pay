<%@page import="com.util.CurOrder"%>
<%@page import="com.util.MD5Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String trueName = request.getParameter("trueName");	
	String Bank = request.getParameter("Bank");
	String BankNum = request.getParameter("BankNum");
	String Address_1 = request.getParameter("Address_1");
	String Address_2 = request.getParameter("Address_2");
	String Address_3 = request.getParameter("Address_3");
	String Address_4 = request.getParameter("Address_4");
	String bankpos = Address_1+Address_2+Address_3+Address_4;
	String id = session.getAttribute("id").toString();
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	
	PreparedStatement preparedStatement = connection.prepareStatement("update member set trueName='"+trueName+"',bank='"+Bank+"',card='"+BankNum+"',bankpos='"+bankpos+"' where id = '"+id+"'");
	preparedStatement.execute();
	session.setAttribute("trueName", trueName);
	response.sendRedirect(CurOrder.url+"/take.jsp");
%>