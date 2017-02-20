<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css"
	href="css/mainLayout.css">
	
</head>
<body>
<%@ include file="header.jsp" %>
<section> <!-- 컨텐츠 -->
	<article id="profileImg"> <!-- 각각의 컨텐츠 -->
   		<img src="img/profile.jpg">
   	</article>
   	<article id="mainMenu"> <!-- 각각의 컨텐츠 -->
   		<h2> &nbsp; 한진희</h2>
	   	<ul>
	   		<li> 열심히 합시다</li>
	   	</ul>
   	</article>
</section> 
<%@ include file="footer.jsp" %>
	
</body>
</html>