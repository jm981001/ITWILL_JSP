<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2.jsp</h1>
	<!-- 
	하이퍼링크를 사용하여 "세션값 생성" 링크 클릭 시 "sessionTest2_set.jsp" 페이지로 이동하고,
	"세션값 삭제" 링크 클릭 시 "sessionTest2_remove.jsp" 페이지로 이동
	(동일한 작업을 버튼으로도 작업해보기)
	-->
	<h3><a href="sessionTest2_set.jsp">세션값 생성</a></h3>
	<h3><a href="sessionTest2_remove.jsp">세션값 삭제</a></h3>
	<hr>
	<input type="button" value="세션값 생성" onclick="location.href='sessionTest2_set.jsp'">
	<input type="button" value="세션값 삭제" onclick="location.href='sessionTest2_remove.jsp'">
</body>
</html>














