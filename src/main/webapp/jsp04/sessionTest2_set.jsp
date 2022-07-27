<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_set.jsp</h1>
	<%
	// session 객체에 값(데이터)을 저장하는 방법
	// => session.setAttribute("속성명", 속성값);
	// => 첫번째 파라미터 : 저장할 값을 지정하는 이름(= 속성명 = 키) = 변수명 역할과 동일한 String 타입
	//    두번째 파라미터 : 세션 객체에 저장할 값(데이터) => 데이터 타입은 무관함
	session.setAttribute("sessionValue1", "첫번째 세션값입니다!");
	// => "sessionValue1" 이라는 이름으로 "첫번째 세션값입니다!" 문자열을 저장
	
	// "sessionValue2" 라는 이름으로 "두번째 세션값입니다!" 문자열을 저장
	session.setAttribute("sessionValue2", "두번째 세션값입니다!");
	%>
	
	<!-- 
	임시) session 객체로부터 값(데이터) 꺼내는 방법
		=> session.getAttribute("데이터");
		   (파라미터 : 저장된 값을 지정하는 이름
	-->
	<h3>세션에 저장된 값 : <%=session.getAttribute("sessionValue1") %></h3>
	<h3>세션에 저장된 값 : <%=session.getAttribute("sessionValue2") %></h3>
	<hr>
	
	<h1>세션값 생성 및 저장 완료!</h1>
	<h3><a href="sessionTest2_get.jsp">세션값 확인</a></h3>
	<h3><a href="sessionTest2.jsp">돌아가기</a></h3>
</body>
</html>






















