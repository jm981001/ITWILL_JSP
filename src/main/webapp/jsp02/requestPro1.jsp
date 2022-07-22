<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro1.jsp</h1>
	<h1>request 객체 예제(처리 페이지)</h1>
	<%
	/*
	requestForm1.jsp 페이지에서 submit 버튼 클릭 시
	form 태그 내의 데이터(= 폼 파라미터)가 request 객체에 모두 저장되고
	action 속성에 지정된 페이지로 이동(= 요청)하면서 데이터 전달됨
	=> 요청 관련 모든 정보는 request 객체가 관리(= JSP 가 자동으로 생성하는 객체 = 내장 객체)
	   따라서, request.메서드명() 형태로 request 객체에 접근 가능
	=> 요청받은 request 객체에 저장된 폼 파라미터 데이터를 가져오는 방법
	   1) request.getParameter("파라미터명"); // 단일 항목 데이터 가져오기(String 타입 리턴)
	   2) request.getParameterValues("파라미터명"); // 복수 항목 파라미터 가져오기(String[] 타입 리턴)
	=> 주의! 전달받은 파라미터가 존재하지 않을 경우(지정한 이름이 없을 경우) null 값이 리턴되고,
	   파라미터는 있으나 데이터가 없는 경우 널스트링("") 이 리턴됨
	*/
	
	// 1. 파라미터 중 파라미터명(name 속성값)이 "name" 인 값 가져와서 String 타입 strName 에 저장
	String strName = request.getParameter("name");
	// 스크립틀릿 내에서 웹브라우저에 데이터 출력할 경우 out.print() 또는 out.println() 사용
// 	out.println("이름 : " + strName + "<br>");
	
	// 2. 파라미터 중 파라미터명(name 속성값)이 "age" 인 값 가져와서 String 타입 strAge 에 저장
	String strAge = request.getParameter("age");
// 	out.println("나이 : " + strAge + "<br>");
	
	// 3. 파라미터 중 파라미터명(name 속성값)이 "gender" 인 값 가져와서 String 타입 strGender 에 저장
	String strGender = request.getParameter("gender");
// 	out.println("성별 : " + strGender + "<br>");	
	
	// 4. 파라미터 중 파라미터명(name 속성값)이 "hobby" 인 값 가져와서 String 타입 strHobby 에 저장
// 	String strHobby = request.getParameter("hobby");
	// 주의! 복수개의 데이터가 하나의 파라미터로 전달되는 경우(ex. 체크박스)
	// getParameter() 메서드를 사용하면 하나의 데이터(첫번째)만 가져올 수 있음
	// 따라서, getParameter() 메서드 대신 getParameterValues() 메서드를 호출하여
	// 복수개의 동일한 이름의 파라미터를 String[] 타입 배열로 리턴받아 처리해야함
// 	out.println("취미 : " + strHobby + "<br>"); // 취미 중 첫번째로 체크된 항목만 출력됨
	String[] strHobbies = request.getParameterValues("hobby");
//	out.println("취미 : " + strHobbies + "<br>");
//
//

	%>
	
	<table border="1">
		<tr>
			<td>이름</td><td><%=strName %></td>
		</tr>
		<tr>
			<td>나이</td><td><%=strAge %></td>
		</tr>
		<tr>
			<td>성별</td><td><%=strGender %></td>
		</tr>
<!-- 		<tr> -->
<%-- 			<td>취미</td><td><%=strHobbies %></td> --%>
<!-- 		</tr> -->
	</table>
	
</body>
</html>
