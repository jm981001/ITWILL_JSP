<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// pageName 파라미터 가져오기
String pageName = request.getParameter("pageName");
// out.println(pageName);
// 단, pageName 파라미터가 없을 경우(= null) 기본값으로 pageName 을 "main" 으로 설정
if(pageName == null) {
	pageName = "main";
}

// 미리 페이지명을 결정하는 경우
pageName = "includeTest3_" + pageName + ".jsp";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 여러 페이지를 하나의 페이지에 담도록 틀을 제공하는 페이지 : 템플릿 페이지 -->
	<table border="1">
		<tr>
			<td colspan="2" width="1024" height="200">
				<!-- include 액션태그로 includeTest3_top.jsp 페이지 포함시키기 -->
				<!-- "id" 파라미터 값으로 "admin" 값 전달 -->
				<jsp:include page="includeTest3_top.jsp">
					<jsp:param name="id" value="admin" />
				</jsp:include>
			</td>
		</tr>
		<tr>
			<td width="200" height="300">
				<jsp:include page="includeTest3_left.jsp"/>
			</td>
			<td>
<%-- 				<jsp:include page="includeTest3_main.jsp"/> --%>
				<!-- pageNum 파라미터 값에 따라 CENTER 영역에 각각 다른 페이지 표시 -->
				<!-- pageNum 파라미터가 갖는 파일명의 일부를 문자열 결합을 통해 파일명에 결합 -->
<%-- 				<jsp:include page='<%="includeTest3_" + pageName + ".jsp" %>'/> --%>

				<!-- 변수 선언 시 직접 문자열 결합을 통해 미리 페이지명을 지정할 수도 있음 -->
				<jsp:include page="<%=pageName %>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="200">
				<jsp:include page="includeTest3_bottom.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>











