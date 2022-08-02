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
	// JDBC 4단계
	// => test 테이블에 정수 1 추가
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계. JDBC 드라이버 클래스 로드
	Class.forName(driver);
	
	// 2단계. DB 연결
	Connection con = DriverManager.getConnection(url, user, password);
	
	// 3단계. SQL 구문 작성 및 전달
// 	int num = 10; // test 테이블에 추가할 데이터가 변수에 저장되어 있다고 가정
// 	String sql = "INSERT INTO test VALUES (?)";
// 	// => INSERT 구문에서 사용할 데이터(idx 컬럼값)를 만능문자(?)로 표시만 해두기
// 	PreparedStatement pstmt = con.prepareStatement(sql);
// 	// => SQL 구문 전달 시점에서 만능문자(?)를 실제 데이터로 교체해야하므로
// 	//    PreparedStatement 객체의 setXXX() 메서드를 호출해야함
// 	pstmt.setInt(1, num); // 첫번째(1번 인덱스) 만능문자(?) 파라미터에 정수 num 의 값 전달(교체)
	
	// 3단계. SQL 구문 작성 및 전달
	int num = 2;
	String name = "이순신";
	// test2 테이블에 번호(idx 컬럼)와 이름(name 컬럼)을 추가
	// 만약, 만능문자(?) 를 사용하지 않고 변수를 결합하여 데이터로 처리해야할 경우
	// 문자열의 경우 반드시 작은따옴표('') 사이에 전달해야하므로 문자열 결합시에도 
	// 작은따옴표 유지해야하기 때문에 식별이 힘들 수 있다!
// 	String sql = "INSERT INTO test2 VALUES (1,'홍길동')";
// 	String sql = "INSERT INTO test2 VALUES (" + num + ",'" + name + "')";
	
	// 만능문자(?)를 사용하여 변수 데이터를 교체할 경우
	// 문자열 데이터 등과 무관하게 만능문자로 데이터 자리만 표시하면 된다!
	String sql = "INSERT INTO test2 VALUES (?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	// SQL 구문을 전달한 후에 별도로 각각의 데이터 교체 시 데이터 타입을 지정하므로 편리하다!
	pstmt.setInt(1, num); // 첫번째 만능문자 데이터를 변수 num 값으로 교체(정수형)
	pstmt.setString(2, name); // 두번째 만능문자 데이터를 변수 name 값으로 교체(String)
	
	// 4단계. SQL 구문 실행 및 결과 처리
	int count = pstmt.executeUpdate();
	%>
	<h3>SQL 구문 실행 완료! - <%=count %></h3>
</body>
</html>













