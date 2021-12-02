<%@page import="java.sql.ResultSet"%>
<%@page import="soccer.Conn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8");
	String teamNumber=request.getParameter("teamNumber");
	String sql=String.format("select teamNumber,teamName,headCoach,clubowner,hometown from team where teamNumber='%s'", teamNumber);
	Connection conn=Conn.getInstance();
	ResultSet rs=conn.createStatement().executeQuery(sql);
	rs.next();
	String teamName=rs.getString("teamName");
	String headCoach = rs.getString("headCoach");
	String clubowner = rs.getString("clubowner");
	String hometown = rs.getString("hometown");
	
	pageContext.setAttribute("teamNumber",teamNumber);
	pageContext.setAttribute("teamName", teamName);
	pageContext.setAttribute("headCoach", headCoach);
	pageContext.setAttribute("clubowner", clubowner);
	pageContext.setAttribute("hometown", hometown);	
	
%>
	<div class="container">
		<form class="form" method="post" action="modify_team_process.jsp">
			<input value='<c:out value="${ teamNumber }"></c:out>' readonly type="text" name="teamNumber" placeholder="팀 번호를 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ teamName }"></c:out>' type="text" name="teamName" placeholder="팀 이름을 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ headCoach }"></c:out>' type="text" name="headCoach" placeholder="감독을 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ clubowner }"></c:out>' type="text" name="clubowner" placeholder="구단주를 입력해주세요" class="form-control mt-2">	
			<input value='<c:out value="${ hometown }"></c:out>' type="text" name="hometown" placeholder="연고지를 입력해주세요" class="form-control mt-2">		
			<input type="submit" value="팀 수정" class="form-control btn-primary mt-3" > 
		</form>
	</div>
</body>
</html>