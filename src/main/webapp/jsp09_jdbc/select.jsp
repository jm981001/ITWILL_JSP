<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// student 테이블 전체 레코드를 조회하는 작업 수행(4단계 구문 실행까지만)
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
String sql = "SELECT * FROM student";
PreparedStatement pstmt = con.prepareStatement(sql);

// 4단계. SQL 구문 실행 및 결과 처리
ResultSet rs = pstmt.executeQuery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 목록 조회</h1>
	<!-- 학생 목록을 표시하기 위한 테이블 생성(제목열까지만 표시) -->
	<table border="1">
		<tr>
			<th width="100">학번</th>
			<th width="150">이름</th>
			<th width="250">E-Mail</th>
			<th width="200">전화번호</th>
			<th width="100"></th>
		</tr>
		<!-- while 문을 사용하여 ResultSet 객체에 대해 반복하면서 tr td 태그를 통해 데이터 출력 -->
		<%
		while(rs.next()) {
			// 컬럼인덱스로 접근 시
// 			int studentNo = rs.getInt(1);
// 			String name = rs.getString(2);
// 			String email = rs.getString(3);
// 			String phone = rs.getString(4);

			// 컬럼명으로 접근 시
			int studentNo = rs.getInt("student_no");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			
			// <tr><td></td></tr> 태그를 통해 1개 레코드(= 학생 1명) 출력하는 작업 반복
			// 1) 태그를 문자열로 생성하여 out.println() 메서드로 출력하는 방법
// 			out.println("<tr>");
// 			out.println("<td>" + studentNo + "</td>");
// 			out.println("<td>" + name + "</td>");
// 			out.println("<td>" + email + "</td>");
// 			out.println("<td>" + phone + "</td>");
// 			out.println("</tr>");
			
			// 2) 표현식을 사용하여 데이터를 출력하는 방법
			%>
			<tr>
				<td><%=studentNo %></td>
				<td><%=name %></td>
				<td><%=email %></td>
				<td><%=phone %></td>
				<!-- 한 명 학생의 상세 정보 조회를 위한 버튼 생성 -->
				<!-- 클릭 시 select_student_info.jsp 페이지로 이동(파라미터로 학번 전달) -->
				<td><button onclick="location.href='select_student_info.jsp?studentNo=<%=studentNo%>'">상세정보</button></td>
			</tr>
			<%
		}
		%>
	</table>
</body>
</html>


















