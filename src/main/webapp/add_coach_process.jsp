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
	String coachNumber=request.getParameter("coachNumber");
	String teamNumber2=request.getParameter("teamNumber2");
	String coachName=request.getParameter("coachName");
	String trait=request.getParameter("trait");
	
	String checkSql=String.format("select count(*) as count from coach where coachNumber='%s' and teamNumber2='%s'",coachNumber,teamNumber2);
	
	Connection conn=Conn.getInstance();

	ResultSet rs=conn.createStatement().executeQuery(checkSql);
	rs.next();
	int count=rs.getInt("count");
	if(count==0){
		
	
	String sql=String.format("insert into coach values('%s','%s','%s','%s')"
			,coachNumber,teamNumber2,coachName,trait);

	conn.createStatement().execute(sql);
	response.sendRedirect("coach.jsp?teamNumber="+teamNumber2);
	}
%>

<div class="container text-center">
		<div class="text-center">이미 가입된 코치번호입니다.</div>
		<a class="btn btn-primary" href="http://localhost:8080/soccer">확인</a>
		
	</div>
</body>
</html>