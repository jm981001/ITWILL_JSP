<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	2. include 액션 태그
	- 현재 페이지에 특정 페이지를 포함(include) 시키는 용도의 액션 태그
	- page 속성에 지정된 페이지로 제어권이 일시적으로 넘어간 후 해당 페이지에서 작업이 끝나면
	  다시 원래 페이지(현재 페이지)로 제어권이 돌아옴
	  => 결국, forward 액션 태그는 포워딩 된 후 그 위치에서 이전으로 돌아가지 않지만
	     include 액션 태그는 포워딩 작업 후 다시 원래 위치로 결과화면을 가지고 돌아감
	- forward 액션 태그와 마찬가지로 파라미터 전달 시 jsp:param 태그 사용
	--%>
	<h1>includeTest.jsp</h1>
	
	<!-- jsp:forward 액션태그로 includeTest2.jsp 페이지 지정할 경우 -->
	<!-- includeTest2.jsp 페이지로 이동함 -->
<%-- 	<jsp:forward page="includeTest2.jsp"></jsp:forward> --%>

	<!-- jsp:include 액션태그로 includeTest2.jsp 페이지 지정할 경우 -->
	<!-- includeTest2.jsp 페이지의 내용을 현재 페이지에 포함시킴(= 출력함) -->
<%-- 	<jsp:include page="includeTest2.jsp"/> --%>

	<!-- includeTest2.jsp 페이지로 파라미터값 전달할 경우 -->
	<jsp:include page="includeTest2.jsp">
		<jsp:param name="paramValue" value="Parameter Value"/>
	</jsp:include>
</body>
</html>











