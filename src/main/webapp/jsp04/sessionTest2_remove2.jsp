<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_remove2.jsp</h1>
	<%
	// 세션 객체에 저장된 "sessionValue2" 라는 이름의 세션 속성 제거(= 세션값 삭제)
	session.removeAttribute("sessionValue2");
	// 세션값 삭제 후 sessionTest2_get.jsp 페이지로 포워딩(이동)
	response.sendRedirect("sessionTest2_get.jsp");
	%>
</body>
</html>