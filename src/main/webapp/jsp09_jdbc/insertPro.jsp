<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// insertForm.jsp 페이지에서 입력받아 전달된 폼 파라미터 값을 가져와서 변수에 저장하기
// POST 방식의 요청에 대한 한글 파라미터 처리
request.setCharacterEncoding("UTF-8");

// 폼 파라미터 가져오기
// String studentNo = request.getParameter("studentNo"); // 학번
// => 주의! request.getParameter() 메서드 리턴타입이 String 이지만
//    DB 의 학번 컬럼은 int 타입이므로 String -> int 변환해야한다!
// int studentNo = (int)request.getParameter("studentNo"); // 형변환 연산자를 통한 변환 사용 불가!
// => String -> int 변환 시 Integer 클래스의 static 메서드인 parseInt() 메서드를 호출하여
//    정수로 변환할 문자열을 파라미터로 전달하면 int 타입으로 변환 가능하다!
//    (int xxx = Integer.parseInt("문자열로 된 정수데이터");)
int studentNo = Integer.parseInt(request.getParameter("studentNo"));
// => 주의! 반드시 int 타입 범위 내의 데이터만 변환 가능하다!
String name = request.getParameter("name"); // 이름
String email = request.getParameter("email"); // 이메일
String phone = request.getParameter("phone"); // 전화번호
// ==========================================================================================
// JDBC 를 활용하여 MySQL - study_jsp3 데이터베이스 내의 student 테이블에 데이터 추가(INSERT)
// 0. DB 연결에 필요한 문자열 4개 저장
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp3";
String user = "root";
String password = "1234";

// 1단계. 드라이버 클래스 로드
Class.forName(driver);

// 2단계. DB 연결
Connection con = DriverManager.getConnection(url, user, password);
// out.println("DB 연결 완료!");

// 3단계. SQL 구문 작성 및 전달
// => student 테이블에 학번, 이름, 이메일, 전화번호 데이터를 추가(INSERT)
String sql = "INSERT INTO student VALUES (" + studentNo + ",'" + name + "','" + email + "','" + phone + "')";
PreparedStatement pstmt = con.prepareStatement(sql);

// 4단계. SQL 구문 실행 및 결과 처리
// => INSERT 구문이므로 PreparedStatement 객체의 executeUpdate() 메서드 호출
int count = pstmt.executeUpdate();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 정보 출력</h1>
	<!-- 폼 파라미터 값 출력 -->
	<h3>학번 : <%=studentNo %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>E-Mail : <%=email %></h3>
	<h3>전화번호 : <%=phone %></h3>
	<hr>
	<h3>학생 정보 DB 저장 완료 - <%=count %>개 레코드</h3>
</body>
</html>













