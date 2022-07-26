<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
// ----------------------------------------------------------------------
// 이 곳은 JSP 선언문(Declaration)으로 JSP 파일 전체 영역에서 사용 가능한
// 멤버변수 및 메서드를 선언하는 곳입니다.
// => 자바 클래스의 멤버레벨(클래스 내부, 메서드 외부)에 변수 및 메서드가 위치하는 것과 동일
	String str1 = "멤버(전역) 변수입니다.(웹)";

	public void method1() {
		System.out.println("선언문 내의 method1() 메서드 호출됨!(콘솔)");
	}

	// String 타입의 "method2() 메서드의 리턴값" 문자열을 리턴하는 method2() 메서드 정의
	public String method2() {

		return "method2()메서드의 리턴값 (웹)";

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp</h1>

	<h3>
		멤버변수 str1 =<%=str1%></h3>
	<h3>method2() 메서드 호출 결과 : <%=method2() %></h3>
	
	<%
	// 이 곳은 스크립틀릿 내부입니다.
	// 변수 선언이 가능하며, 해당 변수는 로컬 변수로 취급됨
	String str2 = "로컬(지역) 변수입니다.";
	
	// 다른 메서드를 호출하거나, 객체(인스턴스) 생성 등의 다양한 작업도 가능함
	method1();
	
	// System.out.println() 또는 print() 메서드 호출하여 이클립스 콘솔에 내용을 출력하거나
	System.out.println("이 문장은 이클립스 콘솔에 출력됩니다.(콘솔)");
	
	// out.println() 또는 print() 메서드 호출하여 웹브라우저에 내용 출력 가능함
	// => 문자열과 함께 HTML 태그도 그대로 사용 가능함
	out.println("<h3>스크립틀릿에서 출력한 데이터(웹)</h3>");
	
	// 스크립틀릿 내부에서는 메서드 정의 불가(= 자바에서 메서드 내에 메서드 정의 불가)
// 	public void method3() {}
	%>
	
	<h3>로컬변수 str2 = <%=str2 %></h3>
	
	<%-- 선언문보다 윗쪽에서 멤버변수에 접근 가능 --%>
	<h3>멤버변수 str3(선언문 위) = <%=str3 %></h3>
	
	<%-- 선언문을 사용하여 str3 멤버변수 선언하고 "멤버변수 str3 입니다" 로 초기화 --%>
	<%! String str3 = "멤버변수 str3 입니다."; %>
	<h3>멤버변수 str3(선언문 아래) = <%=str3 %></h3>
</body>
</html>