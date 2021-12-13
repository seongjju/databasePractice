<%@page import="java.sql.ResultSet"%>
<%@page import="soccer.Conn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

	String checkSql=String.format("select count(*) as count from player where playerNumber='%s' and teamNumber1='%s'",playerNumber,teamNumber1);

	Connection conn=Conn.getInstance();
	
	ResultSet rs=conn.createStatement().executeQuery(checkSql);
	rs.next();
	int count=rs.getInt("count");
	if(count==0){

	
	String sql=String.format("insert into player values('%s','%s','%s','%s','%s')"
			,playerNumber,teamNumber1,playerName,position,attribute);

	conn.createStatement().execute(sql);
	response.sendRedirect("player.jsp?teamNumber="+teamNumber1);
	}
%>
<div class="container text-center">
		<div class="text-center">이미 가입된 선수번호입니다.</div>
		<a class="btn btn-primary" href="http://localhost:8080/soccer">확인</a>
		
		
		
		
	</div>
</body>
</html>