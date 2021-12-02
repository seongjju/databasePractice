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
	String teamNumber=request.getParameter("teamNumber");
	String teamName = request.getParameter("teamName");
	String headCoach = request.getParameter("headCoach");
	String clubowner = request.getParameter("clubowner");
	String hometown = request.getParameter("hometown");
	
	String checkSql=String.format("select count(*) as count from team where teamNumber='%s'",teamNumber);
	
	Connection conn=Conn.getInstance();
	
	ResultSet rs=conn.createStatement().executeQuery(checkSql);
	rs.next();
	int count=rs.getInt("count");
	if(count==0){

		String sql=String.format("insert team(teamNumber,teamName,headCoach,clubowner,hometown) values('%s','%s','%s','%s','%s')",
				teamNumber,teamName,headCoach,clubowner,hometown);
		conn.createStatement().execute(sql);
		response.sendRedirect("/soccer/");		
	}
	


%>
	<div class="container text-center">
		<div class="text-center">이미 가입된 팀번호입니다.</div>
		<a class="btn btn-primary" href="add_team.jsp">확인</a>
	</div>
</body>
</html>