package jin.bbs.model;

import java.sql.*;
import java.util.ArrayList;

import jin.bbs.*;
import jin.mem.model.*;

public class BbsDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/** 글쓰기 관련 메서드*/	
	public int bbsWrite(BbsDTO dto){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,0,0,0)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			
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
	
	/** 목록용 글 정보 가져오기 메서드*/
	public ArrayList<BbsDTO> bbsList(int cp, int ls){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from "+
						"(select rownum as rnum, a.* from "+
						"(select * from jsp_bbs order by idx desc, sunbun asc) a) b "+
						"where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
			
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

	
	/** 총 게시물 수 관련 메서드*/
	public int totalCnt(){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select count(*) from jsp_bbs";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			rs.next();
			
			return rs.getInt(1);
			
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
	
	/** 본문보기 관련 메서드 */
	public BbsDTO bbsContent(int contentidx){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from jsp_bbs where idx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, contentidx);
			
			rs = ps.executeQuery();
			
			BbsDTO dto = null;
			if(rs.next()){
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
				
				dto = new BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
			}
			
			return dto;
			
		} catch(Exception e){
			e.printStackTrace();
			return null;
		} finally{
			try{
				
			} catch(Exception e2){}
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
