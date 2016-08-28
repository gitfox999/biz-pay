<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0044)http://www.7378b.com/Member/Data/Lottery.php -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>彩票投注记录</title>
<link rel="stylesheet" type="text/css" href="resource/css/general.css">
<link rel="stylesheet" type="text/css" href="resource/css/jquery-ui.css">
<script type="text/javascript" src="resource/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="resource/js/member.js"></script>
<script language="javascript" type="text/javascript" src="resource/js/My97DatePicker/WdatePicker.js"></script>
<%
	String id = session.getAttribute("id").toString();
	SimpleDateFormat  dateFormat= new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat  dateFormat2= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date curDate = new Date();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(curDate);
	calendar.add(Calendar.DAY_OF_MONTH, -30);
	Date minDate = calendar.getTime();
	String strCurDate = dateFormat.format(curDate);
	String strMinDate = dateFormat.format(minDate);
	String S_date = strMinDate;
	String E_date = strCurDate;
	int pageno = 1;
	int size = 20;
	if(request.getParameter("S_date") != null){
		S_date = request.getParameter("S_date");
	}
	if(request.getParameter("E_date") != null){
		E_date = request.getParameter("E_date");
	}
	if(request.getParameter("page") != null){
		pageno = Integer.parseInt(request.getParameter("page"));
	}
	
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("select count(*) _count from sscorder where memid="+id
			+" and otime >= '"+S_date+"' and otime <= '"+E_date+" 23:59:59'");
	ResultSet resultSet = preparedStatement.executeQuery();
	resultSet.next();
	int allCount = resultSet.getInt("_count");
	int pageCount = allCount/size+1;
	preparedStatement = connection.prepareStatement("select * from sscorder where memid="+id
			+" and otime >= '"+S_date+"' and otime <= '"+E_date+" 23:59:59' order by otime desc limit "+(pageno - 1)*size+","+pageno*size);
	resultSet = preparedStatement.executeQuery();
	String lastPage = "lottery.jsp?page="+pageCount;
	String nextPage = "lottery.jsp?page="+(pageno+1);
	String prePage = "lottery.jsp?page="+(pageno-1);
	if(pageCount == pageno || allCount==0){
		lastPage = "javascript:void(0);";
		nextPage = "javascript:void(0);";
	}
	if(pageno == 1 || allCount==0){
		prePage = "javascript:void(0);";
	}
%>
</head>
<body>
  <div class="ui-moneyBox">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody><tr>
    <form id="MyForm" action="lottery.jsp" method="get">
      <td align="center"><table border="0" cellspacing="0" cellpadding="0">
        <tbody><tr>
          <td>日期范围（近一个月）：</td>
          <td><input class="Wdate" type="text" onClick="WdatePicker()" onfocus="WdatePicker({minDate:'<%=strMinDate%>',maxDate:'<%=strCurDate%>'})" name="S_date" readonly="readonly" value="<%=S_date%>"></td>
          <td align="center">&nbsp;~&nbsp;</td>
          <td><input class="Wdate" type="text" onClick="WdatePicker()" onfocus="WdatePicker({minDate:'<%=strMinDate%>',maxDate:'<%=strCurDate%>'})" name="E_date" readonly="readonly" value="<%=E_date%>"></td>
          <td><input type="submit" name="Button" value="" id="Button" class="S_btn"></td>
        </tr>
      </tbody></table></td>
        
    </tr>
    </tbody></table>
    </form>
<ul style="margin-top:10px;">
      <table width="100%" border="0" cellspacing="0" cellpadding="5" id="thetable">
            <tbody><tr>
              <th>投注时间
              </th><th>注单号
              </th><th width="250">投注详细信息
              </th><th>下注金额
            </th><th>盈利
            </th><th>结果</th></tr>
            <%if(allCount == 0){ %>
    <tr style="background-color: rgb(255, 255, 255);">
      <td colspan="5" align="center">暂无记录</td>
      </tr>
      <%
            }
      while(resultSet.next()){
    	  String otime = dateFormat2.format(resultSet.getTimestamp("otime"));
    	  String qihao = resultSet.getString("qihao");
    	  String detail = resultSet.getString("detail");
    	  double money = ((double)resultSet.getInt("money"))/100;
    	  double emoney = ((double)resultSet.getInt("emoney"))/100;
    	  int iswin = resultSet.getInt("iswin");
    	  String strIswin = "未开奖";
    	  String style = "gray";
    	  if(iswin == 0){
    		  strIswin = "输";
    		  emoney = 0;
    		  style = "green";
    	  }else if(iswin == 1){
    		  strIswin = "赢";
    		  style = "red";
    	  }else{
    		  strIswin = "未开奖"; 
    		  emoney = 0;
    	  }
      %>
      <tr style="background-color: rgb(255, 255, 255);color: '<%=style %>'">
              <th><%=otime %>
              </th><th><%=qihao %>
              </th><th><%=detail %>
              </th><th><%=money %>
            </th><th><%=emoney %>
            </th><th><%=strIswin %></th></tr>
	  <tr>
	  <%
      }
		dbHelper.closeAll(connection, preparedStatement, resultSet);
	  %>
	  	<th colspan="5"><div class="Pagination"><a href="lottery.jsp?page=1" class="tips" title="首页">首页</a> 
<a href="<%=prePage %>" class="tips" title="上一页">上一页</a> 


<a href="<%=nextPage %>" class="tips" title="下一页">下一页</a>
<a href="<%=lastPage %>" class="tips" title="末页">末页</a>
</div></th>
	  </tr>
    </tbody></table>
    </ul>
  </div>
<script language="javascript">bianse("thetable","#F5F5F5","#FFFFFF","#FFFFCC","#FFFFCC");</script> 
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>