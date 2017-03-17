<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
		
		Member = function(id, name){
			this.id = id;
			this.name = name;
		}
		Member.prototype.toString = function(){
			return 'Id: '+this.id+' [이름: '+this.name+']';
		}
		
		var mem = new Member('hong','홍길동');
		window.alert(mem.id);
		window.alert(mem.name);
		window.alert(mem.toString());
	}
</script>
</head>
<body>
	<h2>자바스크립트 클래스 설계</h2>
</body>
</html>