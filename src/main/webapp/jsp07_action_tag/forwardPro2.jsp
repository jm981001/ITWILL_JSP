<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardPro2.jsp</h1>
	
	<%
	request.setCharacterEncoding("UTF-8");
	// 이전페이지에서 forward 액션태그(또는 pageContext.forward())로 포워딩 할 경우
	// 기존의 request 객체가 그대로 유지됨
	// 따라서, 폼파라미터로 전달받은 데이터를 그대로 사용할 수 있다! (GET / POST 방식 무관)
	// => request 객체가 유지되므로 이전 페이지에서 설정한 인코딩 방식도 그대로 유지됨
	//    따라서, 이전 페이지에서 한글 파라미터가 정상적으로 표시됐다면
	//    현재 페이지에서도 별도의 설정 없이 한글 데이터가 깨지지 않고 정상적으로 표시된다!
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String jumin = request.getParameter("jumin");
	String name = request.getParameter("name");
	
	// forward 액션 태그에서 URL 에 포함시켜 전달한 파라미터(num) 가져오기
	String num = request.getParameter("num");
	String str = request.getParameter("str");
	%>
	
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>주민번호 : <%=jumin %></h3>
	<h3>이름 : <%=name %></h3>
	<hr>
	<h3>num : <%=num %></h3>
	<h3>str : <%=str %></h3>
</body>
</html>







