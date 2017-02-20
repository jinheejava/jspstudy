<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> cookieTest.jsp </h2>

<!-- 쿠키 데이터 가져오기 -->
<%
	//1. 쿠키들을 가져옴
	Cookie cks[] = request.getCookies();
	
	if(cks!=null){
		for(int i=0;i<cks.length;i++){
			String key = cks[i].getName();
			String value = URLDecoder.decode(cks[i].getValue()); //디코더
			
			out.println("<h3>KEY:"+key+"/ VALUE:"+value+"</h3>");
		}
	}

%>

<hr>

<!-- 쿠키에 데이터 저장 -->
<%
	//1. 쿠키 생성(키,value)
	Cookie ck1 = new Cookie("id","hong");
	//2. 나이 지정
	ck1.setMaxAge(60*3);
	//3. 사용자 심기
	response.addCookie(ck1);
	
	String name= "홍길동";
	name = URLEncoder.encode(name); //인코딩
	
	Cookie ck2 = new Cookie("name",name);
	ck2.setMaxAge(60*3);
	response.addCookie(ck2);
	
%>

<h3> 쿠키 설정 완료 </h3>
<!-- 쿠키는 사용자에게 저장된 값을 불러와야 하므로
	코드를 짤 때 데이터 추출 -> 데이터 저장의 순서로 해야한다
	그래야 저장된 정보를 먼저 불러와 출력하고 정보를 저장하게 되는데
	저장 -> 출력의 순서로 코드를 짤 경우엔 그냥 바로 위에서 저장한 정보가 그대로 출력되고 만다.
 -->
 
<!-- 웹에서의 저장은 1byte 체계를 가지고 있는데 한글은 2byte이므로 그냥 저장할 경우
	에러가 난다. 그래서 한글을 저장할 때는 인코딩을 해 주어야 하는데
	1. java.net.* 을 import 해준다
	2. 정보를 저장 할 때 인코딩해서 저장한다
	3. 데이터를 출력 할 때도 인코딩한 것을 다시 디코딩하여 출력해야한다
	 -->
</body>
</html>