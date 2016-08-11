package com.pay;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.AllBall;
import com.util.DbHelper;

/**
 * Servlet implementation class Order
 */
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		String memId = request.getSession().getAttribute("memId");
		Iterator<String> iterator = request.getParameterMap().keySet().iterator();
		DbHelper dbHelper = new DbHelper();
		Connection connection = dbHelper.getConnection();
		PreparedStatement preparedStatement = null;
		try {
			connection.setAutoCommit(false);
			while (iterator.hasNext()) {
				String paramName = (String) iterator.next();
				if(!"".equals(request.getParameter(paramName))){
					String money = request.getParameter(paramName);
					System.out.println(paramName+"--"+request.getParameter(paramName).toString());
					//ÏÖÕ÷¼¯ÄØÊÇ·ñ×ã¹»
					String[] balls = paramName.split("_");
					String nowStr = dateFormat.format(new Date());
					double emoney = AllBall.getRate(Integer.parseInt(balls[1]), Integer.parseInt(balls[2]))*Double.parseDouble(money);
					String sql = "insert into sscorder (pos,num,memid,otime,money,emoney)  values ("+balls[1]+","+balls[2]+",1,'"+nowStr+"',"+money+","+emoney+")";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.execute();
				}
			}
			connection.commit();
			dbHelper.closeAll(connection, preparedStatement, null);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
