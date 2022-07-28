<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardForm.jsp</h1>
	<form action="forwardPro.jsp" method="get">
		<!-- 
		form 태그 사용 시 GET 방식 또는 POST 방식에서 
		입력받는 데이터 외에 별도로 데이터를 포함시켜 전달해야하는 경우
		<input type="hidden" name="파라미터명" value="전달할 데이터"> 태그를 사용하여 전달 가능
		-->
		<input type="hidden" name="jumin" value="901010-1234567">
		
		<h3>아이디 : <input type="text" name="id"></h3>
		<h3>패스워드 : <input type="password" name="passwd"></h3>
		<input type="submit" value="전송">
	</form>
</body>
</html>















