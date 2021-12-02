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
%>
	<div class="container">
		<form class="form" method="POST" action="add_player_process.jsp">
			<input type ="hidden" value ="<%=teamNumber%>" name="teamNumber1">
			<input name="playerNumber" placeholder="선수번호" class = "form-control">
			<input name="playerName" placeholder="선수이름" class = "form-control">
			<input name="position" placeholder="포지션" class = "form-control">	
			<input name="attribute" placeholder="특성" class = "form-control">	
			<input type="submit" value="선수추가"class="form-control btn btn-primary">
			</form>
	</div>

</body>
</html>