<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="mdto" class="jin.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="jin.member.MemberDAO"/>

<%
	int count = mdao.memberJoin(mdto);
	
	String msg = count>0? "회원가입을 축하드립니다" : "다음에 만나요 :(";
%>

<script>
	window.alert('<%= msg%>');
	location.href='../index.jsp';
</script>