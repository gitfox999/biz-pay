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
    	if(CurOrder.startDate == null){
    		CurOrder.startDate = arg0.getPreviousFireTime();
    		CurOrder.endDate = arg0.getFireTime();
	    	//��һ������ʱ�ǵü�ȥ10���ӣ���Ϊ��ȡ������һ��ִ��ʱ��
	    	if(CurOrder.startDate == null){
//	    		Calendar cal = Calendar.getInstance();
//	            cal.setTime(CurOrder.endDate);
//	            cal.add(Calendar.MINUTE, -10);
//	            CurOrder.startDate = cal.getTime();
	    		try {
					CurOrder.init();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		return;
	    	}
    	}else{
	    	Calc calc = new Calc();
	    	try {
	    		calc.Open();
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    }

}