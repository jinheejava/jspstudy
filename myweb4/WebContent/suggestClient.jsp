<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	var checkFirst = false;
	var lastKeyword = '';
	var loopSendKeyword = false;
	
	function startSuggest(){
		if(checkFirst==false){
			setTimeout("sendKeyword();", 500);
			loopSendKeyword = true;
		}
		checkFirst = true;
	}
	
	function sendKeyword(){
		if(loopSendKeyword==false) return;
		
		var keyword = document.search.keyword.value;
		if(keyword==''){
			lastKeyword = '';
			hide('suggest');
		} else if(keyword!=lastKeyword){
			lastKeyword = keyword;
			if(keyword!=''){
				var params = "keyword="+encodeURIComponent(keyword);
				sendRequest('suggest.jsp', params, displayResult, 'POST');
			} else{
				hide('suggest');
			}
		}
		setTimeout("sendKeyword();",500);
	}
	
	function displayResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var resultText = XHR.responseText;
				var result = resultText.split('|');
				var count = parseInt(result[0]);
				var keywordList = null;
				
				if(count>0){
					keywordList = result[1].split(',');
					
					var html = '';
					for(var i=0;i<keywordList.length;i++){
						html += "<a href=\"javascript:select('"+keywordList[i]+"')\">" + keywordList[i]+"</a><br>";
					}
					
					var listView = document.getElementById('suggestList');
					listView.innerHTML = html;
					show('suggest');
				} else{
					hide('suggest');
				}
			} else{
				alert('에러 발생: '+XHR.status);
			}
		}
	}
	
	function select(selectedKeyword){
		document.search.keyword.value = selectedKeyword;
		loopSendKeyword = false;
		checkFirst = false;
		hide('suggest');
	}
	
	function show(elementId){
		var element = document.getElementById(elementId);
		if(element){
			element.style.display = '';
		}
	}
	
	function hide(elementId){
		var element = document.getElementById(elementId);
		if(element){
			element.style.display = 'none';
		}
	}
</script>
<style>
	#view{
		border: 1px solid #999;
	}
</style>
</head>
<body>
	<form name="search">
		<input type="text" name="keyword" id="keyword" onkeydown="startSuggest()">
		<input type="button" value="검색">
		<div id="suggest" style="display:; position: absolute; left:10px; top:30px;">
		<div id="suggestList"></div>
		</div>
	</form>
</body>
</html>