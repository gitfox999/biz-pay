<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String value = request.getParameter("param");
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("select * from member where name = '"+value+"'");
	ResultSet resultSet = preparedStatement.executeQuery();
	if(resultSet.next()){
		response.getWriter().print("{\"info\":\"该用户名已注册\",\"status\":\"n\"}");
	}else{
		response.getWriter().print("{\"info\":\"恭喜您，该用户名可以注册！\",\"status\":\"y\"}");
	}
	dbHelper.closeAll(connection, preparedStatement, resultSet);
%>