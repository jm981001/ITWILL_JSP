<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 초기화
session.invalidate();

// 메인 페이지로 이동
response.sendRedirect("session_login_main.jsp");
%>