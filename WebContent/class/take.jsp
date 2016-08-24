<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.CurOrder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.MD5Util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	response.setCharacterEncoding("utf-8");
	double money = Double.parseDouble(request.getParameter("Money"));
	int ok = 0;
	String txt = "提款请求失败！";
	if(money >= 1){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String id = session.getAttribute("id").toString();
		DbHelper dbHelper = new DbHelper();
		Connection connection = dbHelper.getConnection();
		connection.setAutoCommit(false);
		PreparedStatement preparedStatement = connection.prepareStatement("select * from member where id = '"+id+"'");
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()){
			String bank = resultSet.getString("bank");
			String card = resultSet.getString("card");
			String bankpos = resultSet.getString("bankpos");
			String name = resultSet.getString("name");
			String trueName = resultSet.getString("trueName");
			double hasMoney = CurOrder.getTrueMoney(resultSet.getInt("money"));
			if(money > hasMoney){
				txt = "提款金额不能大于，实际钱包金额！";
			}else{
				try {
					String nowStr = dateFormat.format(new Date());
					preparedStatement.execute("update member set money = "+CurOrder.getFaceMoney(hasMoney-money)+" where id = "+id);
					System.out.print(CurOrder.getFaceMoney(money));
					preparedStatement.execute("insert into takeorder (memid,money,bank,bankpos,card,truename,state,ts) "
							+" values ("+id+","+CurOrder.getFaceMoney(money)+",'"+bank+"','"+bankpos+"','"+card+"','"+trueName+"',0,'"+nowStr+"')");
					connection.commit();
					ok = 1;
					txt = "";
				}catch (Exception exc) {
					connection.rollback();//回滚JDBC事务 
					System.out.print(exc.getMessage());
					dbHelper.closeAll(connection, preparedStatement, resultSet);
				}
			}
			dbHelper.closeAll(connection, preparedStatement, resultSet);
		}
	}else{
		txt = "提款金额必须大于100元";
	}
	out.write("{\"ok\":"+ok+",\"txt\":\""+txt+"\"}");
%>