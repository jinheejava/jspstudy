package jin.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAOImple implements MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int LOGIN_OK =1;
	public static final int NOT_PWD = 2;
	public static final int NOT_ID = 3;
	public static final int ERROR = -1;
	
	/** 회원가입 관련 메서드 */
	public int memberJoin(MemberDTO dto){
		try{
			conn = yong.db.YongDB.getConn();
			
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
	
	/** ID 중복체크 관련 메서드 */
	public Boolean memberIdCheck(MemberDTO dto) {
		try{
			conn = yong.db.YongDB.getConn();
			
			String sql = "select id from jsp_member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			
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
	
	/** 로그인 관련 메서드 */
	public int memberLogin(MemberDTO dto){
		try{
			conn = yong.db.YongDB.getConn();
			
			String sql = "select pwd from jsp_member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				
				String db_pwd = rs.getString("pwd");
				
				if(db_pwd.equals(dto.getPwd())){
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
	
	/** 로그인 성공 시 유저 정보 관련 메서드*/
	public String getUserInfo(MemberDTO dto){
		try{
			conn = yong.db.YongDB.getConn();
			
			String sql = "select name from jsp_member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			
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
