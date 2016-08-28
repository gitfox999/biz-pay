<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    if(session.getAttribute("id") == null){
    	return;
    }
    String id = session.getAttribute("id").toString();
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("select * from member where id = "+id);
	ResultSet resultSet = preparedStatement.executeQuery();
	if(resultSet.next()){
		String name = resultSet.getString("name");
		double money = ((double)resultSet.getInt("money"))/100;
		session.setAttribute("name", name);
		session.setAttribute("money", money);
		dbHelper.closeAll(connection, preparedStatement, resultSet);
		response.getWriter().print("{\"money\":"+money+"}");
	}
	 %>