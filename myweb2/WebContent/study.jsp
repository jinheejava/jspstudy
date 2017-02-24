<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function hclick(){
		//window.alert(1);
		var hi = document.getElementById('hello2');
		//window.alert(hi);
		
		if(hi.style.color=='red'){
			hi.style.color='orange';
		} else if(hi.style.color=='orange'){
			hi.style.color='blue';
		} else{
			hi.style.color='red';
		}
	}
</script>
</head>
<body>

<div id="hello2" style="color:red; font-size:50px" onclick="hclick()">
	안녕
</div>

</body>
</html>