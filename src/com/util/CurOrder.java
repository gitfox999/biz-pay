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
	public static List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	
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
		Date nextOpenTime = null;
		Date preTime = null;
		try {
			nextOpenTime = quartzdd.scheduler.getTriggersOfJob(jobKey).get(0).getNextFireTime();
			preTime = quartzdd.scheduler.getTriggersOfJob(jobKey).get(0).getPreviousFireTime();
			if(quartzdd.scheduler.getCurrentlyExecutingJobs().size() > 0){
				preTime = quartzdd.scheduler.getCurrentlyExecutingJobs().get(0).getFireTime();
				nextOpenTime = quartzdd.scheduler.getCurrentlyExecutingJobs().get(0).getNextFireTime();
			}
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	//第一次运行时记得减去10分钟，因为获取不到上一次执行时间
    	if(preTime == null){
    		Calendar cal = Calendar.getInstance();
            cal.setTime(nextOpenTime);
            cal.add(Calendar.MINUTE, -10);
            preTime = cal.getTime();
    	}
    	startDate = preTime;
    	endDate = nextOpenTime;
    	
    	//查询最近所有的开奖结果
    	DbHelper dbHelper = new DbHelper();
    	Connection connection = dbHelper.getConnection();
    	PreparedStatement preparedStatement = connection.prepareStatement("select * from ssc order by id desc limit 0,25");
    	ResultSet resultSet = preparedStatement.executeQuery();
    	String nextDate_day = dateFormat_day_no.format(nextOpenTime);
    	curTimes = 1;
    	int preTimes =1;
    	String preDate = dateFormat_day_no.format(nextOpenTime);
    	if(resultSet.next()){
    		preTimes = resultSet.getInt("times");
    		if(nextDate_day.equals(dateFormat_day_no.format(resultSet.getDate("time")))){
    			curTimes = resultSet.getInt("times")+1;
    			
    		}
    		//不能用before，不然如果开奖时间和触发时间相同的话，也会触发加一。
    		if(dateFormat_day_no.format(preTime).equals(dateFormat_day_no.format(resultSet.getDate("time")))
    			&& preTime.getTime() - resultSet.getTimestamp("time").getTime() > 1000
    			&& preTime.getTime() - resultSet.getTimestamp("time").getTime() < 1000*60*15){
//    			preTimes++;
    			curTimes++;
    		}
//    		if(!nextDate_day.equals(dateFormat_day_no.format(resultSet.getDate("time")))
//    				&& resultSet.getDate("time").before(preTime)){
//    			preDate = dateFormat_day_no.format(nextOpenTime);
//    		}
    	}
    	String str_times = String.format("%03d", curTimes);
    	qishu = dateFormat_day_no.format(nextOpenTime)+str_times;
    	preQishu = preDate + String.format("%03d", preTimes);
    	resultSet.beforeFirst();
    	resultSetToList(resultSet);
    	dbHelper.closeAll(connection, preparedStatement, resultSet);
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
}
