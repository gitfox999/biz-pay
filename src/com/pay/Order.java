package com.pay;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import com.util.CurOrder;
import com.util.DbHelper;
import com.util.OrderExplain;

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
			response.getWriter().write("<script type=\"text/javascript\">alert(\"��δ��½�����¼��\");parent.parent.location.href='index.jsp';</script>");
			return;
		}
		int allMoney = 0;
		int curMoney = 0;
		String msg = "�����˻���Ȳ�����б���Ͷע�����ֵ���ڽ���Ͷע��";
		String memId = session.getAttribute("id").toString();
		Iterator<String> iterator = request.getParameterMap().keySet().iterator();
		try {
			DbHelper dbHelper = new DbHelper();
			Connection connection = dbHelper.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from member where id = "+memId);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(!resultSet.next()){
				response.getWriter().write("<script type=\"text/javascript\">alert(\"�����ڸ��û�\");parent.parent.location.href='index.jsp';</script>");
				return;
			}else{
				allMoney = resultSet.getInt("money");
			}
			List<String> sqlList = new ArrayList<String>();
			double allWin = 0;
			int sumCost = 0;
			curMoney = allMoney;
			int ocount = 0;
			Map<String, String> orderMap = OrderExplain.getMap();
			connection.setAutoCommit(false);
			while (iterator.hasNext()) {
				String paramName = (String) iterator.next();
				if(!"".equals(request.getParameter(paramName))){
					String money = request.getParameter(paramName);
					int imoney = Integer.parseInt(money)*100;
					//���������Ƿ��㹻
					String[] balls = paramName.split("_");
					sumCost += imoney;
					String nowStr = dateFormat.format(new Date());
					int emoney = (int)(AllBall.getRate(Integer.parseInt(balls[1]), Integer.parseInt(balls[2]))*100*Integer.parseInt(money));
					allWin += emoney;
					String detail = orderMap.get(balls[1]+"_"+balls[2]);
					String sql = "insert into sscorder (pos,num,memid,otime,money,emoney,qihao,detail)  values ("+balls[1]+","+balls[2]+",'"+memId+"','"+nowStr+"',"+imoney+","+emoney+",'"+CurOrder.qishu+"','"+detail+"')";
					
					String remark = "������"+CurOrder.qishu+",Ͷע���飺"+detail+",Ͷע�"+imoney/100;
					String flowSql = "insert into flow (memid,money,type,dirction,ts,remark) values ("+memId+","+imoney+",2,0,'"+nowStr+"','"+remark+"')";
					
					sqlList.add(sql);
					sqlList.add(flowSql);
					ocount++;
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
				String nowStr = dateFormat.format(new Date());
				preparedStatement.execute("update member set money = '"+curMoney+"',ocount = ocount+"+ocount+",update_ts='"+nowStr+"' where id="+memId);
				connection.commit();
				msg = "Ͷע��ɣ����ȫ�н����㽫���"+((double)allWin)/100+"Ԫ����ף�����ˣ�";
			}
			dbHelper.closeAll(connection, preparedStatement, null);
			session.setAttribute("money", ((double)curMoney)/100);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().println("<script type=\"text/javascript\">parent.parent.$(\"#user_money\").html(\""+((double)curMoney)/100+"\");parent.parent.layer.msg(\""+msg+"\", 4, 3);</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
