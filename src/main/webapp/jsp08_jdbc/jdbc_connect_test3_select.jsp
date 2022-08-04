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
	<h1>jdbc_connect_test3_select.jsp</h1>
	<%
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
	out.println("<h3>1단계, 2단계 성공!</h3>");
	
	// 3단계. SQL 구문 작성 및 전달
	// => test2 테이블의 모든 레코드 검색(조회 = SELECT)
	// => SELECT 구문도 3단계까지는 동일함
	String sql = "SELECT * FROM test2";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 4단계. SQL 구문 실행 및 결과 처리
	// => PreparedStatement 객체의 executeQuery() 메서드를 호출하여 SELECT 구문을 실행하고
	//    리턴되는 결과값을 java.sql.ResultSet 타입 변수에 저장
	ResultSet rs = pstmt.executeQuery();
	/*
	다음 형태의 테이블이 ResultSet 타입 객체로 리턴됨
    +------+--------+
    | idx  | name   | <- 현재 커서(Cursor) 위치(항상 첫번째 레코드 위에 위치)
    +------+--------+
    |    1 | 홍길동 | <- rs.next() 메서드를 한 번 호출했을 때의 커서 위치(true 리턴 = 레코드 있음)
    |    2 | 이순신 | <- rs.next() 메서드를 두 번 호출했을 때의 커서 위치(true 리턴 = 레코드 있음)
    +------+--------+ <- rs.next() 메서드를 세 번 호출했을 때의 커서 위치(false 리턴 = 레코드 없음)
	*/
	// ResultSet 객체의 next() 메서드를 호출하여 커서를 다음으로 이동시키기
	// => 레코드가 3개이므로 rs.next() 메서드를 3번 호출할 동안 true 리턴, 4번째에는 false 리턴됨
// 	out.println(rs.next()); // true 
// 	out.println(rs.next()); // true
// 	out.println(rs.next()); // true
// 	out.println(rs.next()); // false

	// 만약, 조회 결과가 단일 레코드(1개 레코드)일 경우 if 문을 사용하여
	// rs.next() 메서드 결과가 true 일 때 데이터 가져올 수 있다!
// 	if(rs.next()) { // 커서를 한 줄 내린 다음 if문을 통해 레코드 존재여부 판별
// 		out.println("레코드 존재함!");
// 	} else {
// 		out.println("레코드 존재하지 않음!");
// 	}

	// 조회할 레코드가 복수개(2개 이상)일 경우 
	// if문 대신 while문을 사용하여 다음 레코드가 존재할 동안 반복
	while(rs.next()) { // 다음 레코드가 존재(리턴값 true)할 동안 블럭문 내의 코드를 반복 실행
// 		out.println("레코드 존재함!"); // 레코드가 3개일 경우 3번 반복 출력됨

		// 커서가 위치한 레코드의 각 컬럼에 접근하여 데이터 가져오기
		// => 1번 컬럼 : int 타입, 2번 컬럼 : VARCHAR 타입
		// => ResultSet 객체의 getXXX() 메서드를 호출하여 각 컬럼 데이터 가져오기
		//    이 때, XXX 은 컬럼 타입에 대한 자바 데이터타입명 사용
		//    파라미터는 컬럼인덱스번호 또는 컬럼명 전달
// 		int idx = rs.getInt(1); // 컬럼인덱스 번호를 지정하는 방법(첫번째 컬럼 = 1번 인덱스)
		int idx = rs.getInt("idx"); // 컬럼명을 지정하는 방법
// 		String name = rs.getString(2);
		String name = rs.getString("name");
		out.println(idx + ", " + name + "<br>");
	}

	%>
	
</body>
</html>















