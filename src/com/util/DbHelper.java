package com.util;

import java.sql.*;
import java.util.*;

public class DbHelper {

	private String sql; // 要传入的sql语句

	public void setSql(String sql) {
		this.sql = sql;
	}

	private List sqlValues; // sql语句的参数

	public void setSqlValues(List sqlValues) {
		this.sqlValues = sqlValues;
	}

	private Connection con; // 连接对象

	public void setCon(Connection con) {
		this.con = con;
	}


	/**
	 * 获取数据库连接
	 * 
	 * @return
	 */
	public Connection getConnection() {

		String driver_class = null;
		String driver_url = null;
		String database_user = null;
		String database_password = null;
		try {

			driver_class = "com.mysql.jdbc.Driver";
			driver_url = "jdbc:mysql://119.29.150.142:3306/biz?useUnicode=true&amp;characterEncoding=utf8";
			database_user = "root";
			database_password = "x5";

			Class.forName(driver_class);
			con = DriverManager.getConnection(driver_url, database_user, database_password);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	/**
	 * 关闭数据库
	 * 
	 * @param con
	 * @param pst
	 * @param rst
	 */
	public void closeAll(Connection con, PreparedStatement pst, ResultSet rst) {
		if (rst != null) {
			try {
				rst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (pst != null) {
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	 * 查找
	 * 
	 * @param sql
	 * @param sqlValues
	 * @return
	 */
	/*public ResultSet executeQuery() {
		ResultSet rst = null;
		PreparedStatement pst = null;
		try {

			pst = con.prepareStatement(sql);
			if (sqlValues != null && sqlValues.size() > 0) { // 当sql语句中存在占位符时
				setSqlValues(pst, sqlValues);
			}
			rst = pst.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(con, pst, rst);
		}

		return rst;
	}
*/
	/**
	 * 增删改
	 * 
	 * @return
	 */
	 /*public intexecuteUpdate() {
		int result = -1;
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(sql);
			if (sqlValues != null && sqlValues.size() > 0) { // 当sql语句中存在占位符时
				setSqlValues(pst, sqlValues);
			}
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(con, pst, null);
		}

		return result;
	}
*/
	/**
	 * 给sql语句中的占位符赋值
	 * 
	 * @param pst
	 * @param sqlValues
	 */
	private void setSqlValues(PreparedStatement pst, List sqlValues) {
		for (int i = 0; i < sqlValues.size(); i++) {
			try {
				pst.setObject(i + 1, sqlValues.get(i));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
