<%@page import="org.quartz.JobKey"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.quartzdd"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	JobKey jobKey = new JobKey("job1","group1");
	Date nextOpenTime = quartzdd.scheduler.getTriggersOfJob(jobKey).get(0).getNextFireTime();
	long openTime = (nextOpenTime.getTime() - (new Date()).getTime())/1000;
	StringBuffer sb = new StringBuffer("{\"itime\":\""+openTime+"\"}");
	response.getWriter().print(sb.toString());
%>