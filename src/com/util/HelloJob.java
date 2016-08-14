package com.util;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class HelloJob implements Job {
    

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
    	
    	Date preTime = arg0.getPreviousFireTime();
    	Date nowTime = arg0.getFireTime();
    	//第一次运行时记得减去10分钟，因为获取不到上一次执行时间
    	if(preTime == null){
    		Calendar cal = Calendar.getInstance();
            cal.setTime(nowTime);
            cal.add(Calendar.MINUTE, -10);
            preTime = cal.getTime();
    	}
    	Calc calc = new Calc();
    	try {
    		calc.Open(preTime,nowTime);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

}