<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> testC2.jsp </h3>
<%
	String name = request.getParameter("name");
	
	String id = (String)request.getAttribute("id");	
%>

<h4> 이름: <%=name %></h4>
<h4> ID: <%=id %></h4>
<hr>
<h4> 나이가 없니? ${empty param.age}</h4>
<h4> 나이: ${param.age}</h4>
<h4> 주소: ${requestScope.addr}</h4>
</body>
</html>