<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	function idCheck(){
		sendRequest('/view/member/memberJoin.jsp', null, idcheckResult, 'GET');	
	}
	function idcheckResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var result = XHR.responseText;
				
				var resultId = document.getElementById('idconfirm');
				
				if(result){
					resultTd.innerHTML = '이미 사용중인 ID입니다';
				} else{
					resultTd.innerHTML = '사용 가능한 ID입니다';
				}
			}
		}
	}
	
</script>
</head>
<body>
<h2> 회원가입 </h2>
<form name="memberJoin" action="memberJoin.do">
	<fieldset style="width:350px;">
	<legend> 회원가입</legend>
		<ul>
			<li> ID: <input type="text" name="id"><input type="button" value="중복검사" onclick="idCheck()"></li>
			<li id="idconfirm"> &nbsp; </li>
			<li> PWD: <input type="password" name="pwd"> </li>
			<li> 이름: <input type="text" name="name"> </li>
			<li> TEL: <input type="text" name="tel"> </li>
			<li> 주소: <input type="text" name="addr"> </li>
		</ul>
		<p>
			<input type="submit" value="회원가입">
			<input type="reset" value="다시작성">
		</p>
	</fieldset>
</form>

</body>
</html>