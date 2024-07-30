<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String point = request.getParameter("point");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원관리-수정관리자</h1>
	<form action="MemberFixServlet">
		<input type="text" name="id" value="<%=id%>" readonly /><br/>
		<input type="text" name="pw" value="<%=pw%>" /><br/>
		<input type="text" name="name" value="<%=name%>" /><br/>
		<input type="text" name="point" value="<%=point%>" /><br/>
		<button type="submit">제출</button><br/>
	</form>
</body>
</html>