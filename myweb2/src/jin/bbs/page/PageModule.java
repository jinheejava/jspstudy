package jin.bbs.page;

public class PageModule {
	
	/* 기본 요소
	 * 1. 현재 페이지 path
	 * 2. 총 게시물 수 totalcnt
	 * 3. 보여줄 리스트 수 listsize
	 * 4. 한번에 보여줄 페이지 수 pagesize
	 * 5. 사용자의 현재 위치 cp 
	 */ 
	
	public static String makepage(String path, int totalcnt, int listsize, int pagesize, int cp){
	
		int totalpage = totalcnt/listsize+1; //총 페이지 수
		if(totalpage%listsize==0) totalpage --;
		
		int usergroup = cp/pagesize;
		if(cp%pagesize==0) usergroup --;
		
		
		
	}
}
