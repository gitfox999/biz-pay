<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.CurOrder"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	SimpleDateFormat dateFormat_day_no = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat dateFormat_day = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Map<String,Object> zuijin = CurOrder.list.get(0);
	String openNum = zuijin.get("no").toString();
	char[] charNumArray = openNum.toCharArray();
	int[] nums = new int[5];
	for(int i=0;i<5;i++){
		int num = Integer.valueOf(charNumArray[i]+"");
		nums[i] = num;
	}
	String sum = zuijin.get("sum").toString();
	String daxiao = zuijin.get("daxiao").toString();
	String danshuang = zuijin.get("danshuang").toString();
	String longhuhe = zuijin.get("longhuhe").toString();
	String qian = zuijin.get("qiansan").toString();
	String zhong = zuijin.get("zhongsan").toString();
	String hou = zuijin.get("housan").toString();
	StringBuffer sb = new StringBuffer("{\"isok\":\""+CurOrder.isOk+"\",\"numbers\":\""+CurOrder.preQishu+"\",\"hm\":[\""+nums[0]+"\",\""+nums[1]+"\",\""+nums[2]+"\",\""+nums[3]+"\",\""+nums[4]+"\"]"
			+ ",\"hms\":["+sum+",\""+daxiao+"\",\""+danshuang+"\",\""+longhuhe+"\",\""+qian+"\",\""+zhong+"\",\""+hou+"\"],\"hmlist\":{");
	Iterator<Map<String,Object>> iterator = CurOrder.list.iterator();
	iterator.next();
	while(iterator.hasNext()){
		Map<String,Object>  preOdds =  iterator.next();
		String noStr = dateFormat_day_no.format(dateFormat_day.parse(preOdds.get("time").toString()))+String.format("%03d", Integer.valueOf(preOdds.get("times").toString()));
		sb.append("\""+noStr+"\":[\""+preOdds.get("no")+"\"]");
		if(iterator.hasNext()) sb.append(",");
	}
	sb.append("}}");
	response.getWriter().print(sb.toString());
%>