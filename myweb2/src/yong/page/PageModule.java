package yong.page;

public class PageModule {
	
	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp){
		
		/* 페이지 구성 할 때 필요한 기본적인 정보
		 * 1. 페이지 이름 : 사용자가 현재 보고있는 페이지(주소) / 페이지를 넘어갈 때 현재 주소에 파라미터 값을 계속 넘겨주니까 현재 주소가 필요함
		 * 2. 총 게시물 수
		 * 3. 보여줄 리스트 수
		 * 4. 보여줄 페이지 수
		 * 5. 현재 사용자의 위치
		 */
		
		int totalPage = totalCnt/listSize+1; //총 페이지수
		if(totalCnt%listSize==0) totalPage--;
		
		int userGroup = cp/pageSize;
		if(cp%pageSize==0) userGroup--;
		
		StringBuffer sb = new StringBuffer();
		/* String은 원본 불변의 법칙으로 값을 변경하면 복사본을 만들어 복사본의 값을 변경하는데(메모리 사용량 증가)
		 * StringBuffer는 복사본을 만들지않고 원본을 바로 조작하므로 메모리 자원을 절약할 수 있다
		 * 웹은 자원이 한정적이고 여러 사람들이 사용하니까 자원 절약이 중요 !..	 */
			
		if(userGroup!=0){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");			
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'> &lt;&lt; </a>");
			
			//<a href='pageTest.jsp?cp=<%= (userGroup-1)*pageSize+pageSize%>'> &lt;&lt; </a>
		}
	
		for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){			
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");

			if(i==totalPage) break;
			
			//&nbsp;&nbsp;<a href='pageTest.jsp?cp=<%=i%>'><%= i %></a>&nbsp;&nbsp;
		}
		
		if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'> &gt;&gt; </a>");
			
			//<a href='pageTest.jsp?cp=<%= (userGroup+1)*pageSize+1 %>'> &gt;&gt; </a>
		}
		
		return sb.toString();
	}

}
