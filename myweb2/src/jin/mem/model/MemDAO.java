package jin.mem.model;

import java.sql.*;
import java.util.ArrayList;

public class MemDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/** 회원가입 관련 메서드*/
	public int memJoin(MemDTO dto){
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
	
	/** 회원 조회 관련 메서드*/
	public ArrayList<MemDTO> memList(){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from jsp_member order by idx asc";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			ArrayList<MemDTO> arr = new ArrayList<MemDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr");
				Date joindate = rs.getDate("joindate");
				
				MemDTO dto = new MemDTO(idx, id, pwd, name, tel, addr, joindate);
				
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
