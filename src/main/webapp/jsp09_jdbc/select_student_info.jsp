<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// URL 파라미터로 전달받은 학번(studentNo 파라미터값) 가져와서 변수에 저장
int studentNo = Integer.parseInt(request.getParameter("studentNo"));

// 학번이 일치하는 레코드를 조회
// JDBC 연결 4단계
// DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
String user = "root"; // 계정명
String password = "1234"; // 패스워드

// 1단계. 드라이버 클래스 로드
Class.forName(driver);

// 2단계. DB 연결
// => 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
Connection con = DriverManager.getConnection(url, user, password);

// 3단계. SQL 구문 작성 및 전달
String sql = "SELECT * FROM student WHERE student_no=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, studentNo);

// 4단계. SQL 구문 실행 및 결과 처리
ResultSet rs = pstmt.executeQuery();

// 변수에 데이터를 저장 
// => 주의! 블럭문 내에서 저장 후 블럭문 밖에서 사용 불가능하므로 변수 선언을 블럭문 밖에서 해야함
String name = "";
String email = "";
String phone = "";

if(rs.next()) {
	// ResultSet 객체로부터 데이터 꺼내서 변수에 저장하기
	name = rs.getString("name");
	email = rs.getString("email");
	phone = rs.getString("phone");
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 상세 정보 조회</h1>
	<h3>학번 : <%=studentNo %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>E-Mail : <%=email %></h3>
	<h3>전화번호 : <%=phone %></h3>
</body>
</html>