<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String jumin = request.getParameter("jumin1")+"-"+request.getParameter("jumin2");
String email = request.getParameter("email1")+ "@" +request.getParameter("email2");
String job = request.getParameter("job");
String gender = request.getParameter("gender");

String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
String user = "root"; // 계정명
String password = "1234"; // 패스워드

//1단계. 드라이버 클래스 로드
Class.forName(driver);

//2단계. DB 연결
Connection con = DriverManager.getConnection(url, user, password);
//out.println("DB 연결 완료!");

//3단계. SQL 구문 작성 및 전달
//=> student 테이블에서 학번과 이름이 일치하는 레코드의 이메일과 전화번호를 수정(UPDATE)
String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,now())";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, id);
pstmt.setString(3, passwd);
pstmt.setString(4, jumin);
pstmt.setString(5, email);
pstmt.setString(6, job);
pstmt.setString(7, gender);


//4단계. SQL 구문 실행 및 결과 처리
//=> INSERT 구문이므로 PreparedStatement 객체의 executeUpdate() 메서드 호출
int count = pstmt.executeUpdate();

if(count>0) {
	response.sendRedirect("../index.jsp");
}else{%>
<script>
	alert("회원가입 실패!")
	history.back();
	</script>
<%} %>


