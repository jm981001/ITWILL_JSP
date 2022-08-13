<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 request.setCharacterEncoding("UTF-8");
 int idx = Integer.parseInt(request.getParameter("idx"));
//  String name = request.getParameter("name");
 String passwd = request.getParameter("passwd");
 String subject = request.getParameter("subject");
 String content = request.getParameter("content");

 String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
 String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
 String user = "root"; // 계정명
 String password = "1234"; // 패스워드

 Class.forName(driver);

 Connection con = DriverManager.getConnection(url, user, password);

 String sql = " update board set subject=?, content=? where idx=? and passwd=?";
 PreparedStatement pstmt = con.prepareStatement(sql);
 pstmt.setString(1, subject);
 pstmt.setString(2, content);
 pstmt.setInt(3, idx);
 pstmt.setString(4, passwd);

 // 4단계. SQL 구문 실행 및 결과 처리
int count = pstmt.executeUpdate();
 
 if(count>0){
	 response.sendRedirect("content.jsp?idx=" + idx);
 }else{%>
	 <script >
	alert("글 수정 실패!")
	history.back();
</script>
 <% }%>    
