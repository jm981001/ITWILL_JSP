  <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DELETE 구문을 사용하여 글번호(idx) 와 패스워드(passwd) 가 일치하는 게시물 삭제 후
// 삭제 성공 시 글목록(list.jsp) 으로 이동하고
// 삭제 실패 시(패스워드 틀림 등) 자바스크립트를 사용하여 "글 삭제 실패!" 출력 후 이전페이지로 돌아가기

// insertForm.jsp 페이지에서 입력받아 전달된 폼 파라미터 값을 가져와서 변수에 저장하기
// POST 방식의 요청에 대한 한글 파라미터 처리
request.setCharacterEncoding("UTF-8");

// 폼 파라미터 가져오기
int idx = Integer.parseInt(request.getParameter("idx")); // 학번
String passwd = request.getParameter("passwd"); // 이름
// ==========================================================================================
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp3";
String user = "root";
String password = "1234";
Class.forName(driver);
Connection con = DriverManager.getConnection(url, user, password);
String sql = "DELETE FROM board WHERE idx=? AND passwd= ? ";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);
pstmt.setString(2, passwd);
int count = pstmt.executeUpdate();
 

if(count > 0) { // 글쓰기 성공 시
	response.sendRedirect("list.jsp");
} else { // 실패 시
	%>
	<script>
		alert("글쓰기 실패!");
		location.href="../index.jsp";
		</script>
	<%
}

%>