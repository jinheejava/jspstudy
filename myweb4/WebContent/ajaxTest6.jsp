<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
		window.alert('DOM Test start!');
		
		
		var rootNode = document.documentElement;
		//해당 값들을 사용하려면 일단 문서 전체를 가져와야함
		//window.alert(rootNode); //객체가 가져와짐 - object HTMLHtmlElement
		//window.alert(rootNode.nodeName);  //HTML이 출력, html은 모두 대문자로 출력됨
		
		var bodyNode = rootNode.lastChild;
		//window.alert(bodyNode.nodeName);
		
		var spanNodeA = bodyNode.firstChild;
		//window.alert(spanNodeA.nodeName); // -> #text가 출력, span이 나와야하는데 왜? <body> 태그 다음에 한 개행. 이를 첫번째 자식으로 인식함.. 
		
		var spanNodea = bodyNode.firstChild.nextSibling;
		//window.alert(spanNodea.nodeName); // span
		
		var aTextNode = spanNodea.lastChild;
		//window.alert(aTextNode.nodeName); // #text
		//window.alert(aTextNode.nodeValue); // a
		
		/* var divNodeb = bodyNode.firstChild.nextSibling.nextSibling.nextSibling;
		window.alert(divNodeb.nodeName);
		
		var bTextNode = divNodeb.lastChild.firstChild;
		window.alert(bTextNode.nodeValue); */
		
		var divNode1 = spanNodea.nextSibling.nextSibling;		
		var spanNodeb = divNode1.lastChild;
		var bTextNode = spanNodeb.firstChild;
		window.alert(bTextNode.nodeValue);
		
		var spanNodeC = document.getElementById('c');
		var cTextNode = spanNodeC.lastChild;
		window.alert(cTextNode.nodeValue);
	}
	
	
</script>
</head>
<body>
<span id="a">a</span>
<div>test<span id="b">b</span></div>
<div><p>p</p><span id="c">c</span></div>
</body>
</html>