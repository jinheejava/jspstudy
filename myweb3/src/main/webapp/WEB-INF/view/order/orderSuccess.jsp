<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 발주 내역 </h2>
	<h3> 상품 확인 </h3>
	<ul>
		<c:forEach var="dto" items="${orderDTO.itemdto}">
			<li>${dto.title}/${dto.num}개/${dto.bigo}</li>
		</c:forEach>
	</ul>
	<h3> 주문자 정보 </h3>
	<h4> 주문 매장 : ${orderDTO.marketinfo.address}</h4>
	<h4> 주문자명 : ${orderDTO.marketinfo.orderName}</h4>
</body>
</html>