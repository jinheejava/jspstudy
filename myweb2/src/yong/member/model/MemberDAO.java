package yong.member.model;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int LOGIN_OK=1;
	public static final int NOT_ID=2;
	public static final int NOT_PWD=3;
	public static final int ERROR=-1;
		
	
	/** 회원가입 관련 메서드*/
	public int memJoin(MemberDTO dto){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "insert into jsp_member values(jsp_member_idx.nextval,?,?,?,?,?,sysdate)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getAddr());
			
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
	
	/** ID 중복체크 관련 메서드*/
	public boolean idCheck(String userid){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select id from jsp_member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			return rs.next();
			
		} catch(Exception e){
			e.printStackTrace();
			return false;			
		} finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();				
			} catch(Exception e2){}
		}		
	}
	
	/** 회원 검색 관련 메서드*/
	public ArrayList<MemberDTO> memFind(String key, String value){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from jsp_member where "+key+"= ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, value);
			
			rs = ps.executeQuery();
			
			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr");
				java.sql.Date joindate = rs.getDate("joindate");
				
				MemberDTO dto = new MemberDTO(idx, id, pwd, name, tel, addr, joindate);
				
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
	
	/** 강사님 : 로그인 검증 메서드*/
	public int loginCheck(String userid, String userpwd){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select pwd from jsp_member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				String dbpwd = rs.getString(1);
				
				if(dbpwd.equals(userpwd)){
					return LOGIN_OK;
				} else{
					return NOT_PWD;
				}				
			} else{
				return NOT_ID;
			}
			
		} catch(Exception e){
			e.printStackTrace();
			return ERROR;
		} finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();				
				if(conn!=null) conn.close();
				
			} catch(Exception e2){}
		}
	}
	
	/** 강사님 : 사용자 정보 추출 관련 메서드*/
	public String getUserInfo(String userid){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select name from jsp_member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			rs.next();
			
			return rs.getString(1);
			
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

}
