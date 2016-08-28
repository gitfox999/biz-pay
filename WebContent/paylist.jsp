<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="resource/css/general.css">
<link rel="stylesheet" type="text/css" href="resource/css/jquery-ui.css">
<script type="text/javascript" src="resource/js/jquery.js"></script>
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
	PreparedStatement preparedStatement = connection.prepareStatement("select count(*) _count from flow where memid="+id
			+" and ts >= '"+S_date+"' and ts <= '"+E_date+" 23:59:59' and type=0");
	ResultSet resultSet = preparedStatement.executeQuery();
	resultSet.next();
	int allCount = resultSet.getInt("_count");
	int pageCount = allCount/size+1;
	preparedStatement = connection.prepareStatement("select * from flow where memid="+id
			+" and ts >= '"+S_date+"' and ts <= '"+E_date+" 23:59:59' and type=0 order by ts desc limit "+(pageno - 1)*size+","+pageno*size);
	resultSet = preparedStatement.executeQuery();
	String lastPage = "paylist.jsp?page="+pageCount;
	String nextPage = "paylist.jsp?page="+(pageno+1);
	String prePage = "paylist.jsp?page="+(pageno-1);
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
    <form id="MyForm" action="paylist.jsp" method="get"></form>
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
    <ul style="margin-top:10px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="5" id="thetable">
            <tbody><tr>
              <th>打款账号
              </th><th>入款时间（美东）
              </th><th>入款金额
              </th><th>入款状态
              </th><th>备注
            </th></tr>
	  <%if(allCount == 0){ %>
    <tr style="background-color: rgb(255, 255, 255);">
      <td colspan="5" align="center">暂无记录</td>
      </tr>
      <%
            }
      while(resultSet.next()){
    	  String ts = dateFormat2.format(resultSet.getTimestamp("ts"));
    	  String qihao = resultSet.getString("qihao");
    	  String fromcard = resultSet.getString("fromcard");
    	  String remark = resultSet.getString("remark");
    	  double money = ((double)resultSet.getInt("money"))/100;
      %>
      <tr style="background-color: rgb(255, 255, 255);">
              <th><%=fromcard %>
              </th><th><%=ts %>
              </th><th><%=money %>
            </th><th>完成
            </th><th><%=remark %></th></tr>
	  <tr>
	  <%
      }
		dbHelper.closeAll(connection, preparedStatement, resultSet);
	  %>
	  	<th colspan="5"><div class="Pagination"><a href="paylist.jsp?page=1" class="tips" title="首页">首页</a> 
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