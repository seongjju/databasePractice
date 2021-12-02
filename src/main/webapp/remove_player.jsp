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
	String playerNumber=request.getParameter("playerNumber");
	String teamNumber1=request.getParameter("teamNumber1");

	String sql=String.format("delete from player where playerNumber ='%s' and teamNumber1='%s'",playerNumber,teamNumber1);	

	Connection conn=Conn.getInstance();
	conn.createStatement().execute(sql);
	//response.sendRedirect("/soccer/");
	response.sendRedirect("/soccer/player.jsp?teamNumber="+teamNumber1);
%>
</body>
</html>