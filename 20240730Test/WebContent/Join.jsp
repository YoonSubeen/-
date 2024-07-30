<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$("#submit").click(function() {
			setTimeout(function() {
				alert("가입되었습니다. 로그인 해주세요.");
                window.location.href = "Login.jsp";
			
			
		});
	</script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="JoinServlet" method="post">
		ID : <input type="text" name="id"/> <br/>
		PW : <input type="password" name="pw" /> <br/>
		NAME : <input type="text" name="name" /> <br>
		<button id="submit" type="submit">작성완료</button>
	</form>
</body>
</html>