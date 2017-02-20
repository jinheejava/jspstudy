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

<section>
	<article>
		<h2> 계산 결과</h2>
		<%
			String num1_s = request.getParameter("num1");
			int num1 = Integer.parseInt(num1_s);
			String num2_s = request.getParameter("num2");
			int num2 = Integer.parseInt(num2_s);
			String oper = request.getParameter("cal");
			char oper_c = oper.charAt(0);
			int result=0;
			
			switch(oper_c){
			case '+' : result = num1+num2; break;
			case '-' : result = num1-num2; break;
			case '*' : result = num1*num2; break;
			case '/' : result = num1/num2; break;
			}		
		%>
		
		<h3> <%= num1 %>&nbsp; <%= oper %> &nbsp;<%= num2 %> &nbsp; = &nbsp; <%= result %> </h3>		
	</article>
</section>
 
<!-- 내코드 실패했쯤
<section>
	<article>
		<h2> 결과 </h2>
		
		<% /*
			int num1 = Integer.parseInt(request.getParameter("num1"));
			웹에서는 문자를 받자마자 파싱하는 것을 추천하지 않음 -> 유효성 검사를 할 수가 없다
			int num2 = Integer.parseInt(request.getParameter("num2"));
			String cal = request.getParameter("cal");

			//switch(cal){
			//case "+" : out.println(num1+" + "+num2+" = "+(num1+num2)); break;
			//case "-" : out.println(num1+" - "+num2+" = "+(num1-num2)); break;
			//case "*" : out.println(num1+" * "+num2+" = "+(num1*num2)); break;
			//case "/" : out.println(num1+" / "+num2+" = "+(num1/num2)); break;
			//}
			
			if(cal.equals(1)){
				out.println(num1+" + "+num2+" = "+(num1+num2));	
			} else if(cal.equals(2)){
				out.println(num1+" - "+num2+" = "+(num1-num2));
			} else if(cal.equals(3)){
				out.println(num1+" * "+num2+" = "+(num1*num2));
			} else if(cal.equals(4)){
				out.println(num1+" / "+num2+" = "+(num1/num2));
			} else {
				out.println("잘못된 값을 입력하셨습니다");
			}
			*/			
		%>
		
	</article>
</section>
-->
<%@ include file="footer.jsp" %>
</body>
</html>

<!-- 
 사이트 만들 때 순서
1) DB 스키마 설계
2) 디자인 설계(HTML/컨텐츠 뼈대잡기)
3) 기능구현
 -->