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
		sendRequest('getStudents.jsp', null, showResult, 'GET');
	}
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var xmlDoc = XHR.responseXML;
				//서버 결과의 반환타입이 XML일 때, responseXML로 받고
				//responseXML로 응답을 받게되면 선언한 변수는 DOMapi형태로 저장된다
				//xmlDoc = document
				
				var studentList = xmlDoc.getElementsByTagName('student');
				//getElementsByTagName = 지정한 이름의 모든 Element의 목록을 구한다
				
				var msg = '총 학생수 : '+studentList.length+'명\n';
				//student라는 이름을 가진 Element 목록의 길이 = 학생수가 될 것
				
				for(var i=0;i<studentList.length;i++){
					var student = studentList.item(i);
					//studentList가 학생의 목록(배열)이므로 for문과 .item(i)를 통해 인덱스 i에 저장된 노드를 구한다 
					
					var nameValue = student.getElementsByTagName('name').item(1).firstChild.nodeValue;
					var ageValue = student.getElementsByTagName('age').item(0).firstChild.nodeValue;
					var addrValue = student.getElementsByTagName('addr').item(0).lastChild.nodeValue;
					//해당 학생(student)에 해당 이름을 가진 node(getElementsByTagName('해당 이름')의 item(i)에 해당하는 값을 가져와야하므로 
					//xml은 해당 값도 node의 자식이니까 firstChild.nodeValue를 통해 값을 가져온다
					
					//if(addrValue=='부산'){
						msg += nameValue+'('+ageValue+'세)/'+addrValue+'\n';
					//}
				}
				
				window.alert(msg);
			}
		}
	}
</script>
</head>
<body>
	<h2>학생정보 확인하기</h2>
	<input type="button" value="정보확인" onclick="show()">
</body>
</html>