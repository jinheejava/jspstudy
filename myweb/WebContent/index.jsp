<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>    
<%@ page import="java.net.*" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 내 홈페이지 </title>
	<link rel="stylesheet" type="text/css"
	href="css/mainLayout.css">
	
	<script>
		function popupOpen(){
			window.open('popup.jsp','notice','width=300, height=300');
		}
	</script>
</head>
<%
	//쿠키값 가져오기
	String msg = "첫 방문이시군요!";
	String popupck = null;
	
	Cookie cks[] = request.getCookies();
	
	if(cks!=null){
		for(int i=0;i<cks.length;i++){
			if(cks[i].getName().equals("lastDate")){
				msg = URLDecoder.decode(cks[i].getValue());
			} //방문자가 첫 방문인지 재 방문인지 판단
			if(cks[i].getName().equals("popupck")){
				popupck=cks[i].getValue();	
			} //공지사항 창 체크를 했는지 안했는지 판단
		}
	} 
%>
<body <%= popupck==null? "onload='popupOpen()'":"" %>>
<%@ include file="header.jsp" %>
<section> <!-- 컨텐츠 -->
	<article id="mainImg"> <!-- 각각의 컨텐츠 -->
   		<img src="img/main.jpg">
   	</article>
   	<article id="mainMenu"> <!-- 각각의 컨텐츠 -->
   		<h2>&nbsp; 여러분 화이팅 합시다 &nbsp;</h2>
   		<h3 style="color:blue;"> &nbsp;&nbsp;&nbsp; <%=msg %></h3>
			<%@ include file="cookieTest2.jsp" %>
	   	<ul>	   	
	   		<li> 앞으로 수업메뉴는 여기에 추가..</li>
	   		<li> <a href="paramTest.jsp"> 파라미터 테스트 </a></li>
	   		<li> <a href="cal.jsp"> 사칙 계산기</a> </li>
	   		<li> <a href="emp.jsp"> 사원관리 프로그램(model_1)</a></li>
	   		<li> <a href="emp2/emp2.jsp"> 사원관리프로그램(Beans) </a></li>
	   		<li> <a href="member/memberFind.jsp"> 회원검색 </a> </li>
	   	</ul>
   	</article>
</section> 

<%@ include file="footer.jsp" %>
	

</body>
</html>