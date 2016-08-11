<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	StringBuffer sb = new StringBuffer("{\"numbers\":\"20160809000\",\"hm\":[\"4\",\"3\",\"5\",\"6\",\"8\"]"
			+ ",\"hms\":[31,\"\u5927\",\"\u5355\",\"\u864e\",\"\u6742\u516d\",\"\u534a\u987a\",\"\u534a\u987a\"]}");
	response.getWriter().print(sb.toString());
%>