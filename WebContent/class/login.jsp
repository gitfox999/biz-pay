<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.MD5Util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String name = request.getParameter("username");	
	String pwd = request.getParameter("password");
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("select * from member where name = '"+name+"' and pwd = '"+MD5Util.MD5(pwd)+"'");
	ResultSet resultSet = preparedStatement.executeQuery();
	if(resultSet.next()){
		int id = resultSet.getInt("id");
		session.setAttribute("name", name);
		session.setAttribute("money", resultSet.getInt("money"));
		session.setAttribute("id", id);
		dbHelper.closeAll(connection, preparedStatement, resultSet);
		response.getWriter().print("4");
	}else{
		dbHelper.closeAll(connection, preparedStatement, resultSet);
		response.getWriter().print("2");
	}
	
%>