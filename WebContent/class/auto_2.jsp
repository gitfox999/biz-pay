<%@page import="org.quartz.JobKey"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.quartzdd"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	SimpleDateFormat dateFormat_day_no = new SimpleDateFormat("yyyyMMdd");
	DbHelper dbHelper = new DbHelper();
	Connection connection = dbHelper.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("select * from ssc order by id desc limit 0,25");
	ResultSet resultSet = preparedStatement.executeQuery();
	resultSet.next();
	String noStr = dateFormat_day_no.format(resultSet.getDate("time"))+String.format("%03d", resultSet.getInt("times"));
	String openNum = resultSet.getString("no");
	char[] charNumArray = openNum.toCharArray();
	int[] nums = new int[5];
	for(int i=0;i<5;i++){
		int num = Integer.valueOf(charNumArray[i]+"");
		nums[i] = num;
	}
	int he = resultSet.getInt("sum");
	int sum = resultSet.getInt("sum");
	String daxiao = resultSet.getString("daxiao");
	String danshuang = resultSet.getString("danshuang");
	String longhuhe = resultSet.getString("longhuhe");
	String qian = resultSet.getString("qiansan");
	String zhong = resultSet.getString("zhongsan");
	String hou = resultSet.getString("housan");
	JobKey jobKey = new JobKey("job1","group1");
	Date nextOpenTime = quartzdd.scheduler.getTriggersOfJob(jobKey).get(0).getNextFireTime();
	long openTime = (nextOpenTime.getTime() - (new Date()).getTime())/1000;
	StringBuffer sb = new StringBuffer("{\"itime\":\""+openTime+"\",\"numbers\":\""+noStr+"\",\"hm\":[\""+nums[0]+"\",\""+nums[1]+"\",\""+nums[2]+"\",\""+nums[3]+"\",\""+nums[4]+"\"]"
			+ ",\"hms\":["+sum+",\""+daxiao+"\",\""+danshuang+"\",\""+longhuhe+"\",\""+qian+"\",\""+zhong+"\",\""+hou+"\"],\"hmlist\":{");
	while(resultSet.next()){
		noStr = dateFormat_day_no.format(resultSet.getDate("time"))+String.format("%03d", resultSet.getInt("times"));
		sb.append("\""+noStr+"\":[\""+resultSet.getString("no")+"\"]");
		if(!resultSet.isLast()) sb.append(",");
	}
	sb.append("}}");
	dbHelper.closeAll(connection, preparedStatement, resultSet);
	response.getWriter().print(sb.toString());
%>