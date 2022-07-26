<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 스크립틀릿(자바의 메서드 내부와 동일)
// Calendar 클래스를 사용하여 현재 시각을 시, 분, 초로 분리하여 가져오기
Calendar c = Calendar.getInstance();
int hour = c.get(Calendar.HOUR_OF_DAY); // 시
int min = c.get(Calendar.MINUTE); // 분
int sec = c.get(Calendar.SECOND); // 초
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp - 스크립틀릿과 표현식 연습</h1>
	<%-- --%>
	<h3>현재 시각 : <%=hour%>시 <%=min%>분 <%=sec%>초 </h3>
	<%-- 
	스크립틀릿 내에서는 자바 실행문 사용이 가능하므로 if문 등도 사용 가능함
	=> 따라서, HTML 태그를 특정 조건에서만 실행되도록 하려면
	   if문 블록과 HTML 태그를 조합하여 조건에 따른 HTML 문장 실행
	
	< 자바 코드와 HTML 태그 조합 방법 - 2가지 >
	- 자바의 문장과 HTML 태그를 조합하여 조건에 따른(또는 반복에 따른) HTML 문장 실행 위해서는
	1. 스크립틀릿 내에서 출력할 데이터만 out.println() 메서드로 출력하는 방법
	   => HTML 태그보다 자바 코드가 더 많을 경우 주로 사용
	2. 스크립틀릿 내에서 조건문 등의 실행문을 지정하고 블럭문 내의 스크립틀릿 분리하여
	   스크립틀릿 외부에 HTML 태그 작성   
	   => 자바 코드보다 HTML 태그가 더 많을 경우 주로 사용
	--%>
	<%
	//1번 방법. 스크립틀릿~~ 노가다 가능성 있음(HTML 태그 안먹힘, 자바 코드 많을때 쓰기)
	// if 문을 사용하여 현재 시각(hour)이 12 미만이면 "오전입니다" 출력하고
	// 아니면 "오후입니다" 출력
	if(hour < 12){
		out.println("<h3>오전입니다</h3>");
	}else{
		out.println("<h3>오후입니다</h3>");
	}
	%>
	<hr>
	<%-- 2. 스크립틀릿으로 if문만 표현하고, 블록문 사이에 스크립틀릿을 단절시킨 후 HTML 태그 표현 --%>
	<%
	if(hour < 12) {
	%><h3>오전입니다</h3><%
	}else{	
	%> <h3>오후 입니다</h3><%
	}%>

	
	
	<hr>
	
	<%!
	//메서드 정의
	public int sum(){
		int total = 0; //합계를 누적할 변수
		// for문을 사용하여 1 ~ 100 까지의 합을 변수 total 에 누적한 후 누적 결과값을 리턴
		for (int i = 1; i <=100; i++){
			total+=i;
		}
		return total;
	}
	%>
	<h3>1부터 100까지의 합 :<%= sum() %></h3>
	
</body>
</html>