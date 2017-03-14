<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	//var XHR = null;
	
 	/*function getXHR(){
		if(window.ActiveXObject){
			return new ActiveXObject('Msxml2.XMLHTTP');
		} else if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		} else{
			return null;
		}
	} */

	function show(){	//요청함수
		var param = document.f.name.value;
		param = 'name='+param;
		/* XHR = getXHR();
		XHR.onreadystatechange=showResult;
		XHR.open("GET", "test.jsp?",true);
		XHR.send(null); */
		sendRequest('test.jsp', param, showResult, 'GET');
	}
	
	function showResult(){	//응답함수		
		//var abc = XHR.readyState;
		//window.alert(abc+'test');
	 	if(XHR.readyState==4){ //서버에서 응답이 완전하게 도착한 경우
			if(XHR.status==200){ //정상적으로 수행(처리)됐을 경우
				//정상적으로 처리된 응답이 완전하게 도착했을 경우 처리할 결과 출력
				var txt = XHR.responseText;
				window.alert(txt);
			}
		}	 
	}
	
</script>
</head>
<body>
<form name="f" enctype="application/x-www-form-urlencoded">
	<input type="text" name="name">
	<input type="button" value="AjaxTest" onclick="show()">
</form>
</body>
</html>