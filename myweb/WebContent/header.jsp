<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="jin.member.MemberDAO"
scope="session"/>

<header> <!-- 상단 -->
	<script>
		function loginOpen(){
			window.open('/myweb/member/login.jsp','login','width=300, height=200');
			//어느 페이지에 있어도 로그인이 되어야하므로 절대경로를 사용
		}
	</script>

		<%
		String sname = (String)session.getAttribute("sname");
		//session의 저장 자료형 (String, Object) !
		
		if(sname==null) { %>
			<p><a href="javascript:loginOpen()">로그인</a> 
			| <a href="/myweb/member/join.jsp">회원가입</a></p> <%
		} else {
			%>
			 <p> <a> <%= sname %>님 로그인 중 </a> 
			 | <a href="/myweb/member/logout.jsp"> 로그아웃 </a></p>
			<%
		}%>
		
	<h1>JSP Study Site</h1>
<nav> <!-- 메뉴 -->
	<ul>
		<li> <a href="/myweb/index.jsp">HOME</a> </li>
		<li> <a href="http://localhost:9090/myweb/profile.jsp">Profile</a> </li>
		<li> <a href="/myweb/bbs/bbsList.jsp">BBS</a> </li>
		<li> <a href="/myweb/wf/webFolder.jsp">WebFolder</a> </li>
		<li> <a href="#">GuestBook</a> </li>
	</ul>
</nav>
   <hr>
</header>

<!-- 
자바 : / = 9090/myweb
HTML,CSS, 자바스크립트: / = 9090
-->