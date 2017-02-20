<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	session.invalidate();
    	
    	response.sendRedirect("/myweb/index.jsp");
    	/* 원하는 페이지로 이동 */
   
    %>