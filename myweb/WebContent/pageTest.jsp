<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	/*
		페이징

		4가지 필수 요소 (이 4가지가 있어야 페이징 구성이 가능
		1. 총 게시물 수
		2. 리스트 수(한 화면에 몇개씩 보여줄지
		3. 페이지 수(한 화면에 몇 페이지씩 보여줄지
		4. 현재 페이지에 대한 값 (8페이지면 밑에 페이지 목록에 6 7 8 9 10 을 보여주어야 하므로..
				
	*/
	int totalCnt = 62; //총 게시물 수
	int listSize = 5; //보여줄 리스트 수
	int pageSize = 5; //보여줄 페이지 수
	//int cp = 8; //현재 위치
	String cp_s = request.getParameter("cp");
	
	if(cp_s==null || cp_s==""){
		cp_s = "1";
	}
	
	int cp = Integer.parseInt(cp_s);
	
	int totalPage = totalCnt/listSize+1; //총 페이지수
	if(totalCnt%listSize==0) totalPage--;
	/* 총 게시물을 listSize로 나누면 페이지 수가 나오게 되는데 나누어 떨어지지 않는 경우에는 1페이지가 추가되므로 1을 더해준다
	  	 예>> 13개의 게시물을 5개씩 자를경우 2개의 페이지와 나머지 3개의 게시물이 1페이지를 이루어야함.
	      그러나 또 이것이 게시물 수가 listSize로 딱 나누어 떨어질 경우에는 빈 페이지 한 페이지가 만들어지므로 딱 나누어 떨어질 경우에는 +1을 해준것을 다시 -1을 해준다.*/
	
	int userGroup = cp/pageSize;
	if(cp%pageSize==0) userGroup--;
	/* 현재 보여지고 있는 페이지가 속해있는 그룹은 현재 페이지 위치(cp)를 pageSize로 나누면 구할 수 있다. 예> 13페이지의 경우 5페이지씩 보여준다고 할 때 2그룹.(0그룹부터 시작해서)
	     이것 또한 딱 나누어 떨어질 경우 -1을 해준다.
	 
	 예)
	     1 2 3 4 5 6 7 8 9 10 11 12 13 14 15  5페이지씩 그룹지어줄 경우 5로 나눠준다(그룹함수)
	  /5 
	  	 0 0 0 0 1 1 1 1 1  2  2  2  2  2  3 -> 딱 나누어 떨어지는 5, 10, 15의 경우 -1씩 해준다
	  -1
	  	 0 0 0 0 0 1 1 1 1  1  2  2  2  2  2 -> 그룹!
	 */
%>
<body>
	<h4> 총 게시물 수: <%= totalCnt %> </h4>
	<h4> 보여줄 리스트 수: <%= listSize %> / 보여줄 페이지 수 : <%=pageSize %></h4>
	<h4> 총 페이지 수: <%= totalPage %></h4>
	<h4> 현재 위치: <%= cp %></h4>
<hr>

<%
	if(userGroup!=0){
		%> <a href="pageTest.jsp?cp=<%= (userGroup-1)*pageSize+pageSize%>"> &lt;&lt; </a>
		<%
	}
	/* 첫번째 그룹이 아니면 페이지 왼쪽편에 앞 페이지로 돌아가는 << 표시 해주기
	       클릭하면 앞 그룹의 마지막 페이지를 다시 엶과 동시에 해당하는 페이지 값을 cp(파라미터)로 전송 // 7페이지면 5페이지로, 12페이지 때 클릭하면 10 페이지로
	
	     앞 그룹의 마지막 페이지 = (현재그룹 -1)=앞 그룹 * pageSize(페이지 사이즈) +pageSize(페이지 사이즈)
	     12페이지일 경우 = 2번그룹 -1 = 1(번그룹) * 5 + 5 => 10페이지  ----로 돌아가게 됨*/
	     
		for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="pageTest.jsp?cp=<%=i%>"> <%= i %> </a>&nbsp;&nbsp;&nbsp;&nbsp;
			<%
			if(i==totalPage) break;
		}
	if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
		%> <a href="pageTest.jsp?cp=<%= (userGroup+1)*pageSize+1 %>"> &gt;&gt; </a>
		<%
	}
	/* 마지막 그룹이 아니면 오른쪽으로 가는 화살표 보여주기
	
	   (totalPage/pageSize)-(totalPage%pageSize==0?1:0) : 마지막 그룹을 구하는 식
	   (userGroup+1)*pageSize+1 : 다음 그룹의 첫 페이지
	 */
%>


</body>
</html>