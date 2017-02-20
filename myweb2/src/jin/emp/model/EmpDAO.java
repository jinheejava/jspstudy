package jin.emp.model;

import java.security.spec.RSAKeyGenParameterSpec;
import java.sql.*;
import java.util.*;

public class EmpDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/** 사원 등록 관련 메서드 */
	public int empAdd(EmpDTO dto){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "insert into employee values(employee_idx.nextval,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			
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
	
	/** 사원 삭제 관련 메서드*/
	public int empDel(String name){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "delete from employee where name=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			
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
	
	/** 사원 목록 보기 관련 메서드*/
	public ArrayList<EmpDTO> empList(){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from employee order by idx";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				EmpDTO dto = new EmpDTO(idx, name, email, dept);
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
	
	/** 사원 검색 관련 메서드 */
	public ArrayList<EmpDTO> empFind(String username){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from employee where name=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			
			rs = ps.executeQuery();
			
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				
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
	
	/** 사원 정보 조회 관련 메서드*/
	public EmpDTO empInfo(int useridx){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from employee where idx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, useridx);
			
			rs = ps.executeQuery();
			
			EmpDTO dto = null;
			
			if(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				dto = new EmpDTO(idx, name, email, dept);			
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
	
	/** 사원 수정 관련 메서드 */
	public int empUpdate(String name, String email, String dept, int idx){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "update employee set name=?,email=?,dept=? where idx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, dept);
			ps.setInt(4, idx);
			
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
