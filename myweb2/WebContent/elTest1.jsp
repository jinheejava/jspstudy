<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${true} <br>
${10}/${12.2}<br>
${'안녕하세요'} / ${"하이하이"}<br>
${null} null값은 출력되지않음<br>

<h4>4+5=${4+5}</h4>
<h4>"4"+5=${"4"+5}</h4>
<h4>"사"+5=</h4>
<h4>null+5=${null+5}</h4>
<h4>3/2=${3 div 2}</h4>
<h4>3%2=${3 mod 2}</h4>

<h4>3==4=${3 eq 4 }</h4>

</body>
</html>