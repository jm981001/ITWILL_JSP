<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro2.jsp - 로그인 처리</h1>
	<%-- 아이디(id), 패스워드(passwd) 파라미터 가져와서 출력 --%>
	<%
	// 아이디, 패스워드 파라미터 가져와서 변수에 저장하기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	
	<%-- 
	아이디가 "admin" 이고, 패스워드가 "1234" 일 경우
	자바스크립트를 사용하여 "로그인 성공!" 출력하고, 
	아니면 "로그인 실패!" 출력 후 이전페이지로 돌아가기
	----------------------------------------------------------------
	주의! 자바 코드 내에서 문자열 데이터를 비교할 때
	동등비교연산자(==) 대신 String 객체의 equals() 메서드를 사용한다!
	< 기본 문법 >
	if(문자열변수명.equals("비교할문자열")) {}
	=> 문자열이 동일한지 판별 후 boolean 타입 결과 리턴(true : 같음, false : 다름)
	--%>
	<%if(id.equals("admin") && passwd.equals("1234")) { %>
		<h3>로그인 성공!</h3>
		<script type="text/javascript">
			alert("로그인 성공!");
		</script>
	<%} else { %>
		<h3>로그인 실패!</h3>
		<script type="text/javascript">
			alert("로그인 실패!");
			history.back();
		</script>
	<%} %>
</body>
</html>












