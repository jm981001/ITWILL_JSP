<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_connect_test1.jsp</h1>
	<%
	// JDBC 연결 4단계
	// 1단계. JDBC 드라이버 클래스 로드
	// Class.forName("패키지명.클래스명");
	Class.forName("com.mysql.cj.jdbc.Driver");
	/*
	드라이버 클래스가 존재하지 않거나(라이브러리가 없음), 이름이 틀린 경우 오류 발생
	=> HTTP 상태 500 – 내부 서버 오류 발생
	=> 자바 콘솔 화면에서도 확인 가능
	
	오류 메세지 : java.lang.ClassNotFoundException: com.mysql.cj.jdbc.Drive
	                        ~~~~~~~~~~~~~~~ 이 부분 주의 ~~~~~~~~~~~~~~~~~~
	=> com.mysql.cj.jdbc.Drive 라는 클래스가 없다는 의미이므로
	   1) 클래스 파일이 존재하는지(Build Path 등록되어 있는지) 확인
       2) 패키지명과 클래스명이 올바르게 입력되어 있는지 확인
	*/
	%>
	<h3>드라이버 로드 성공!</h3>
</body>
</html>











