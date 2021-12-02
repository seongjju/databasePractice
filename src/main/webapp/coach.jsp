<%@page import="java.util.ArrayList"%>
<%@page import="soccer.Coach"%>
<%@page import="java.util.List"%>
<%@page import="soccer.Conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
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
	String sql=String.format("select * from coach where teamNumber2 ='%s'",teamNumber);


	Connection conn = Conn.getInstance();
	
	ResultSet rs =conn.createStatement().executeQuery(sql);
	List<Coach> list=new ArrayList<>();

	while(rs.next()){
		Coach coach=new Coach();
		coach.setCoachNumber(rs.getString("coachNumber"));
		coach.setTeamNumber2(rs.getString("teamNumber2"));
		coach.setCoachName(rs.getString("coachName"));
		coach.setTrait(rs.getString("trait"));
		
		list.add(coach);
		
	}
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("teamNumber", teamNumber);	
%>
<div class = "container">
	<table class ="table">
	<thead>
		<tr>
			<th>코치번호</th>
			<th>팀번호</th>
			<th>코치이름</th>
			<th>특성</th>
		<th width="100px">삭제</th>
		<th width="100px">수정</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="item">
			<tr>
				<td><c:out value="${item.coachNumber}"></c:out></td>
				<td><c:out value="${item.teamNumber2}"></c:out></td>
				<td><c:out value="${item.coachName}"></c:out></td>
				<td><c:out value="${item.trait}"></c:out></td>
				<td>
					<a href="remove_coach.jsp?coachNumber=<c:out value = "${item.coachNumber}"></c:out>
					&teamNumber2=<c:out value ="${item.teamNumber2}"></c:out>
					
					" type="button" class="btn btn-danger">삭제</a>
					</td>
					
					<td>
					<a href="modify_coach.jsp?coachNumber=<c:out value = "${item.coachNumber}" ></c:out>
					&teamNumber2=<c:out value ="${item.teamNumber2 }"></c:out>
					&coachName=<c:out value ="${item.coachName }"></c:out>
					&trait=<c:out value ="${item.trait }"></c:out>
				
					
					" type="button" class="btn btn-danger">수정</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>	
		<a class="btn btn-primary" href="add_coach.jsp?teamNumber=<c:out value="${teamNumber }"></c:out>">코치 추가</a>
			
		<a type ="button" class="btn btn-primary" href=http://localhost:8080/soccer/>메인으로 이동</a>
	

</div>


</body>
</html>