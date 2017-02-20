<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> jstlTest4.jsp</h2>
<c:import var="mnaver" url="https://m.naver.com"></c:import>
<div style="border:1px double silver;width:300px; height:300px; overflow: hidden;">

</div>
<c:url var="contentUrl" value="content.jsp">
	<c:param name="idx"> 10 </c:param>
	<c:param name="cp"> 2 </c:param>
</c:url>
<h2> ${contentUrl}</h2>

<c:catch var="ex">
<% String str=null; 
   System.out.println(str.toString());
%>
</c:catch>
<h3> ${ex}</h3>


</body>
</html>