<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이것은 둘째날 만든 jsp 페이지!</h2>
	
	<!-- html 주석 / html의 모든것을 다 쓸 수 있어요 -->
	
	<!-- http://localhost:9090/myweb/testC.jsp -->
	
	<% //이것은 스크립트 릿 영역입니다 
	/* 여러줄 주석*/
	/**문서화 주석*/ 
	// Java 코드 사용 가능
	
	System.out.println("이것은 JSP에서 작성한 문자열");
	//out : jsp에서 제공하는 기본 출력 객체
	
	out.println("<h3>이것은 jsp에서 작성된 문자열</h3>");
	
	//번역 순서 : java -> javascript -> css -> html
	
	String str="jsp"; //지역변수
	
	out.println("<h3>str의 값: "+str+"</h3>");
	
	%>
	
	<h3>str의 값: <%= str %></h3>
	
	
	<%!
		String str = "java"; //멤버변수
		
		public int getSum(int a, int b){
			return a+b;
		}
		
	%>
	
	<%
		out.println("<h3>3+5 = "+getSum(3,5)+"</h3>");
		out.println("<h3>str의 값: "+this.str+"</h3>");
		
	%>
	
	<h3>5+6= <%= getSum(5,6) %></h3>
	
	<%
		Calendar now = Calendar.getInstance();
		
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH)+1;
		int day = now.get(Calendar.DATE);
		
		out.println("<h3>"+year+"년"+month+"월"+day+"일</h3>");
	
	
	%>
	

</body>
</html>