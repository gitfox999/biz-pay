<%@page import="com.util.CurOrder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	if(session.getAttribute("trueName") == null){
		response.sendRedirect("save_card.jsp");
		return;
	}
	String id = session.getAttribute("id").toString();
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("select * from member where id = '"+id+"'");
	ResultSet resultSet = preparedStatement.executeQuery();
	resultSet.next();
	String bank = resultSet.getString("bank");
	String card = resultSet.getString("card");
	String bankpos = resultSet.getString("bankpos");
	double money = CurOrder.getTrueMoney(resultSet.getInt("money"));
	String name = resultSet.getString("name");
	String trueName = resultSet.getString("trueName");
	dbHelper.closeAll(connection, preparedStatement, resultSet);
%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0042)http://www.7378b.com/Member/Money/Take.php -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="resource/css/general.css">
<script type="text/javascript" src="resource/js/jquery.js"></script>
<script type="text/javascript" src="resource/js/member.js"></script>
</head>
<body> 
  <div class="ui-moneyBox">
    <ul>
        <table width="100%" border="0" cellspacing="0" cellpadding="5">
          <tbody><tr>
            <td align="right">会员账号：</td>
            <td><%=name %></td>
          </tr>
          <tr>
            <td width="150" align="right">总账户余额：</td>
            <td><font style="font-size:14px;color:#F00; font-weight:bold"><%=money %></font></td>
          </tr>
          <tr>
            <td align="right">提款金额：</td>
            <td><input type="text" id="Money" name="Money" class="Input_100" onkeyup="digitOnly(this)"><input type="hidden" name="Key" id="Key" value="617529"><input type="hidden" name="Num" id="Num" value="1">
            <font color="#FF0000">最低提款额为:100元</font></td>
          </tr>
          <tr>
            <td colspan="2" align="left" bgcolor="#384967" style="font-size:14px; color:#FF0">以下为您的收款信息，请认真核对，如果要修改您的收款银行账户，请联络我们的客服人员！</td>
          </tr>
          <tr>
            <td align="right">收款银行：</td>
            <td><font color="#0000FF"><%=bank %></font></td>
          </tr>
          <tr>
            <td align="right">银行户名：</td>
            <td><font color="#0000FF"><%=trueName %></font></td>
          </tr>
          <tr>
            <td align="right">银行账号：</td>
            <td style="font-size:14px;color:#F00; font-weight:bold"><%=card %></td>
          </tr>
          <tr>
            <td align="right">开户行地址：</td>
            <td><font color="#0000FF"><%=bankpos %></font></td>
          </tr>
          <!--<tr>
            <td align="right">&nbsp;</td>
            <td>您今日提款已经超过 <font color="#FF0000">3次</font>，每笔提款将会收取 <font color="#FF0000">50元</font> 的行政费用！您今天已经提款 <font color="#FF0000">次</font>，还可以<font color="#0000FF">免手续费</font>提款 <font color="#FF0000">次</font>！</td>
          </tr>-->
          <tr>
            <td colspan="2" align="left" style="padding-left:160px;"><input type="button" name="button" id="button" value="确认提交" class="m_btn" onclick="TakeMoney();"></td>
          </tr>
        </tbody></table>
    </ul>
  </div>
<div id="loading"><img src="resource/images/load.gif"><br>提交申请中，请稍等...</div>

</body></html>