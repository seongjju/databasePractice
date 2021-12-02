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
	String coachNumber=request.getParameter("coachNumber");
	String teamNumber2 =request.getParameter("teamNumber2");
	String coachName=request.getParameter("coachName");
	String trait=request.getParameter("trait");
	
	out.println(teamNumber2);
	out.println(coachNumber);
	out.println(coachName);
	out.println(trait);

	String sql = String.format("update coach set coachName='%s',trait='%s' where coachNumber ='%s' and teamNumber2='%s'" ,coachName,trait,coachNumber,teamNumber2);
	Connection conn = Conn.getInstance();
	conn.createStatement().execute(sql);
	response.sendRedirect("/soccer/coach.jsp?teamNumber="+teamNumber2);

	
%>

</body>
</html>
