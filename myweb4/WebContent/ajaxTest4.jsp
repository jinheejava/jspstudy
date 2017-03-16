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
		sendRequest('notice.jsp', null, showResult, 'GET');
	}
	function showResult(){
		//진행상태, 결과상태를 봐서 결과를 진행해야함
		if(XHR.readyState==4){
			if(XHR.status==200){
				var newNotice = XHR.responseText;
				var divNotice = document.getElementById('notice');
				divNotice.innerHTML = newNotice;
			}
		}
	}
	/* 결과의 구조를 서버단에서 모두 가져오기 때문에 별로 추천X -> 수정할 경우 서버에서 모두 수정해주어야하기 때문에
	    서버에서는 데이터만 가져오고 그 데이터 화면 구축(구조)을 HTML(Ajax)에서 하는 방식 추천
	*/
</script>
</head>
<body>
	<h2> 공지사항 확인하기 </h2>
	<div id="notice"></div>
	<input type="button" value="공지확인" onclick="show()"> <!-- show()=요청함수  -->

</body>
</html>