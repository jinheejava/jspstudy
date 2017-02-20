<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> requestTest.jsp </h2>
	사용자 IP : <%= request.getRemoteAddr() %> <br>
	사용자 접속 Port : <%= request.getRemotePort() %> <br>
	서버의 이름 : <%= request.getServerName() %> <br>
	서버의 서비스 Port : <%= request.getServerPort() %> <br>
	접속 방식 : <%= request.getMethod() %> <br>
	프로토콜 정보 : <%= request.getProtocol() %> <br>
	프로젝트 이름 : <%= request.getContextPath() %> <br>


</body>
</html>

<!-- Request 객체
	: 사용자가 요청을 할 때 파라미터,헤더,쿠키 등 많은 정보를 함께 전송하는데
	 이를 request 객체에 저장하게 되고 이를 우리가 추출해서 사용할 수 있다.
	 
	 * Request 객체가 제공하는 기본 기능
	 - 클라이언트와 관련된 정보(IP,Port번호 ..) 읽기 기능
	 - 서버와 관련된 정보 읽기 기능
	 - ★ 클라이언트가 전송한 요청 파라미터 읽기 기능 
	 - 클라이언트가 전송한 요청 헤더 읽기 기능
	 - 클라이언트가 전송한 쿠키 읽기 기능
	 - 속성 처리 기능 
	 
	 ★ 클라이언트가 전송한 파라미터 읽어오기
	  메소드 : String | getParameter(String name)
	       -> 사용자의 form 의 이름 값(키값)을 가져온다
	     : String[] | getParameterValues(String name)
	      
	     -->
	 
	 