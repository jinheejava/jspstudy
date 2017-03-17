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
		sendRequest('getStudentsJ.jsp', null, showResult, 'GET');
	}
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var strData = XHR.responseText;
				//Map,배열 을 텍스트 형태로 가져옴
				var objData = eval('('+strData+')');
				//텍스트 형태로 가져온 결과값을 객체로 변환해주는 메서드?기능? eval('('텍스트 형태의 변환할 값')')
				//window.alert(objData); > objData가 객체인걸 확인할 수 있음
				
				var students = objData.students;
				
				var msg = '총 학생 수: '+students.length+'명\n';
				
				for(var i=0;i<students.length;i++){
					var student = students[i];
					
					msg += '이름: '+student.name+'('+student.age+')/ '+student.addr+'\n';
				}
				window.alert(msg);
			}
		}
	}
</script>
</head>
<body>
	<h2>학생정보 확인하기</h2>
	<input type="button" value="정보확인하기" onclick="show()">
</body>
</html>