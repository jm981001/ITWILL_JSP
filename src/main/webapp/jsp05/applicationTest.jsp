<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>applicationTest.jsp</h1>
	<!-- 
	application 객체
	- 웹 애플리케이션 서버(WAS = 웹컨테이너 = 톰캣)에 대한 정보를 관리하는 객체
	- 웹 애플리케이션(= 프로젝트) 당 하나의 application 객체만 생성됨
	  => 애플리케이션 전체 영역에서 하나의 객체를 공유함
	     (세션은 접속자마다, 브라우저마다 새로운 session 객체 생성)
	- 서버가 시작되면 application 객체가 생성되고, 서버가 중단되면 객체가 제거됨
	-->
	<h3>서버 정보 : <%=application.getServerInfo() %></h3>
	<h3>서버 물리적 경로 정보 : <%=application.getRealPath("/") %></h3>
	<h3>서버 컨텍스트 경로 정보 : <%=application.getContextPath() %></h3>
</body>
</html>





















