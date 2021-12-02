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
	String teamName = request.getParameter("teamName");
	String headCoach = request.getParameter("headCoach");
	String clubowner = request.getParameter("clubowner");
	String hometown = request.getParameter("hometown");
	out.println(teamNumber);
	out.println(teamName);
	out.println(headCoach);
	out.println(clubowner);
	out.println(hometown);
	String sql = String.format("update team set teamName='%s',headCoach='%s',clubowner='%s',hometown='%s' where teamNumber='%s'",teamName,headCoach,clubowner,hometown,teamNumber);
	Connection conn = Conn.getInstance();
	conn.createStatement().execute(sql);
	response.sendRedirect("/soccer/");

	
%>

</body>
</html>