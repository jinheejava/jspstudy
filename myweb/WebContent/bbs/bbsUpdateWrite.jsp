<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="/myweb/css/mainLayout.css">
<style>
	h2{
		text-align: center;
	}
	table{
		border: 2px double black;
		margin: 0px auto;		
		border-spacing: 0px;
		border-collapse: 0px;
		
	}
	th{
		border-bottom: 2px solid black;
		border-right: 2px solid black;
	}
	
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

<%
	String idx = request.getParameter("idx");
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
%>

<section>
	<h2> 글 쓰 기 </h2>
	<form name="bbsUpdateWrite" action="bbsUpdateWrite_ok.jsp">
	  <input type="hidden" name="idx" value="<%= idx %>">
		<table>
			<tr>
				<th> 이름 </th>
				<th> <input type="text" name="writer" size="30" value="<%= writer %>" readonly></th>
				<th> 비밀번호 </th>
				<th> <input type="password" name="pwd" size="20"> </th>
			</tr>
			<tr>
				<th> 제목 </th>
				<th colspan="3" align="left"> <input type="text" name="subject" size="68" value="<%= subject %>"> </th>
			</tr>
			<tr>
				<td colspan="4"> <textarea name="content" cols="75" rows="15"> </textarea> </td>
			</tr>
			<tr>
				<td colspan="4"> <input type="submit" value="수정하기">
								<input type="reset" value="다시 작성"> </td>
			</tr>						
		</table>
	</form>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>