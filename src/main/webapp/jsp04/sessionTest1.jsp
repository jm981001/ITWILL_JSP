<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest1.jsp</h1>
	<%--
	session 객체
	- JSP 에서 관리하는 내장 객체 중 하나
	- HttpSession 타입으로 관리
	- 클라이언트와 서버 사이의 연결 정보에 대해 관리 역할을 수행하는 객체(= 가상의 연결)
	- 주로, 페이지와 관계없이 어떤 정보를 유지하는 용도로 사용
	  ex) 로그인 후 아이디 정보를 기억하여 페이지 이동 시에도 로그인 상태가 유지되도록 함
          쇼핑몰 상품을 장바구니에 담은 후 페이지 이동 시에도 장바구니 목록이 유지되도록 함
    - 클라이언트가 서버에 접속 시 기본적으로 해당 클라이언트에 해당하는 기억장소(= 세션)가 생성되고
      자동으로 특수한 아이디(세션ID)값이 부여됨 => 주의! 로그인 등에 사용하는 아이디 개념이 아님!
    - 세션 유지 시간(maxInactiveInterval 값) 값만큼 세션 정보가 유지되며
      유지 시간동안 서버와 아무런 통신이 없을 경우 유지 시간 만료될 때 세션 정보 사라짐(= 제거)
      => 참고. 기본 maxInactiveInterval 값은 1800(초) = 30분
    - 세션 유지 시간과 관계없이 session 객체의 invalidate() 메서드를 호출하면 세션 초기화 됨
    - 또한, 웹브라우저 종료하면 세션이 초기화됨
	--%>
	<h3>새 세션 여부 : <%=session.isNew() %></h3>
	<h3>세션 ID : <%=session.getId() %></h3>
	<h3>세션 생성 시각 : <%=new Date(session.getCreationTime()) %></h3>
	<h3>마지막 세션 접근 시각 : <%=new Date(session.getLastAccessedTime()) %></h3>
	
	<!-- 세션 기본 유지시간(maxInactiveInterval) 값 확인 -->
	<h3>현재 세션 유지시간 : <%=session.getMaxInactiveInterval() %>초</h3>
	<hr>
	<!-- 세션 유지시간을 10초로 변경 -->
	<%session.setMaxInactiveInterval(10); %>
	<h3>현재 세션 유지시간 : <%=session.getMaxInactiveInterval() %>초</h3>
</body>
</html>















