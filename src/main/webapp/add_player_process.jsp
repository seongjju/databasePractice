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
	String playerName=request.getParameter("playerName");
	String position=request.getParameter("position");
	String attribute=request.getParameter("attribute");
	String sql=String.format("insert into player values('%s','%s','%s','%s','%s')"
			,playerNumber,teamNumber1,playerName,position,attribute);

	Connection conn=Conn.getInstance();
	conn.createStatement().execute(sql);
	response.sendRedirect("player.jsp?teamNumber="+teamNumber1);

%>

</body>
</html>