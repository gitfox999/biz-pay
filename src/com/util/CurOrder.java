package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.quartz.JobKey;
import org.quartz.SchedulerException;

public class CurOrder {
	public static Date startDate;
	public static Date endDate;
	public static int curTimes;
	public static String qishu;
	public static String preQishu;
	public static String preNo;
	public static List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	public static String url = "http://119.29.150.142/b/";
	public static boolean isOk = false;
	public static String[] earnRatePathArray;
	public static BallRate ballRate = new BallRate();
	public static Infos infos = new Infos();
	
	public static void resultSetToList(ResultSet rs) throws java.sql.SQLException {   
		list = new ArrayList<Map<String,Object>>();
        if (rs == null)   return;
        ResultSetMetaData md = rs.getMetaData(); //得到结果集(rs)的结构信息，比如字段数、字段名等   
        int columnCount = md.getColumnCount(); //返回此 ResultSet 对象中的列数   
        Map<String,Object> rowData = new HashMap<String,Object>();   
        while (rs.next()) {   
         rowData = new HashMap<String,Object>();   
         for (int i = 1; i <= columnCount; i++) {   
                 rowData.put(md.getColumnName(i), rs.getObject(i));   
         }   
         list.add(rowData);   
        }   
	}
	
	public static void init() throws SQLException{
		JobKey jobKey = new JobKey("job1","group1"); 
		SimpleDateFormat dateFormat_day_no = new SimpleDateFormat("yyyyMMdd");
		
		try {
			endDate = quartzdd.scheduler.getTriggersOfJob(jobKey).get(0).getNextFireTime();
			startDate = quartzdd.scheduler.getTriggersOfJob(jobKey).get(0).getPreviousFireTime();
			if(quartzdd.scheduler.getCurrentlyExecutingJobs().size() > 0){
				startDate = quartzdd.scheduler.getCurrentlyExecutingJobs().get(0).getFireTime();
				endDate = quartzdd.scheduler.getCurrentlyExecutingJobs().get(0).getNextFireTime();
			}
			if(startDate == null){
        		Calendar cal = Calendar.getInstance();
                cal.setTime(endDate);
                cal.add(Calendar.MINUTE, -10);
                startDate = cal.getTime();
        	}
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
    	
		//查询最近所有的开奖结果
    	DbHelper dbHelper = new DbHelper();
    	Connection connection = dbHelper.getConnection();
    	PreparedStatement preparedStatement = connection.prepareStatement("select * from ssc order by id desc limit 0,25");
    	ResultSet resultSet = preparedStatement.executeQuery();
    	String nextDate_day = dateFormat_day_no.format(startDate);
    	curTimes = 1;
    	if(resultSet.next()){
    		startDate = resultSet.getTimestamp("etime");
    		if(nextDate_day.equals(dateFormat_day_no.format(resultSet.getDate("time")))){
    			curTimes = resultSet.getInt("times")+1;
    		}
//    		//不能用before，不然如果开奖时间和触发时间相同的话，也会触发加一。
//    		if(dateFormat_day_no.format(startDate).equals(dateFormat_day_no.format(resultSet.getDate("time")))
//    			&& startDate.getTime() - resultSet.getTimestamp("time").getTime() > 1000
//    			&& startDate.getTime() - resultSet.getTimestamp("time").getTime() < 1000*60*15){
//    			curTimes++;
//    		}
    		preQishu = resultSet.getString("qihao");
    		preNo = resultSet.getString("no");
//    		if(!nextDate_day.equals(dateFormat_day_no.format(resultSet.getDate("time")))
//    				&& resultSet.getDate("time").before(preTime)){
//    			preDate = dateFormat_day_no.format(nextOpenTime);
//    		}
    	}
    	
    	String str_times = String.format("%03d", curTimes);
    	qishu = dateFormat_day_no.format(startDate)+str_times;
    	resultSet.beforeFirst();
    	resultSetToList(resultSet);
    	//
    	preparedStatement = connection.prepareStatement("select * from earn_rate order by sort asc");
    	resultSet = preparedStatement.executeQuery();
    	resultSet.last(); //结果集指针知道最后一行数据  
		int earnRatePathArrayLength = resultSet.getRow();  
		earnRatePathArray = new String[earnRatePathArrayLength];
		resultSet.beforeFirst();
		int i=0;
    	while(resultSet.next()){
    		String strTmp = resultSet.getDouble("efrom")+"*"+resultSet.getDouble("eend");
    		earnRatePathArray[i++] = strTmp;
    	}
    	
    	//
    	preparedStatement = connection.prepareStatement("select * from config where id order by id asc");
    	resultSet = preparedStatement.executeQuery();
    	while(resultSet.next()){
    		int id = resultSet.getInt("id");
    		String value = resultSet.getString("value");
    		double rate = 0;
    		if(id <=8){
    			rate = Double.valueOf(value);
    		}
    		
    		if(id == 1){
    			ballRate.danqiu = rate;
    		}else if(id == 2){
    			ballRate.daxiaodashuang = rate;
    		}else if(id == 3){
    			ballRate.he = rate;
    		}else if(id == 4){
    			ballRate.baozi = rate;
    		}else if(id == 5){
    			ballRate.shunzi = rate;
    		}else if(id == 6){
    			ballRate.duizi = rate;
    		}else if(id == 7){
    			ballRate.banshun = rate;
    		}else if(id == 8){
    			ballRate.zaliu = rate;
    		}else if(id == 9){
    			infos.bankName = value;
    		}else if(id == 10){
    			infos.bankCard = value;
    		}else if(id == 11){
    			infos.kaihuhang = value;
    		}else if(id == 12){
    			infos.bankPerson = value;
    		}else if(id == 13){
    			infos.zhifubao = value;
    		}else if(id == 14){
    			infos.weixin = value;
    		}else if(id == 15){
    			infos.notic = value;
    		}else if(id == 16){
    			infos.connect = value;
    		}
    	}
    	dbHelper.closeAll(connection, preparedStatement, resultSet);
    	isOk = true;
	}
	
	public static void beforeOpen() throws SQLException{
		isOk = false;
		SimpleDateFormat dateFormat_day_no = new SimpleDateFormat("yyyyMMdd");
		Date preStartDate = startDate;
		try {
			startDate = quartzdd.scheduler.getCurrentlyExecutingJobs().get(0).getFireTime();
			endDate = quartzdd.scheduler.getCurrentlyExecutingJobs().get(0).getNextFireTime();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
    	
		//查询最近所有的开奖结果
    	String nextDate_day = dateFormat_day_no.format(startDate);
    	int curTimesTmp = 1;
		if(nextDate_day.equals(dateFormat_day_no.format(preStartDate))){
			curTimesTmp = curTimes+1;
		}
		curTimes = curTimesTmp;
		String str_times = String.format("%03d", curTimes);
    	qishu = dateFormat_day_no.format(startDate)+str_times;
	}
	
	public static void loaded() throws SQLException{
		//查询最近所有的开奖结果
    	DbHelper dbHelper = new DbHelper();
    	Connection connection = dbHelper.getConnection();
    	PreparedStatement preparedStatement = connection.prepareStatement("select * from ssc order by id desc limit 0,25");
    	ResultSet resultSet = preparedStatement.executeQuery();
    	if(resultSet.next()){
    		preQishu = resultSet.getString("qihao");
    		preNo = resultSet.getString("no");
    	}
    	resultSet.beforeFirst();
    	resultSetToList(resultSet);
    	dbHelper.closeAll(connection, preparedStatement, resultSet);
		isOk= true;
	}
	
	public static boolean isCanOrder(String openQihao){
		if(endDate != null){
			if(qishu.equals(openQihao) && (endDate.getTime() - (new Date()).getTime() > 40)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	public static double getTrueMoney(int money){
		return ((double)money)/100;
	}
	
	public static double getTrueMoney(String money){
		return (Double.valueOf(money))/100;
	}
	
	public static int getFaceMoney(double money){
		return (int)money*100;
	}
}
