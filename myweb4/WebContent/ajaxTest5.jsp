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
		sendRequest('getGrade.jsp', null, showResult, 'GET');
	}
	
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var serverData = XHR.responseText;
				var strArray = serverData.split(','); //split :내가 지정한 구분자로 문자열을 쪼갠 다음 배열 형태로 돌려줌
				//문자열을 쪼갠 후 받아도 연산을 할 수 없으므로 int 형태로 저장할 변수 하나를 만들어줌
				var intArray = new Array(strArray.length);
				var max = 0;
				var sum = 0;
				
				for(var i=0;i<strArray.length;i++){
					intArray[i] = parseInt(strArray[i]);
					
					if(max<intArray[i]){
						max = intArray[i];
					}
					
					sum += intArray[i];
				}
				var avg = sum/intArray.length;
				
				var maxTd = document.getElementById('max');
				maxTd.innerHTML = max+'점';
				
				var sumTd = document.getElementById('sum');
				sumTd.innerHTML = sum+'점';
				
				var avgTd = document.getElementById('avg');
				avgTd.innerHTML = avg+'점';
			}
		}
	}
</script>
</head>
<body>
	<table border="1" bordercolor="black" cellspacing="0" width="300">
		<caption> 성적결과 </caption>
		<tr>
			<th> 최고점수</th>
			<td align="right" id="max">--점</td>
		</tr>
		<tr>
			<th> 총점</th>
			<td align="right" id="sum">--점</td>
		</tr>
		<tr>
			<th> 평균</th>
			<td align="right" id="avg">--점</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="결과조회" onclick="show()"></td>
		</tr>
	</table>
</body>
</html>