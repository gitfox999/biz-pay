package com.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class quartzdd implements ServletContextListener {
    
    
    public static Scheduler scheduler = null;

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        
        /* ע�ᶨʱ���� */
        try {
            // ��ȡSchedulerʵ��
            scheduler = StdSchedulerFactory.getDefaultScheduler();
            scheduler.start();

            // ��������
            JobDetail job = JobBuilder.newJob(HelloJob.class).withIdentity("job1", "group1").build();

//            CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule("30 * * * * ?");
            CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule("0 5,10,15,25,35,45,55 * * * ?");
            Trigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger1", "group1")
                    .withSchedule(cronScheduleBuilder).build();

            // ����Scheduler���Ŵ���
            scheduler.scheduleJob(job, trigger);
        } catch (SchedulerException se) {
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        
        /* ע����ʱ���� */
        try {
            // �ر�Scheduler
            scheduler.shutdown();
            
        } catch (SchedulerException se) {
        }
    }

}