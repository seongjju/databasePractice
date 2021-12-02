<%@page import="java.util.List" %>
<%@page import ="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="soccer.*" %>
<%@page import="java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%
	Connection connection=Conn.getInstance();
	ResultSet result = connection.createStatement().executeQuery("select * from team");		
		
	List<Team> teamList = new ArrayList<Team>();
	while(result.next()){
		String teamNumber=result.getString("teamNumber");
		
		Team team = new Team();
	 	team.setTeamNumber(result.getString("teamNumber"));
	 	team.setTeamName(result.getString("teamName"));
	 	team.setHeadCoach(result.getString("headCoach"));
	 	team.setClubowner(result.getString("clubowner"));
	 	team.setHometown(result.getString("hometown"));
	 	teamList.add(team);
	}
	
	pageContext.setAttribute("teamList", teamList);
%>
	
<div class="container">

<table class="table">
	<thead>	
		<tr>
			<th>팀번호</th>
			<th width="150px">선수등록</th>
			<th width="150px">코치등록</th>
			<th>팀이름</th>
			<th>감독</th>
			<th>구단주</th>
			<th>연고지</th>
			<th width="100px">삭제</th>
			<th width="100px">수정</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach var ="item" items ="${teamList }">
	
			<tr>
				<td><c:out value = "${item.teamNumber }"></c:out> </td>
				<td>
					<a href="player.jsp?teamNumber=<c:out value = "${item.teamNumber}"></c:out>
					" type="button" class="btn btn-danger">선수등록</a>
				</td>
					
				<td>
					<a href="coach.jsp?teamNumber=<c:out value = "${item.teamNumber}"></c:out>
					" type="button" class="btn btn-danger">코치등록</a>
				</td>
				
				<td><c:out value = "${item.teamName }"></c:out> </td>
				<td><c:out value ="${item.headCoach }"></c:out></td>
				<td><c:out value ="${item.clubowner }"></c:out></td>
				<td><c:out value ="${item.hometown }"></c:out></td>
				<td>
					<a href="remove_team.jsp?teamNumber=<c:out value = "${item.teamNumber}"></c:out>
					" type="button" class="btn btn-danger">삭제</a>
				</td>
				<td>
					<a href="modify_team.jsp?teamNumber=<c:out value = "${item.teamNumber}"></c:out>
					" type="button" class="btn btn-danger">수정</a>
				</td>
				
			
			</tr>
		</c:forEach>
	</tbody>		
</table>
	<a type ="button" class="btn btn-primary" href="add_team.jsp">사용자추가</a>
</div>
</body>
</html>
