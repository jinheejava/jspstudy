package jin.member;

import java.util.*;
import java.sql.*;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;
	
	
	public MemberDAO(){
		//System.out.println("MemberDAO 생성자 호출 됨");		
	}
	
	/** 회원가입 관련 메서드 */
	public int memberJoin(MemberDTO dto){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "insert into jsp_member values(jsp_member_idx.nextval, ?,?,?,?,?,sysdate)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getAddr());
			
			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;			
		} finally {
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();				
			} catch(Exception e2){}
		}
	}
	
	/** 중복 검사 관련 메서드 */
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
	public ArrayList<MemberDTO> memberFind(String fkey, String fvalue){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from jsp_member where "+fkey+"=?";
			//where ?=? : 는 사용할 수 없다 인파라미터는 컬럼에 사용할 수 없고 value 값에만 사용할 수 있음
			//컬럼에 사용하고 싶을경우엔 위의 sql처럼 문자열 결합으로 넣어주어야 함!
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			
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
				//여러개의 클래스를 import해서 사용할 경우 사용하려는 변수가 어느클래스에서 import 되었는지
				//경로를 적어주는것이 좋다
				
				MemberDTO dto = new MemberDTO(idx, id, pwd, name, tel, addr, joindate);
				
				arr.add(dto);		
			}
			
			return arr;		
		} catch(Exception e){
			e.printStackTrace();
			return null;			
		} finally {
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
				if(conn!=null) conn.close();
				
			} catch(Exception e2){}
		}
		
	}
	
	/** 로그인 관련 메서드 */
	public int loginCheck(String userid, String userpwd){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select pwd from jsp_member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				String db_pwd = rs.getString("pwd");
				
				if(userpwd.equals(db_pwd)){
					return LOGIN_OK;
				} else {
					return NOT_PWD;
				}			
			} else {
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
	
	/** 로그인 성공 시 유저 정보 가져오기 */
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
		} finally {
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
				if(conn!=null) conn.close();				
			} catch(Exception e2){}
		}		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}