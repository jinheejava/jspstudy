<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdto" class="jin.member.MemberDTO"
scope="session"/>
<jsp:setProperty property="*" name="mdto"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		section li{
			list-style-type: none;
		}
		label{
			width: 50px;
			float: left;
		}		
		p{
			text-align: right;
		}
	</style>
</head> 
<%
	//쿠키 가져오기
	Cookie cks[] = request.getCookies();

	String saveid = "";
	
	if(cks!=null){
		for(int i=0;i<cks.length;i++){
			if(cks[i].getName().equals("saveid")){
				saveid = cks[i].getValue();
			}
		}
	}
	
%>
<body>
<section>
	<form name="fm" action="login_ok.jsp" method="post">
										<!-- ID랑 비밀번호니까 전송방식을 post 방식으로! -->
	  <fieldset>
		<legend> 로그인 </legend>
		  <ul>
			<li> <label> ID : </label>
				<input type="text" name="userid" size="15" placeholder="아이디" value="<%= saveid%>"> </li>
			<li> <label> PWD : </label>
				<input type="password" name="userpwd" size="15" placeholder="비밀번호"> </li>
		  </ul>
		  <p>
		  	 <input type="checkbox" name="saveid" value="on" <%= saveid.equals("")?"":"checked" %>> ID 기억하기 
		  	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input type="submit" value="로그인">
		  </p>
		</fieldset>
	</form>
</section>
</body>
</html>