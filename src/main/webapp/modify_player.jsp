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
		String playerNumber=request.getParameter("playerNumber");
		String teamNumber1=request.getParameter("teamNumber1");
		String playerName=request.getParameter("playerName");
		String position=request.getParameter("position");
		String attribute=request.getParameter("attribute");
	

		String sql=String.format("select playerNumber,teamNumber1,playerName,position,attribute from player where playerNumber ='%s' ", playerNumber);

		Connection conn=Conn.getInstance();
		ResultSet rs=conn.createStatement().executeQuery(sql);
		rs.next();
		
		pageContext.setAttribute("playerNumber",playerNumber);
		pageContext.setAttribute("teamNumber1", teamNumber1);
		pageContext.setAttribute("playerName", playerName);
		pageContext.setAttribute("position",position);
		pageContext.setAttribute("attribute", attribute);	
%>
<div class="container">
		<form class="form" method="post" action="modify_player_process.jsp">
			<input value='<c:out value="${ playerNumber }"></c:out>' readonly type="text" name="playerNumber" placeholder="선수번호를 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ teamNumber1 }"></c:out>' readonly type="text" name="teamNumber1" placeholder="팀번호를 그대로 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ playerName }"></c:out>' type="text" name="playerName" placeholder="선수이름을 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ position }"></c:out>' type="text" name="position" placeholder="포지션을 입력해주세요" class="form-control mt-2">	
			<input value='<c:out value="${ attribute }"></c:out>' type="text" name="attribute" placeholder="특성을 입력해주세요" class="form-control mt-2">		
			<input type="submit" value="선수 수정" class="form-control btn-primary mt-3" > 
		</form>
	</div>
</body>
</html>