package com.pay;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null){
			response.getWriter().println("<script type=\"text/javascript\">alert(\"您已登录超时，请重新登录！\")parent.location.href='index.jsp';</script>");
		}
		double allMoney = Double.parseDouble(session.getAttribute("money").toString());
		String memId = session.getAttribute("id").toString();
		Iterator<String> iterator = request.getParameterMap().keySet().iterator();
		DbHelper dbHelper = new DbHelper();
		Connection connection = dbHelper.getConnection();
		PreparedStatement preparedStatement = null;
		String msg = "您的账户额度不足进行本次投注，请充值后在进行投注！";
		List<String> sqlList = new ArrayList<String>();
		double allWin = 0;
		double sumCost = 0;
		double curMoney = allMoney;
		try {
			connection.setAutoCommit(false);
			while (iterator.hasNext()) {
				String paramName = (String) iterator.next();
				if(!"".equals(request.getParameter(paramName))){
					String money = request.getParameter(paramName);
					System.out.println(paramName+"--"+request.getParameter(paramName).toString());
					//现征集呢是否足够
					String[] balls = paramName.split("_");
					sumCost += Double.parseDouble(money);
					String nowStr = dateFormat.format(new Date());
					double emoney = AllBall.getRate(Integer.parseInt(balls[1]), Integer.parseInt(balls[2]))*Double.parseDouble(money);
					allWin += emoney;
					String sql = "insert into sscorder (pos,num,memid,otime,money,emoney)  values ("+balls[1]+","+balls[2]+",'"+memId+"','"+nowStr+"',"+money+","+emoney+")";
					sqlList.add(sql);
					
				}
			}
			if(allMoney >= sumCost){
				Iterator<String> sqlIterator = sqlList.iterator();
				while (sqlIterator.hasNext()) {
					String sql = (String) sqlIterator.next();
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.execute();
				}
				curMoney = allMoney - sumCost;
				preparedStatement.execute("update member set money = '"+curMoney+"' where id="+memId);
				connection.commit();
				msg = "投注完成！如果全中奖，你将获得"+allWin+"元奖金，祝您好运！";
			}
			dbHelper.closeAll(connection, preparedStatement, null);
			session.setAttribute("money", curMoney);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().println("<script type=\"text/javascript\">parent.parent.$(\"#user_money\").html(\""+curMoney+"\");parent.parent.layer.msg(\""+msg+"\", 4, 3);</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
