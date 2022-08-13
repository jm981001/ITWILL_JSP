<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// session.removeAttribute("sId");
session.invalidate();
response.sendRedirect("../index.jsp");


%>