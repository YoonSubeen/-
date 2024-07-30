<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script>
        $(function() {
            $("#submit").click(function(event) {
                event.preventDefault(); // 폼 제출 방지
                
                let id = $("#id").val();
                let pw = $("#pw").val();
                
                if (id === "admin") {
                    window.location.href = "MemberControl.jsp";
                } else {
                    window.location.href = "mainPage.jsp?id="+id;
                }
            });
        });
    </script>
</head>
<body>
    <h1>로그인</h1>
    <form id="loginForm">
        ID : <input id="id" type="text" name="id"/> <br/>
        PW : <input id="pw"type="password" name="pw"/> <br/>
        <button id="submit" type="submit">로그인</button>
    </form>
    <form action="Join.jsp">
        <button type="submit">회원가입</button>
    </form>
</body>
</html>
