<%@page import="com.util.MD5Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String LoginPass_1 = request.getParameter("LoginPass_1");	
	String pwd = request.getParameter("LoginPass_2");
	String pwd2 = request.getParameter("LoginPass_3");
	String script ="";
	if(!pwd.equals(pwd2)){
		script = "alert(\"两次密码输入不一致，请重新输入\");window.history.go(-1);";
	}else{
		LoginPass_1 = MD5Util.MD5(LoginPass_1);
		String id = session.getAttribute("id").toString();
		DbHelper dbHelper = new DbHelper();
		Connection connection = dbHelper.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("select * from member where id="+id+" and pwd = '"+LoginPass_1+"'");
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()){
			pwd = MD5Util.MD5(pwd);
			preparedStatement.execute("update member set pwd = '"+pwd+"' where id = "+id);
			script = "alert(\"密码修改成功！\");window.history.go(-1);";
		}else{
			script = "alert(\"原始密码错误，请重新输入\");window.history.go(-1);";
		}
		dbHelper.closeAll(connection, preparedStatement, resultSet);
	}
%>
<htm>
<head></head>
<body>
<script type="text/javascript">
<%=script%>
</script>
</body>
</htm>