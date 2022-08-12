<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// 파라미터 중 글번호(idx)가 없을 경우(= null)
	// 자바스크립트를 사용하여 "잘못된 접근입니다!" 출력 후 메인페이지(index.jsp)로 돌아가기
	if(request.getParameter("idx") == null) {
		%>
	<script>
			alert("잘못된 접근입니다!");
			location.href = "../index.jsp";
		</script>
	<%
	}
	
	//
	//
	request.setCharacterEncoding("UTF-8");

// writeForm.jsp 페이지로부터 전달받은 폼파라미터(작성자, 비밀번호, 제목, 내용)를 가져와서
// 변수에 저장한 후 출력하기
String idx = request.getParameter("idx");
String name = request.getParameter("name");
String passwd = request.getParameter("passwd");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

// board 테이블에 폼 파라미터 사용하여 글쓰기 작업 수행(INSERT)
// => 단, 글번호(idx)는 가장 큰 번호 + 1 값으로 새로 설정
//    작성일(date)은 데이터베이스의 now() 함수 사용
//    조회수(readcount)는 기본값인 0 으로 설정

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

// -------------------------------------------------------------------------------------------
// 1) 새 글 번호 계산
// => board 테이블의 모든 레코드의 idx 컬럼값 중 가장 큰 값 조회(데이터베이스 max() 함수 활용)
// int idx = 1; // 새 글 번호를 저장할 변수 선언(기본값 1)

// 3단계. SQL 구문 작성 및 전달
// => MySQL 의 MAX(컬럼명) 함수를 사용하면 특정 컬럼에서 가장 큰 값 조회 가능
String sql = "SELECT * FROM board where idx=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, idx);

// 4단계. SQL 구문 실행 및 결과 처리
ResultSet rs = pstmt.executeQuery();
	
if(rs.next()){ %>
	<h1>글 수정</h1>
	<form action="updatePro.jsp" method="post">
	<input type="hidden" name="idx" value="<%=idx %>">
		<table border="1"> 
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name"  value="<%=rs.getString("name") %>" readonly="readonly" ></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" > </td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" required="required" value="<%=rs.getString("subject") %>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="20"
						required="required" ><%=rs.getString("content") %></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글수정"> <input
					type="reset" value="초기화"> <input type="button" value="취소"
					onclick="history.back()"></td>
			</tr>
		</table>
	</form>
	<% 
} else { // 실패 시
	%>
	<script>
		alert("잘못된 접근입니다");
		history.back();
	</script>
	<%
}

%>
</body>
</html>