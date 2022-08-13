<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 다운캐스팅!! Object -> Stirng 
String sId = (String)session.getAttribute("sId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="right">
    <%if(sId == null){ %>
	<a href="member/loginForm.jsp">로그인</a> | <a href="member/joinForm.jsp">회원가입</a>
	<% }else{%>
	<%=sId %> 님 | <a href="member/logOut.jsp">로그아웃</a>
	<%
	if(sId.equals("admin")){%>
		| <a href="admin/admin_main.jsp">관리자페이지</a>
	<%} %>
	<%} %>
	
	
	
	</div>
	<div align="center">
		<a href="index.jsp">HOME</a> 상단메뉴1 상단메뉴2 상단메뉴3 상단메뉴4 상단메뉴5
	</div>
</body>
</html>