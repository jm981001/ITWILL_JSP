<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 폼에서 입력받은 아이디, 패스워드 가져오기
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

// 로그인 성공/실패 여부를 확인 => 차후에 DB 연동을 통해 실제 처리(지금은 임의로 처리)
// 임의의 아이디와 패스워드를 변수에 저장해두기
String dbId = "admin";
String dbPasswd = "1234";

// if문을 사용하여 아이디가 같고, 패스워드도 같은지 판별
if(id.equals(dbId) && passwd.equals(dbPasswd)) { // 아이디와 패스워드 일치할 경우(= 로그인 성공)
	// 세션 객체에 "sId" 라는 속성명으로 로그인에 성공한 아이디 저장 후
	// session_login_main.jsp 페이지로 포워딩
	session.setAttribute("sId", id);
	response.sendRedirect("session_login_main.jsp");
} else { // 아이디와 패스워드 일치하지 않을 경우(= 로그인 실패)
	// 자바스크립트를 사용하여 "로그인 실패!" 메세지 출력 후 이전페이지로 돌아가기
	%>
	<script>
		alert("로그인 실패!");
		history.back();
	</script>
	<%
}
%>















