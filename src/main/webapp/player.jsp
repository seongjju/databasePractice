<%@page import="java.util.ArrayList"%>
<%@page import="soccer.Player"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="soccer.Conn"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String teamNumber=request.getParameter("teamNumber");
		String sql=String.format("select * from player where teamNumber1='%s'",teamNumber);
		
		Connection conn=Conn.getInstance();
		
		ResultSet rs=conn.createStatement().executeQuery(sql);
		
		List<Player> list =new ArrayList<>();
		
		while(rs.next()){
			Player player=new Player();
			player.setPlayerNumber(rs.getString("playerNumber"));
			player.setTeamNumber1(rs.getString("teamNumber1"));
			player.setPlayerName(rs.getString("playerName"));
			player.setPosition(rs.getString("position"));
			player.setAttribute(rs.getString("attribute"));
			
			list.add(player);
		}
		pageContext.setAttribute("list",list);	
		pageContext.setAttribute("teamNumber",teamNumber);
	%>
<div class="container">
	<table class="table">
		<thead>
			<tr>
				<th>선수번호</th>
				<th>팀번호</th>
				<th>선수이름</th>
				<th>포지션</th>
				<th>특성</th>
			<th width="100px">삭제</th>
			<th width="100px">수정</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list }" var="item">
				<tr>
					<td><c:out value="${item.playerNumber }"></c:out></td>
					<td><c:out value="${item.teamNumber1 }"></c:out></td>
					<td><c:out value="${item.playerName }"></c:out></td>
					<td><c:out value="${item.position }"></c:out></td>
					<td><c:out value="${item.attribute }"></c:out></td>
					
					<td>
						<a href="remove_player.jsp?playerNumber=<c:out value = "${item.playerNumber}"></c:out>
						&teamNumber1=<c:out value ="${item.teamNumber1}"></c:out>
						
						" type="button" class="btn btn-danger">삭제</a>
						</td>
						
						<td>
						<a href="modify_player.jsp?playerNumber=<c:out value = "${item.playerNumber}" ></c:out>
						&teamNumber1=<c:out value ="${item.teamNumber1 }"></c:out>
						&playerName=<c:out value ="${item.playerName }"></c:out>
						&position=<c:out value ="${item.position }"></c:out>
						&attribute=<c:out value ="${item.attribute }"></c:out>
						
						" type="button" class="btn btn-danger">수정</a>
					</td>
					
					
					
				
			
				
				</tr>
			</c:forEach>
		</tbody>
						
	</table>
	
	<a class="btn btn-primary" href="add_player.jsp?teamNumber=<c:out value="${teamNumber}"></c:out>">선수 추가</a>

	<a type ="button" class="btn btn-primary" href=http://localhost:8080/soccer/>메인으로 이동</a>

	
</div>
	
</body>
</html>