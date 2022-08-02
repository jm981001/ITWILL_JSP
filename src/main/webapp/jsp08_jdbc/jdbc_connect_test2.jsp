<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_connect_test2.jsp</h1>
	<%
	// JDBC 연결 4단계
	// 1단계. JDBC 드라이버 클래스 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	%>
	<h3>드라이버 로드 성공!</h3>
	
	<%
	// 2단계. DB 연결(접속)
	DriverManager.getConnection("jdbc:mysql://localhost:3306/study_jsp3", "root", "1234");
	%>
	<h3>DB 연결 성공!</h3>
	<!-- 2단계까지는 데이터베이스 제품별로 정보가 달라지는 부분(드라이버 클래스도 다름) -->
	<!-- 3단계부터는 실제 데이터베이스 내의 SQL 구문 실행을 수행하므로 공통 작업에 해당 -->
</body>
</html>















