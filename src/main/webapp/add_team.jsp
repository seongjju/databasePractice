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
	<div class="container">
		<form class="form" method="post" action="add_team_process.jsp">
			<input type="text" name="teamNumber" placeholder="팀 번호를 입력해주세요" class="form-control mt-2">
			<input type="text" name="teamName" placeholder="팀 이름을 입력해주세요" class="form-control mt-2">
			<input type="text" name="headCoach" placeholder="감독을 입력해주세요" class="form-control mt-2">
			<input type="text" name="clubowner" placeholder="구단주를 입력해주세요" class="form-control mt-2">	
			<input type="text" name="hometown" placeholder="연고지를 입력해주세요" class="form-control mt-2">		
			<input type="submit" value="팀 생성" class="form-control btn-primary mt-3" > 
		</form></div>

</body>
</html>