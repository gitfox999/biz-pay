package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class InsertNo {
	//如果openInfo等于空的话，应回归订单
	public void insertAll(int[] nums,Date curNoDate,List<String> numRules,String openInfo,int inmoney) throws SQLException{
		SimpleDateFormat dateFormat_day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String noStr = "",preRowNo="";
		int id=1,max = 0,min =9,sum=0,cross=0,times =1;
		DbHelper dbHelper = new DbHelper();
		Connection connection = dbHelper.getConnection();
		connection.setAutoCommit(false);
		PreparedStatement preparedStatement = connection.prepareStatement("select * from ssc order by id desc limit 0,1");
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()){
			id = resultSet.getInt("id")+1;
			if(dateFormat_day.format(curNoDate).equals(dateFormat_day.format(resultSet.getDate("time")))){
				times = resultSet.getInt("times")+1;
			}
			preRowNo = resultSet.getString("no");
		}
		for (int i : nums) {
			noStr += String.valueOf(i);
			max = max > i ? max :i;
			min = min < i ? min :i;
			sum +=i;
		}
		for (int i=0;i< nums.length;i++) {
			int preRowNumTmp = 0;
			if(!preRowNo.equals("")){
				char[] charArray = preRowNo.toCharArray();
				preRowNumTmp = Integer.parseInt(charArray[i]+"");
			}
			insertNo(i,nums[i],id,preRowNumTmp,preparedStatement);
		}
		cross = max-min;
		String nowStr = dateFormat.format(new Date());
		String daxiao = sum >= 23 ? "大" : "小";
		String danshuang = sum%2 == 0 ? "双" : "单";
		String longhuhe = "龙";
		if(nums[0] - nums[4] <0){longhuhe = "虎";}
		if(nums[0] == nums[4]){longhuhe = "和";}
		String qian = "杂六";
		String zhong = "杂六";
		String hou = "杂六";
		Iterator<String> iterator = numRules.iterator();
		while (iterator.hasNext()) {
			String rule = (String) iterator.next();
			if("7_1".equals(rule)){
				qian = "豹子";
			}else if("7_2".equals(rule)){
				qian = "顺子";
			}else if("7_3".equals(rule)){
				qian = "对子";
			}else if("7_4".equals(rule)){
				qian = "半顺";
			}else if("8_1".equals(rule)){
				zhong = "豹子";
			}else if("8_2".equals(rule)){
				zhong = "顺子";
			}else if("8_3".equals(rule)){
				zhong = "对子";
			}else if("8_4".equals(rule)){
				zhong = "半顺";
			}else if("9_1".equals(rule)){
				hou = "豹子";
			}else if("9_2".equals(rule)){
				hou = "顺子";
			}else if("9_3".equals(rule)){
				hou = "对子";
			}else if("9_4".equals(rule)){
				hou = "半顺";
			}
		}
		String stime = dateFormat.format(CurOrder.startDate);
		String etime = dateFormat.format(CurOrder.endDate);
		String[] openNumInfoArray = openInfo.split(" ");
		int eartnRateTmp = Integer.parseInt(openNumInfoArray[3]);
		int eartMoney = Integer.parseInt(openNumInfoArray[2]);
		preparedStatement = connection.prepareStatement("insert into ssc values ("+id+",'"+noStr+"',"+sum+","+cross+",'"+nowStr+"',"+times
				+",'"+CurOrder.qishu+"','"+daxiao+"','"+danshuang+"','"+longhuhe+"','"+qian+"','"+zhong+"','"+hou+"','"+stime+"','"+etime
				+"',"+eartMoney+","+inmoney+","+eartnRateTmp+")");
		preparedStatement.execute();
		connection.commit();
		resultSet = preparedStatement.executeQuery("select * from ssc order by id desc limit 0,1");
		resultSet.next();
		int newSscId = resultSet.getInt("id")+1;
		fenzhang(connection,preparedStatement,numRules,newSscId,noStr);
		dbHelper.closeAll(connection, preparedStatement, resultSet);
	}
	
	private void insertNo(int pos,int num,int sscid,int preRowNum,PreparedStatement preparedStatement) throws SQLException{
		String[] posStrArray = {"a","b","c","d","e"};
		String tableName = "ssc_"+posStrArray[pos];
		int id = 1;
		boolean isHasData = false;
		boolean isDa = num >=5,isXiao = num<5,isJi=num%2 != 0,isOu=num %2 ==0;
		boolean isZhi = (num == 1 || num == 2 || num == 3 || num == 5 || num == 7);
		boolean isHe = (num == 0 || num == 4 || num == 6 || num == 8 || num == 9);
		boolean isLu0 = (num == 0 || num == 3 || num == 6 || num == 9);
		boolean isLu1 = (num == 1 || num == 4 || num == 7);
		boolean isLu2 = (num == 2 || num == 5 || num == 8);
		boolean isSheng = num-preRowNum > 0;
		boolean isPing = num-preRowNum == 0;
		boolean isJiang = num-preRowNum < 0;
		String[] otherStrArray = {"da","xiao","ji","ou","zhi","he","lu0","lu1","lu2","sheng","ping","jiang"};
		boolean[] otherBoolArray = {isDa,isXiao,isJi,isOu,isZhi,isHe,isLu0,isLu1,isLu2,isSheng,isPing,isJiang};
		int[] otherArray = new int[otherStrArray.length];
		for(int i=0;i<otherStrArray.length;i++){ otherArray[i] = 1;}
		int numCross = Math.abs(preRowNum - num);
		int[] numCrossArray = new int[10];
		for(int i=0;i<10;i++){ numCrossArray[i] = 1;}
		int[] numArray = new int[10];
		for(int i=0;i<10;i++){ numArray[i] = 1;}
		ResultSet resultSet = preparedStatement.executeQuery("select * from "+tableName+" order by id desc limit 0,1");
		if(resultSet.next()){
			isHasData = true;
			id = resultSet.getInt("id")+1;
		}
		for(int i=0;i<10;i++){
			int numTmp = isHasData ? resultSet.getInt("n"+i):0;
			numArray[i] = numTmp == -1 ? 1 : numTmp+1;
			
			int numCrossTmp = isHasData ? resultSet.getInt("z"+i):0;
			numCrossArray[i] = numCrossTmp == -1 ? 1 : numCrossTmp+1;
		}
		for(int i=0;i<otherStrArray.length;i++){
			if(!otherBoolArray[i]){
				int otherTmp = isHasData ? resultSet.getInt(otherStrArray[i]):0;
				otherArray[i] = otherTmp == -1 ? 1 : otherTmp+1;
			}else{
				otherArray[i] = -1;
			}
		}
		numArray[num] = -1;
		numCrossArray[numCross] = -1;
		StringBuffer buffer = new StringBuffer();
		for (int i : numArray) {
			buffer.append(","+i);
		}
		for (int i : otherArray) {
			buffer.append(","+i);
		}
		for (int i : numCrossArray) {
			buffer.append(","+i);
		}
		String sql = "insert into "+tableName+" values ("+id+","+sscid+buffer.toString()+")";
		preparedStatement.execute(sql);
	}
	
	private void fenzhang(Connection connection,PreparedStatement preparedStatement,List<String> numRules,int sscid,String num) throws SQLException{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startTime = simpleDateFormat.format(CurOrder.startDate);
		String endTime = simpleDateFormat.format(CurOrder.endDate);
		PreparedStatement preparedStatementQuery = connection.prepareStatement("select * from sscorder where otime >= '"+startTime+"' and otime <= '"+endTime+"'");
		ResultSet resultSet = preparedStatementQuery.executeQuery();
		int exeCount = 0;
		while (resultSet.next()) {
			exeCount++;
			int isWin = 0;
			String balltmp = resultSet.getInt("pos")+"_"+resultSet.getInt("num");
			int payMoney = resultSet.getInt("emoney");
			for(String ballcur : numRules){
				if(ballcur.equals(balltmp)){
					isWin = 1;
					break;
				}
			}
			String updateOrder = "update sscorder set iswin = "+isWin+",sscid = '"+sscid+"' where id = "+resultSet.getInt("id");
			preparedStatement.execute(updateOrder);
			if(isWin == 1){
				int memid = resultSet.getInt("memid");
				String nowStr = simpleDateFormat.format(new Date());
				String remark = "期数："+CurOrder.qishu+",开奖号码："+num+",投注详情："+resultSet.getString("detail")+",投注额："+(((double)resultSet.getInt("emoney"))/100);
				String winSql = "insert into flow (memid,money,type,dirction,ts,remark) values ("+memid+","+payMoney+",3,1,'"+nowStr+"','"+remark+"')";
				preparedStatement.execute(winSql);
				String updateMemSql = "update member set money=money+"+payMoney+" where id="+memid;
				preparedStatement.execute(updateMemSql);
			}
			if(exeCount % 100 == 0){
				connection.commit();
			}
		}
		connection.commit();
		resultSet.close();
		preparedStatementQuery.close();
	}
}
