<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
String user = "root"; // 계정명
String password = "1234"; // 패스워드
Class.forName(driver);
Connection con = DriverManager.getConnection(url, user, password);

String sql = "select * from member where id=? and passwd=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, passwd);


ResultSet rs = pstmt.executeQuery();


// 만약 조회 결과가 있을 경우 로그인 성공!!
if(rs.next()) {
	session.setAttribute("sId" , id);
	response.sendRedirect("../index.jsp");
}else{%>
<script>
	alert("로그인 실패!")
	history.back();
	</script>
<%} %>


