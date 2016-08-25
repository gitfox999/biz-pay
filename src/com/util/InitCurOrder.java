package com.util;

import java.sql.SQLException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class InitCurOrder implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent e) {
	}

	public void contextInitialized(ServletContextEvent e) {
		try {
			CurOrder.init();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
