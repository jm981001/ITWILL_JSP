<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 처리 후 성공 시 응답 화면</h1>
	
	<%-- request 객체의 부가적인 메서드 --%>
	<h3>서버 도메인명 : <%=request.getServerName() %></h3>
	<h3>서버 포트번호 : <%=request.getServerPort() %></h3>
	<h3>요청 URL : <%=request.getRequestURL() %></h3>
	<h3>요청 URI : <%=request.getRequestURI() %></h3>
	<h3>클라이언트 IP : <%=request.getRemoteAddr() %></h3>
	<h3>요청 프로토콜 : <%=request.getProtocol() %></h3>
	<h3>요청 방식 : <%=request.getMethod() %></h3>
	<h3>컨텍스트 경로 : <%=request.getContextPath() %></h3>
</body>
</html>
















