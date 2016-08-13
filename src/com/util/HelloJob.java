package com.util;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class HelloJob implements Job {
    

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        // 此任务仅打印日志便于调试、观察
       	System.out.println("-----------");
    }

}