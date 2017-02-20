<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>    
<%@ page import="java.net.*" %>

	<%
		//쿠키 만들기
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH)+1;
		int day = now.get(Calendar.DATE);
		
		String nowDate = "마지막 접속일: "+year+"년"+month+"월"+day+"일";
		nowDate = URLEncoder.encode(nowDate);
		
		Cookie ck = new Cookie("lastDate",nowDate);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck);
	%>