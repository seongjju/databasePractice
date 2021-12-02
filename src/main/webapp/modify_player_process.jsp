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
	String teamNumber1 =request.getParameter("teamNumber1");
	String playerName=request.getParameter("playerName");
	String position = request.getParameter("position");
	String attribute = request.getParameter("attribute");
	out.println(teamNumber1);
	out.println(playerNumber);
	out.println(playerName);
	out.println(position);
	out.println(attribute);

	String sql = String.format("update player set playerName='%s',position='%s',attribute='%s' where playerNumber ='%s' and teamNumber1='%s'" ,playerName,position,attribute,playerNumber,teamNumber1);
	Connection conn = Conn.getInstance();
	conn.createStatement().execute(sql);
	response.sendRedirect("/soccer/player.jsp?teamNumber="+teamNumber1);

	
%>

</body>
</html>
