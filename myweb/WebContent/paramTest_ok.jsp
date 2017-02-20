<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleshet" type="text/css"
href="css/mainLayout.css">
</head>
<body>

<%@ include file = "header.jsp" %>
<section>
	<article>
		<h2> 넘어온 파라미터 확인하기</h2>
		<%
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String se = request.getParameter("se");
			//String cb = request.getParameter("cb");
			String cbs[] = request.getParameterValues("cb");
		%>
		<h4> 넘어온 이름 값 : <%= name %></h4>
		<h4> 넘어온 비밀번호 : <%= pwd %></h4>
		<h4> 넘어온 성벌 : <%= se %></h4>
		<h4> 넘어온 취미 : <%
						if(cbs==null) {
							out.println("선택한 취미가 없습니다");							
						} else {
						for(int i=0;i<cbs.length;i++){
							out.println(cbs[i]+"&nbsp;&nbsp;");
							}
						}
						%></h4>		
	</article>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>