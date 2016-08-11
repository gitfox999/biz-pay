package com.util;

import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * ��ʱ����
 */
public class TranslateTimer {

	private ScheduledExecutorService scheduler = Executors
			.newScheduledThreadPool(1);
	Calc calc = new Calc(); //����ʵ���࣬������Ϊ������

	public void executeTranslateTimer() {

		Runnable task = new Runnable() {
			public void run() {
				stop();
				calc.sysout(); //���ò���ʵ�ַ���
			}
		};
        if (scheduler.isShutdown()) {
            scheduler = Executors.newScheduledThreadPool(1);
            scheduler.scheduleAtFixedRate(task, 10, 30, TimeUnit.SECONDS);
        } else {
            scheduler.scheduleAtFixedRate(task, 10, 30, TimeUnit.SECONDS); // �ӳ�10�룬ÿ��30�뷭��һ��
        }
	}

 //ֹͣ���񣬲����ύ���������ύ��������ִ���������
  public void stop() {
        scheduler.shutdown();
  }
}