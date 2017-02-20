<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="/myweb/css/mainLayout.css">
<style>
	h3{
		text-align: center;
	}
	article hr{
		width: 450px;
	}
	article fieldset{
		width: 300px;
		margin: 0px auto;
	}
	article div{
		width: 450px;
		margin: 0px auto;
		text-align: center;
	}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

<section>
	<article>
		<h3> 회원 검색 </h3>
		<hr>
			<form name="memberFind" method="post">
			<fieldset>
				<select name="fkey">
					<option value="id"> ID </option>
					<option value="name"> 이름 </option>			
				</select>
				<input type="text" name="fvalue">
				<input type="submit" value="검색">
			</fieldset>
			</form>
		<hr>
			<div>
			<%
				if(request.getMethod().equals("GET")){
					%>
					위 검색란에 검색어를 입력해주세요 
					<%
				} else {
					%>
					<jsp:include page="result.jsp"></jsp:include>
					<%									
				}				
			%>
			</div>
		<hr>
	</article>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>