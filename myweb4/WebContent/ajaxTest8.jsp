<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
		//교재  p137~ 새로운 노드 생성, 트리구조 변경
		
		//h1노드에 id가 b인 새로운 스판노드 추가하기
		//제일 먼저 추가해 줄 span 노드를 생성해주어야 함
		var spanNode = document.createElement('span');
		spanNode.setAttribute('id','b');
		
		var spanText = document.createTextNode('새로운 span 태그');//span 노드가 제대로 생성되었는지 span 태그 안에 넣을 text노드 생성
		//spanNode와 spanText는 현재 따로따로 각각의 node인 상태이므로  spanText 노드를 spanNode에 자식노드로 추가해주어야한다
		spanNode.appendChild(spanText);
		
		var h1Node = document.getElementById('a');
		h1Node.appendChild(spanNode);
		
		//새로운 p노드를 h1노드의 previousSibling 노드로 추가하기
		var pNode = document.createElement('p');	//추가할 p노드 생성하고
	
		var pText = document.createTextNode('새로운 p 태그~');	//p노드 확인용으로 text 생성해서 추가하고
		pNode.appendChild(pText);
		
		//새로운 노드를 추가하고, 삭제하고 하는 명령어는 부모의 입장에서 실행되어야하므로 h1태그의 부모노드인 body 노드를 가져온다(h1앞에 추가하려면 h1의 부모입장에서 명령어를 실행해야함)
		var bodyNode = h1Node.parentNode;
		bodyNode.insertBefore(pNode, h1Node);
		
		//h1노드 삭제해보기
		bodyNode.removeChild(h1Node);		
	}
</script>
</head>
<body>
<h1 id="a">제목&nbsp;</h1>
<form>여기는 form태그 영역</form>
</body>
</html>