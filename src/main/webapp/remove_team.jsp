<%@page import="soccer.Conn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8");
	String teamNumber=request.getParameter("teamNumber");


	String sql=String.format("delete from team where teamNumber='%s'",teamNumber);	
	Connection conn=Conn.getInstance();
	conn.createStatement().execute(sql);
	response.sendRedirect("/soccer/");
%>
</body>
</html>