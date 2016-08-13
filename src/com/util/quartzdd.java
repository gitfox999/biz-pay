package com.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class quartzdd implements ServletContextListener {
    
    
    public static Scheduler scheduler = null;

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        
        /* 注册定时任务 */
        try {
            // 获取Scheduler实例
            scheduler = StdSchedulerFactory.getDefaultScheduler();
            scheduler.start();

            // 具体任务
            JobDetail job = JobBuilder.newJob(HelloJob.class).withIdentity("job1", "group1").build();

            CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule("10 9,19,29,39,49,59 * * * ?");
            Trigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger1", "group1")
                    .withSchedule(cronScheduleBuilder).build();

            // 交由Scheduler安排触发
            scheduler.scheduleJob(job, trigger);
            
        } catch (SchedulerException se) {
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        
        /* 注销定时任务 */
        try {
            // 关闭Scheduler
            scheduler.shutdown();
            
        } catch (SchedulerException se) {
        }
    }

}