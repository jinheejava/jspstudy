<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="jin.member.MemberDAO"
scope="page"/>

<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	
	String saveid = request.getParameter("saveid");	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int result = mdao.loginCheck(userid, userpwd);
	
		if(result == mdao.LOGIN_OK){
			String username = mdao.getUserInfo(userid);
			
			session.setAttribute("sid", userid);
			session.setAttribute("sname", username);
			
			if(saveid!=null &&  saveid.equals("on") ){
				Cookie ck = new Cookie("saveid",userid);
				ck.setMaxAge(60*60*24*30);
				response.addCookie(ck);				
			} else {
				//사용자가 ID 기억하기를 체크해제 했을 경우 쿠키에서 사용자 정보를 삭제해주어야 함
				Cookie ck = new Cookie("saveid",userid);
				ck.setMaxAge(0);
				response.addCookie(ck);
				//쿠키가 만들어지자마자 죽어버리므로 삭제와 같은 기능 -> 쿠키는 삭제 기능이 없고 이렇게 사용함
			}
			
			%>
			<script>
			window.alert('<%=username%>님 환영합니다~!');
			opener.location.reload();
			window.self.close();
			</script>
			<%		
		} else if(result == mdao.NOT_ID){
			%>
			<script>
				window.alert('존재하지 않는 ID입니다.');
				location.href='login.jsp';
			</script>
			<%
		} else if(result == mdao.NOT_PWD) {
			%>
			<script>
			window.alert('비밀번호가 틀렸습니다.');
			location.href='login.jsp';
			</script>
			<%
		} else if(result == mdao.ERROR){
			out.println("고객센터에 연락 바람!");	
		}
	%>
</body>
</html>