<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function login(){
		window.open('login.do','login','width=300 height=150');		
	}
</script>
</head>
<body>
	<h2> Index </h2>
	<c:set var="name" value="${sessionScope.sname}"/>
	
	<c:choose>
		<c:when test="${!empty name}">
			<p>
				<a>${name}님 로그인 중...</a> | <a href="logout.do">로그아웃</a>
			</p>
		</c:when>
		<c:otherwise>
			<p>
				<a href="javascript:login()">로그인</a>
			</p>
		</c:otherwise>
	</c:choose>
	<ul>
		<li><a href="hello.do">Spring MVC</a></li>
		<li><a href="memoWrite.do">메모 작성하기</a></li>
		<li><a href="memberJoin.do">회원가입</a></li>
		<br>
		<li><a href="order.do">편의점 발주 시스템</a></li>		
		<li><a href="paramTest.do?idx=3&str=spring"> 파라미터 테스트 </a></li>
		<li><a href="cookieView.do">쿠키 값 확인하기</a></li>
		<li><a href="cookieMake.do">쿠키 값 저장하기</a></li>
		<li><a href="sessionView.do"> 세션 확인하기 </a></li>
		<li><a href="sessionMake.do"> 세션 저장하기 </a></li>
		<br>
		<li><a href="viewTest1.do">명시적 뷰 지정</a></li>
		<li><a href="viewTest2.do">명시적 뷰 지정2</a></li>
		<li><a href="view/viewTest.do">묵시적 뷰 지정</a></li>
		<li><a href="viewTest3.do">컨트롤러에서 다른 명령어 바로 실행하기</a></li>
		<li><a href="modelTest1.do">모델테스트1(Map)</a></li>
		<li><a href="modelTest2.do">모델테스트2(Model)</a></li>
		<li><a href="modelTest3.do">모델테스트3(ModelMap)</a></li>
		<li><a href="model/modelSuccess.do">모델테스트4(Map반환)</a></li>
		<li><a href="model/modelSuccess.do">모델테스트5(Model반환)</a></li>
		<li><a href="aniFindA.do">애니메이션 검색</a></li>
	</ul>
</body>

</html>
































