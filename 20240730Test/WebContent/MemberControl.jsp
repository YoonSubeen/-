<%@page import="java.util.HashSet"%>
<%@page import="org.quartz.Trigger"%>
<%@page import="java.util.Set"%>
<%@page import="org.quartz.CronScheduleBuilder"%>
<%@page import="org.quartz.TriggerBuilder"%>
<%@page import="org.quartz.CronTrigger"%>
<%@page import="quartz.TestJob"%>
<%@page import="org.quartz.JobBuilder"%>
<%@page import="org.quartz.JobDetail"%>
<%@page import="org.quartz.JobDataMap"%>
<%@page import="org.quartz.Scheduler"%>
<%@page import="org.quartz.impl.StdSchedulerFactory"%>
<%@page import="org.quartz.SchedulerFactory"%>
<%@page import="dto.AdminDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.NamePointDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao mDao = new MemberDao();
	ArrayList<AdminDto> adminDto = mDao.admin();	
	
%>    
<%
	// 스케줄러
	// Scheduler 사용을 위한 인스턴스화
		SchedulerFactory schedulerFactory = new StdSchedulerFactory();
		Scheduler scheduler = schedulerFactory.getScheduler();
		// JOB Data 객체
		JobDataMap jobDataMap = new JobDataMap();
		jobDataMap.put("jobSays", "Say Hello World!");
		jobDataMap.put("myFloatValue", 3.1415f);
		/**
		* JobDetail 은 Job이 스케줄러에 추가될 때 Quartz Client에 의해 작성 (작업 인스턴스 정의)
		*
		* 또한 Job에 대한 다양한 속성 설정과 JobDataMap을 포함할 수 있으며,
		* JobDataMap은 Job 클래스의 특정 인스턴스에 대한 상태 정보를 저장하는 데 사용
		* - 작업 인스턴스가 실행될 때 사용하고자 하는 데이터 개체를 원하는 만큼 보유
		* - Java Map interface를 구현한 것으로 원시 유형의 데이터를 저장하고 검색하기 위한 몇 가지 편의 방법이 추가
		*/
		JobDetail jobDetail = JobBuilder.newJob(TestJob.class)
		.withIdentity("myJob", "group1")
		.setJobData(jobDataMap)
		.build();
		/**
		* Job의 실행을 trigger
		*
		* 작업을 예약하려면 트리거를 인스턴스화하고 해당 속성을 조정하여 예약 요구 사항을 구성
		*
		* - 특정시간 또는 특정 횟수 반복: SimpleTrigger
		* - 주기적 반복: CronTrigger (초 분 시 일 월 요일 연도)
		*/
		// CronTrigger
		CronTrigger cronTrigger = (CronTrigger) TriggerBuilder.newTrigger()
		.withIdentity("trggerName", "cron_trigger_group")
		.withSchedule(CronScheduleBuilder.cronSchedule("*/20 * * * * ?")) // 매 20초마다 실행
		.forJob(jobDetail)
		.build();
		
		Set<Trigger> triggerSet = new HashSet<Trigger>();
		triggerSet.add(cronTrigger);

		scheduler.scheduleJob(jobDetail, triggerSet, false);
		scheduler.start();    // 스케쥴러 시작
		System.out.println("<<스케줄러가 시작됨>>");
		Thread.sleep(7000);
		scheduler.shutdown(); // 스케쥴러 종료
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>	
		.fl {float : left}
		.fr {float : right}
		.border {border : 1px solid black}
		table, td, th {
		  border : 1px solid black;
		  border-collapse : collapse;
		}
		table {width : 1000px}
	</style>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
		    window.editData = function(id, pw, name, point) {
		        const url = 'MemberFix.jsp?id=' + encodeURIComponent(id) +
		                    '&pw=' + encodeURIComponent(pw) +
		                    '&name=' + encodeURIComponent(name) +
		                    '&point=' + encodeURIComponent(point);
		        window.location.href = url;
		    }
		    
		});
		
	</script>

</head>
<body>
	<div>
		<h1 class="fl">회원관리</h1>
		<button type="button" class="fr">로그인</button>
		<div style="clear:both;"></div>
	</div>
	<table>
		<tr>
			<td>ID</td>
			<td>PW</td>
			<td>NAME</td>
			<td>POINT</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<% for (AdminDto dto : adminDto) { %>
			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getPw() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getPoint() %></td>
				 <td><button type="button" onclick="editData('<%= dto.getId() %>', '<%= dto.getPw() %>', '<%= dto.getName() %>', '<%= dto.getPoint() %>')">수정</button></td>
				<td>
					<a id="delete" href="DeleteMemberServlet?id=<%= dto.getId() %>"><button type="button">삭제</button></a>
				</td>
			</tr>
		<% } %>
		
		
	</table>
	<br>
	<h1>스케줄러 관리</h1>
	<div>
		<button class="fl">스케줄러(20초마다 포인트1 증가)실행 시작</button>
		<button class="fl">스케줄러 실행 종료</button>
	</div>
</body>
</html>