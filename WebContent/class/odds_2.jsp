<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.util.DbHelper"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.quartz.JobKey"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.Param"%>
<%@page import="com.util.quartzdd"%>
<%@page import="com.util.AllBall"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	JobKey jobKey = new JobKey("job1","group1");
	SimpleDateFormat dateFormat_day = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat dateFormat_day_no = new SimpleDateFormat("yyyyMMdd");
	Date nextOpenTime = quartzdd.scheduler.getTriggersOfJob(jobKey).get(0).getNextFireTime();
	long openTime = (nextOpenTime.getTime() - (new Date()).getTime())/1000;
	int times =1;
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	connection.setAutoCommit(false);
	PreparedStatement preparedStatement = connection.prepareStatement("select * from ssc order by id desc limit 0,1");
	ResultSet resultSet = preparedStatement.executeQuery();
	String nextDate_day = dateFormat_day.format(nextOpenTime);
	if(resultSet.next()){
		if(nextDate_day.equals(dateFormat_day.format(resultSet.getDate("time")))){
			times = resultSet.getInt("times")+1;
		}
	}
	String str_times = String.format("%03d", times);
	StringBuffer sb = new StringBuffer("{\"number\":\""+dateFormat_day_no.format(nextOpenTime)+str_times+"\",\"endtime\":84,\"opentime\":"+openTime
			+ ",\"oddslist\":{\"ball\":{");
	for(int i=1;i<10;i++){
		sb.append("\""+i+"\":{");
		for(int j=1;j<15;j++){
			sb.append("\""+j+"\":\""+AllBall.getRate(i, j)+"\"");
			sb.append(j != 14 ?",":"}");
		}
		sb.append(i != 9 ?",":"}}}");
	}
	dbHelper.closeAll(connection, preparedStatement, resultSet);
	response.getWriter().print(sb.toString());
%>