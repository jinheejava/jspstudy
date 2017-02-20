package jin.bbs;

import java.sql.*;
import java.util.*;

public class BbsDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;	
	
	public BbsDAO(){
		
	}
	
	/** ref의 최고값 구하기*/
	public int getMaxRef(){
		try{
			//db를 호출해서 값을 다시 구하는게 아니라 그냥 max값을 구해놓고 아래 글쓰기 메서드에서 getMaxRef를 호출해서 사용하도록
			String sql = "select max(ref) from jsp_bbs";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			int max = 0;
			
			if(rs.next()){
				max = rs.getInt(1);
			} 
			
			return max;
			
		} catch(Exception e){
			e.printStackTrace();
			return 0;
		} finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
				//if(conn!=null) conn.close(); 여기서 conn을 닫으면 글쓰기에서 conn이 작동하지 않음				
			}catch(Exception e2){}
		}
	}
	
	/** 글쓰기 관련 메서드*/
	public int bbsWrite(BbsDTO bdto){
		try{
			conn = jin.db.JinDB.getConn();
			
			int maxref = getMaxRef();
			
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval, ?, ?, ?, ?, sysdate, 0, ?, 0, 0)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, bdto.getWriter());
			ps.setString(2, bdto.getPwd());
			ps.setString(3, bdto.getSubject());
			ps.setString(4, bdto.getContent());
			ps.setInt(5, maxref+1); //새 글을 작성할 때마다 ref 값이 1개씩 증가하도록			
			
			int count = ps.executeUpdate();
			return count;
			
		} catch(Exception e){
			e.printStackTrace();
			return -1;
		} finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();				
			}catch(Exception e2){}
		}
	}
	
	/** sunbun 수정 관련 메서드*/
	public void updateSun(int ref, int sun){
		try{
			//글쓰기에서 conn을 받았으므로 conn을 받지 않음
			String sql = "update jsp_bbs set sunbun=sunbun+1 where ref=? and sunbun>=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1,  ref);
			ps.setInt(2, sun);
			
			ps.executeUpdate();
			//count 값을 반환하지 않아도 되므로 그냥 실행만 해도 됨
			
		} catch(Exception e){
			e.printStackTrace();
			
		} finally{
			try{
				if(ps!=null) ps.close();
				
			} catch(Exception e2){}
		}
	}
	
	/** 답변 글쓰기 관련 메서드*/
	public int bbsReWrite(BbsDTO dto){
		try{
			conn = jin.db.JinDB.getConn();
			
			updateSun(dto.getRef(), dto.getSunbun()+1);
			//dto에 저장되어있는 sunbun은 원글의 sunbun이므로 +1을 해줘서 답변글의 sunbun을 가지고 와야한다
			
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getLev()+1);
			ps.setInt(7, dto.getSunbun()+1);
			//답변 글은 ref는 동일, lev과 sunbun은 1씩 증가
			
			int count = ps.executeUpdate();
			
			return count;			
			
		} catch(Exception e){
			e.printStackTrace();
			return -1;			
		} finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();				
			} catch(Exception e2){}
		}
		
	}
	
	/** 글 목록 관련 메서드*/
	public ArrayList<BbsDTO> bbsList(int cp, int ls){
		try{
			conn = jin.db.JinDB.getConn();
			
			//String sql = "select * from jsp_bbs order by idx desc";
			String sql = "select * from "+
						 "(select rownum as rnum, a.* from "+
						 "(select * from jsp_bbs order by ref desc, sunbun asc) a) b "+
						 "where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
			
			/* 현재 있는 페이지의 첫 번째 게시물부터 마지막 게시물까지 목록 보여주는 SQL문
			 * 
			 * select * from (select rownum as rnum, a.* from (select * from jsp_bbs order by idx desc) a) b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls
			 * 
			 * 이해 순서
			 * 
			 * 1. select * from jsp_bbs order by idx desc a -> jsp_bbs의 값(글)들을 idx로 정렬해줌
			 * 2. 이 결과값을 테이블 자체로 가지고 서브쿼리 짜기
			 * 3. select rownum as rnum, a.* from (select * from jsp_bbs order by idx desc) a) b
			 * 	  -> 정렬한 테이블의 값에 rownum 번호들을 매겨준다. where절에 idx를 조건으로 순서를 매겨서 글 목록(list)을 짤 경우 중간에 사용자가 글을 삭제했을 경우엔 그 idx만이 비고 나머지 값들에 대한 글들만 목록으로 보여짐
			 * 		예) where idx>=51 and idx<=55; 로  51 ~ 55 번 글을 목록으로 보여주는데 52번 게시자가 글을 삭제했을 경우 51 53 54 55 번 글만 보여져 rownum 값을 따로 매겨주고 
			 * 		    이는 쿼리를 실행할 때마다 새로 매겨지므로 중간에 비는 값이 없다
			 * 	  => 그리고 SQL문의 실행 순서가 from-where-group by-having-order by-select 순이기 때문에 이 자체에서 rnum 값으로 조건을 줄 수가 없다.
			 * 		select에서 새로 만들어준 rnum의 값을 where이 해석하지 못함
			 * 4. 이 결과값을 테이블에 넣고 모든것을 가져오는 SQL문을 짜면 테이블 안에 rnum 값이 들어가 있기 때문에 조건식에 rnum 컬럼을 사용할 수 있음.
			 *  결과적으로 :
			 *  select * from (select rownum as rnum, a.* from (select * from jsp_bbs order by idx desc) a) b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls
			 *  
			 *  cp = 현재 페이지 위치 / ls = listSize
			 *  -> (cp-1)*listSize+1 = 현재 페이지(그룹)의 첫 게시글의 번호  			(listSize 5일 경우 = 한 페이지에 게시글 5개씩 보여줄 경우) 첫 페이지면 1 / 2번째 페이지이면 6
			 *  -> cp*ls = 현재 페이지(그룹)의 마지막 게시글 번호 					 listSize가 5이고  첫 페이지면 5번 게시글까지, 2번째 페이지면 10번 게시글 까지
			 * 			 
			 */
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				
				BbsDTO dto = new BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
				
				arr.add(dto);			
			}
			return arr;
			
		} catch(Exception e){
			e.printStackTrace();
			return null;			
		} finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
				if(conn!=null) conn.close();				
			} catch(Exception e2){}
		}
	}
	
	/** 본문보기 관련 메서드*/
	public BbsDTO bbsContent(int idx){	
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from jsp_bbs where idx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			rs = ps.executeQuery();
			
			BbsDTO dto = null;
			
			if(rs.next()){
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
							
				dto = new BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun); 
			} 
			
			return dto;
			
		} catch(Exception e){
			e.printStackTrace();
			return null;			
		} finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
				if(conn!=null) conn.close();				
			} catch(Exception e2){}
		}
	}
	
	/** 총 게시물 수 관련 메서드*/
	public int getTotalCnt(){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select count(*) from jsp_bbs";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			rs.next();
			
			int count = rs.getInt(1);
			count = count==0?1:count;
			
			return count;		
		}catch(Exception e){
			e.printStackTrace();
			return 1;
			//에러가 나도 첫 페이지가 보이게 1을 반환해줌
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
				if(conn!=null) conn.close();				
			}catch(Exception e2){}
		}
	}
	
	/*  답변형 게시판 만들 때 규칙
	 * 1. 본문글을 쓸 때는 ref는 순차적으로 증가, lev과 sunbun은 0으로 초기화
	 * 2. 답변글을 쓸 때는 ref는 동일, lev과 sunbun은 1씩 증가
	 * 3. (원본글에 답변글이 있고 그 답변글에 또 다른 답변글이 있는데 원본글에 다시 답변글을 쓸 때)나와 같은 ref와 sunbun을 가지는 이후 sunbun을 1씩 증가
	 * 
	 *     	    글순서	r    l    s
	 * 첫번째 원글(1)   1    0    0
	 *  답변 글(4)		1	 1	  1		(3번 규칙)
	 * 	답변 글(2)	 	1	 1	  1(+1) -> 2
	 * 	  답변 글(3)    1	 2	  2(+1) -> 3
	 * 
	 * 두번째 원글 	    2    0    0
	 * 	답변 글		2	 1	  1	
	 *	  답변 글 		2	 2	  2
	 *		 
	 * 세번째 원글 		3  	 0	  0 	
	 */
	
	/** 게시물 수정하기 */
	public int updateWrite(int idx, String sub, String con){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "update jsp_bbs set subject=?, content=? where idx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, sub);
			ps.setString(2, con);
			ps.setInt(3, idx);
			
			int count = ps.executeUpdate();
			
			return count;		
			
		} catch(Exception e){
			e.printStackTrace();
			return -1;			
		} finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch(Exception e2){}
		}
	}
	
	/** 게시물 삭제하기*/
	public int bbsDelete(int idx){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "delete from jsp_bbs where idx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			int count = ps.executeUpdate();
			
			return count;
			
		} catch(Exception e){
			e.printStackTrace();
			return -1;			
		} finally{
			try{
				if(ps!=null) ps.close();
				
				if(conn!=null) conn.close();			
			} catch(Exception e2){}
		}	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
