<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
		var fontNode = document.getElementById('fon');
		
		//window.alert(fontNode.getAttribute('id'));
		
		fontNode.setAttribute('color', 'orange');
		fontNode.setAttribute('color', 'darkred');
		
		fontNode.removeAttribute('color');
		
		//window.setTimeout('',1000);를 이용해서 색이 변하게 할 수 없나?
		
	}
</script>
</head>
<body>
<h1><font id="fon">간단한 속성 테스트</font></h1>
</body>
</html>