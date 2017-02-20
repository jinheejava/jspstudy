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

<section>
	<h2> 글 쓰 기 </h2>
	<form name="bbsWrite" action="bbsWrite_ok.jsp">
		<table>
			<tr>
				<th> 이름 </th>
				<th> <input type="text" name="writer" size="30"></th>
				<th> 비밀번호 </th>
				<th> <input type="password" name="pwd" size="20"> </th>
			</tr>
			<tr>
				<th> 제목 </th>
				<th colspan="3" align="left"> <input type="text" name="subject" size="68"> </th>
			</tr>
			<tr>
				<td colspan="4"> <textarea name="content" cols="75" rows="15"> </textarea> </td>
			</tr>
			<tr>
				<td colspan="4"> <input type="submit" value="글쓰기">
								<input type="reset" value="다시 작성"> </td>
			</tr>						
		</table>
	</form>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>