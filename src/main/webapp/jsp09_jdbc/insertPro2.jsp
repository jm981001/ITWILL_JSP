<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// POST 방식의 요청에 대한 한글 파라미터 처리
request.setCharacterEncoding("UTF-8");
// 폼 파라미터 가져오기
int studentNo = Integer.parseInt(request.getParameter("studentNo"));
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

//1단계. 드라이버 클래스 로드
Class.forName(driver);

//2단계. DB 연결
Connection con = DriverManager.getConnection(url, user, password);

// 3단계. SQL 구문 작성 및 전달
// => student 테이블에 학번, 이름, 이메일, 전화번호 데이터를 추가(INSERT)
// => 만능문자(?) 를 사용하여 PreparedStatement 객체를 통해 별도로 데이터를 교체하는 방법 사용
String sql = "INSERT INTO student VALUES (?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);
// PreparedStatement 객체의 setXXX() 메서드를 호출하여 데이터 교체
pstmt.setInt(1, studentNo);
pstmt.setString(2, name);
pstmt.setString(3, email);
pstmt.setString(4, phone);

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













