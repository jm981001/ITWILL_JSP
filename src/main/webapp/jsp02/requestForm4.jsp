<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestForm4.jsp - 로그인 화면</h1>
	<!-- 아이디와 패스워드를 입력받고, 로그인 버튼 클릭 시 requestPro2.jsp 페이지로 이동 -->
	<!-- form 태그 작성 - 이동할 페이지 : requestPro2.jsp    메서드 : POST 방식 -->
	<form action="requestPro4.jsp" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required="required"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="passwd" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>












