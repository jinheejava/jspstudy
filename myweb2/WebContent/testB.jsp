<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("id", "hong");
	request.setAttribute("addr", "서울");
	
	//response.sendRedirect("testC.jsp");
	/*redirect 방식은  A-> B-> C 일 때 
	  A에게 요청을 받았다가 이를 다시 A에게 돌려주고 A가 다시 C로 가게된다
	  redirect 방식은 이동 / forward 방식은 전가
	     그러나 forward 방식은 A가 B로 갔다가 B가 이를 C로 전해주고
	  C가 결과를 A에게 돌려주게 되는 방식으로
	  redirect 방식보다 처리시간이 짧다
	*/
%>
<jsp:forward page="testC.jsp"></jsp:forward>
</body>
</html>