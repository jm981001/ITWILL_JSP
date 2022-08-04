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
int studentNo = Integer.parseInt(request.getParameter("studentNo")); // 학번
String name = request.getParameter("name"); // 이름
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
// => student 테이블에서 학번과 이름이 일치하는 레코드 삭제(DELETE)
String sql = "DELETE FROM student WHERE student_no=? AND name=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, studentNo);
pstmt.setString(2, name);

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
	<h1>학생 삭제 정보 출력</h1>
	<!-- 폼 파라미터 값 출력 -->
	<h3>학번 : <%=studentNo %></h3>
	<h3>이름 : <%=name %></h3>
	<hr>
	<h3>학생 정보 DB 저장 완료 - <%=count %>개 레코드</h3>
</body>
</html>













