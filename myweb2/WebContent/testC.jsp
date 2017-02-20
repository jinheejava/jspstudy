<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>TEST C.jsp</h2>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	String id = (String)request.getAttribute("id");
	String addr = (String)request.getAttribute("addr");

%>
<h3> 이름: <%=name %></h3>
<h3> 나이: <%=age %></h3>
<h3> ID: <%=id %></h3>
<h3> 주소: <%=addr %></h3>
</body>
</html>