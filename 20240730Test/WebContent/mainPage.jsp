<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 파라미터 받기
	String id = request.getParameter("id");
	
	// 객체 생성
	MemberDao mDao = new MemberDao();
	ArrayList<NamePointDto> namePoint = mDao.namePoint(id);


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>	
		.fl {float : left}
		.fr {float : right}
		.img { margin-right : 20px;}
		.border {border : 1px solid black}
	</style>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			
			// 로그아웃
			$("#logout").click(function() {
				alert("로그아웃되었습니다.");
				window.location.href = "Login.jsp";
			});
			
			// 상품 사기 
			$(".product").click(function() {
			    var text = $(this).text();
			    var numberString = text.replace(/,/g, '');
			    var number = parseInt(numberString, 10); // 10은 10진수를 의미합니다.
			    // alert(number);
			    let point = $("#point").text();
			    //alert(point);
			    
			    if(number < point) {
			    	alert("컨텐츠를 구매하였습니다.");
			    	$("#point").text(point-number);
			    } else {
			    	alert("포인트가 부족합니다. 광과를 클릭하세요")
			    }
			}); 
			
			// 광고 클릭 
			$("#ad").click(function() {
				let rd = Math.floor(Math.random()*1000)+1;
				let point = $("#point").text();
				alert(point);
				$("#point").text(point+rd);
				alert(rd+ "점이 적립되었습니다");
				window.location.href = "https://koreaisacademy.com"
			});
		});
	</script>
	
</head>
<body>
	<div>
		<h1 class="fl">메인페이지</h1>
		<div class="fr">
			<div>
				<div class="fl"><%=namePoint.get(0).getName() %>님 안녕하세요.</div>
				<button id="logout" class="fl">로그아웃</button>
				<div style="clear:both;"></div>
			</div>
			<div>포인트 : <span id="point"><%=namePoint.get(0).getPoint() %></span>점</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<h3>구입할 컨텐츠를 선택하세요</h3>
	<div>
		<div class="fl img product">
			<img src="img/Intro_350_408.png" alt="상품1"/>
			<div>100,000 포인트</div>
		</div>
		<div class="fl img product">
			<img src="img/Java_350_408.png" alt="상품2"/>
			<div>500,000 포인트</div>
		</div>
		<div class="fl img product">
			<img src="img/Cpp_350_408.png" alt="상품3"/>
			<div>300,000포인트</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div id="ad" class="fr border">
		<div>광고</div>
		<img src="img/korea_it.png" alt="광고"/>
	</div>
	<div style="clear:both;"></div>
	
	
</body>
</html>