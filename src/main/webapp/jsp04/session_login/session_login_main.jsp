<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 객체에 저장된 세션 아이디("sId" 속성값) 가져와서 String 타입 변수 sId 에 저장
// => 주의! getAttribute() 메서드 리턴타입이 Object 이므로 String 타입에 저장 시 형변환 필수!
//    (Cannot convert from Object to String)
String sId = (String)session.getAttribute("sId");
// => 세션 아이디가 존재하지 않을 경우 null 값이 저장됨
// out.println(sId);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="right">
		<!-- 로그인 성공(= 세션 아이디("sId")가 존재할 경우)과 실패에 따라 다른 메뉴 표시 -->
		<!-- 로그인 실패 판별(= 세션 아이디 값이 null 인지 판별) -->
		<%if(sId == null) { // 세션 아이디가 존재하지 않을 경우 %>
			<a href="session_login_form.jsp">로그인</a> | <a href="session_join_form.jsp">회원가입</a>
		<%} else { // 세션 아이디가 존재할 경우 %>
			<%=sId %> 님 | <a href="session_logout.jsp">로그아웃</a>
		<%} %>
	</div>
	<h1 align="center">메인화면</h1>
</body>
</html>













