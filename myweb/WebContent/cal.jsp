<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="css/mainLayout.css"> 
</head>
<body>

<%@ include file="header.jsp" %>

<section>
	<article>	
		<h2> 사칙 계산기 </h2>
		<form name="fm" action="cal_ok.jsp">
		<fieldset>
			<legend> 계산기 </legend>
			<input type="text" name="num1" size="3"> &nbsp;
			<select name="cal">
				<option value="+"> + </option>
				<option value="-"> - </option>
				<option value="*"> * </option>
				<option value="/"> / </option>
			</select> &nbsp;
			<input type="text" name="num2" size="3"> &nbsp;
			= &nbsp;
			<input type="submit" value="계산하기">
		</fieldset>		
		</form>
	</article>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>