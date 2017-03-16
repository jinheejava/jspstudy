<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function show(){
		var p1 = document.getElementById('p1'); //document = 브라우저 화면 전체
			//var p1 = document.all.p1
		//window.alert(p1.innerHTML);
			//innerHTML => 속성 => 변수 => 저장할 수 있음!
		p1.innerHTML='<h2 style="color:navy;"> 화면 </h2>';
	}	
</script>
</head>
<body>
	<p id="p1"><strong>Ajax</strong> 프로그래밍, <br> 기초</p>
	<input type="button" value="보기" onclick="show()">
</body>
</html>