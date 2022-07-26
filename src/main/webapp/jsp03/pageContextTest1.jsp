<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
[ pageContext 객체 ]
- PageContext 클래스를 통해 톰캣에서 구현한 내장 객체
- JSP 페이지와 관련된 다른 내장 객체를 얻어내거나, 
  현재 페이지 요청과 응답의 제어권을 다른 페이지로 넘겨주는 역할 수행
  또한, 다른 내장 객체(request, session, application)들의 속성을 제어하는 기능 제공
- 현재 페이지 내에서만 유효한 객체(= 다른 페이지로 이동 시 새로운 pageContext 객체가 생성됨)
*/

// 자바 코드를 사용하여 pageContextTest2.jsp 페이지로 이동(= 포워딩)
// response.sendRedirect("pageContextTest2.jsp");
// => pageContextTest2.jsp 페이지로 새로운 요청이 발생하며
//    해당 페이지로 이동 시 웹브라우저 주소표시줄의 주소(URL)가 pageContextTest2.jsp 로 변경됨
// => 이처럼, 새로운 요청이 발생하여 포워딩 시 포워딩 되는 대상의 주소가 주소표시줄에 표시되는
//    즉, 주소표시줄의 주소가 변경되는 포워딩 방식을 "Redirect 방식" 의 포워딩이라고 한다!
// => 포워딩 결과 주소 : http://localhost:8080/StudyJSP/jsp03/pageContextTest2.jsp

// 또 다른 내장 객체인 pageContext 객체의 forward() 메서드를 호출하여 pageContextTest2.jsp 로 포워딩
pageContext.forward("pageContextTest2.jsp");
// => pageContextTest1.jsp 페이지에서 pageContextTest2.jsp 페이지로 포워딩 요청 발생 시
//    주소 표시줄의 주소가 포워딩 된 pageContextTest2.jsp 로 변경되지 않고
//    기존 주소인 pageContextTest1.jsp 페이지가 그대로 유지됨
// => 이처럼, 새로운 페이지 요청 시 기존 주소가 그대로 유지되는(= 변경되지 않는) 포워딩 방식을
//    "Dispatcher 방식" 의 포워딩이라고 한다!
// => 포워딩 결과 주소 : http://localhost:8080/StudyJSP/jsp03/pageContextTest1.jsp (주소 변경X)

// 위의 두 가지(response.sendRedirect(), pageContext.forward()) 이동 방식 모두
// 제어권이 포워딩 된 페이지로 넘어가므로 해당 코드 아래쪽의 코드들은 실행되지 않는다!
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 윗쪽의 포워딩 코드로 인해 실행되지 못하는 태그들(클라이언트에서 확인 불가) --%>
	<h1>pageContextTest1.jsp</h1>
	<script type="text/javascript">
		alert("확인");
	</script>
</body>
</html>












