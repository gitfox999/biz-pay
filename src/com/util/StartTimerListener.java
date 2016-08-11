package com.util;

import javax.servlet.ServletContextEvent;  
import javax.servlet.ServletContextListener;  
  
public class StartTimerListener implements ServletContextListener {  
  
    TranslateTimer tranTimer = null;  
  
    /** 
     * ����һ����ʼ������������һ������������ 
     */  
    public StartTimerListener() {  
        super();  
    }  
  
    /** 
     * ��Web�������е�ʱ���Զ�����Timer 
     */  
    public void contextInitialized(ServletContextEvent e) {  
        tranTimer = new TranslateTimer(); // �����������ݶ�ʱ��  
        tranTimer.executeTranslateTimer();  
    }  
  
    /** 
     * �÷������������� ��ʵ�� 
     */  
    public void contextDestroyed(ServletContextEvent e) {  
    }  
} 