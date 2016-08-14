<%@page import="com.util.MD5Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String name = request.getParameter("name");	
	String pwd = request.getParameter("password");
	String pwd2 = request.getParameter("password2");
	String value = request.getParameter("param");
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("select * from member where name = '"+value+"'");
	ResultSet resultSet = preparedStatement.executeQuery();
	if(resultSet.next()){
		dbHelper.closeAll(connection, preparedStatement, resultSet);
		response.getWriter().print("<scrpit>alert(\"该用户名已存在请重新输入\");window.history.go(-1);</script>");
	}else{
		pwd = MD5Util.MD5(pwd);
		String money = "100000.00";
		preparedStatement.execute("insert into member (name,pwd,money) values ('"+name+"','"+pwd+"',"+money+")");
		resultSet = preparedStatement.executeQuery("select * from member where name ='"+name+"' and pwd='"+pwd+"'");
		resultSet.next();
		int id = resultSet.getInt("id");
		dbHelper.closeAll(connection, preparedStatement, resultSet);
		session.setAttribute("name", name);
		session.setAttribute("money", money);
		session.setAttribute("id", id);
		response.getWriter().print("<html><head></head><body></body><script>alert(\"注册成功！欢迎您成为我们的尊贵会员！\");parent.location.href='../index.jsp'</script></html>");
	}
	
%>