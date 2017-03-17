<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	function show(){
		/*
		var fruit = {apple:'사과', grape:'포도', peach:'복숭아', orange:'오렌지'};
		
		window.alert(fruit.apple); //사과 출력
		window.alert(fruit['peach']); //복숭아 출력
		
		var comBrand = ['Mac', 'IBM', 'DEL', 'LG', '삼성'];
		window.alert(comBrand[0]); //Mac 출력
		window.alert(comBrand[2]); //DEL 출력
		*/
		
		var student = {name:'홍길동', age:20, record:[60, 80, 70]};
		
		var msg = '이름: '+ student.name +'('+student.age+')\n시험 응시 수: '+student.record.length+'과목\n두번째 시험 점수: '+student.record[1]+'점';
		
		window.alert(msg);
	}
</script>
</head>
<body>
	<h2>json 테스트</h2>
	<input type="button" value="test" onclick="show()">
</body>
</html>