package com.util;

import java.sql.SQLException;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * 定时器类
 */
public class TranslateTimer {

	private ScheduledExecutorService scheduler = Executors
			.newScheduledThreadPool(1);
	Calc calc = new Calc(); //操作实现类，我这里为翻译类

	public void executeTranslateTimer() {

		Runnable task = new Runnable() {
			public void run() {
				stop();
//				try {
////					calc.Open();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
			}
		};
        if (scheduler.isShutdown()) {
            scheduler = Executors.newScheduledThreadPool(1);
            scheduler.scheduleAtFixedRate(task, 0, 10, TimeUnit.SECONDS);
        } else {
            scheduler.scheduleAtFixedRate(task, 0, 10, TimeUnit.SECONDS); // 延迟10秒，每隔30秒翻译一次
        }
	}

 //停止任务，不再提交新任务，已提交任务会继续执行以致完成
  public void stop() {
        scheduler.shutdown();
  }
}