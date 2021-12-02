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
		String coachNumber=request.getParameter("coachNumber");
		String teamNumber2=request.getParameter("teamNumber2");
		String coachName=request.getParameter("coachName");
		String trait=request.getParameter("trait");
	

		String sql=String.format("select coachNumber,teamNumber2,coachName,trait from coach where coachNumber ='%s' ", coachNumber);

		Connection conn=Conn.getInstance();
		ResultSet rs=conn.createStatement().executeQuery(sql);
		rs.next();
		
		pageContext.setAttribute("coachNumber",coachNumber);
		pageContext.setAttribute("teamNumber2", teamNumber2);
		pageContext.setAttribute("coachName", coachName);
		pageContext.setAttribute("trait",trait);
%>
<div class="container">
		<form class="form" method="post" action="modify_coach_process.jsp">
			<input value='<c:out value="${ coachNumber }"></c:out>' readonly type="text" name="coachNumber" placeholder="코치번호를 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ teamNumber2 }"></c:out>' readonly type="text" name="teamNumber2" placeholder="팀번호를 그대로 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ coachName }"></c:out>' type="text" name="coachName" placeholder="코치이름을 입력해주세요" class="form-control mt-2">
			<input value='<c:out value="${ trait }"></c:out>' type="text" name="trait" placeholder="특성 입력해주세요" class="form-control mt-2">	
			<input type="submit" value="코치 수정" class="form-control btn-primary mt-3" > 
		</form>
	</div>
</body>
</html>