package jin.emp;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

public class EmpDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public EmpDAO(){
		System.out.println("EmpDAO 객체 생성됨");
	}
	
	/** 사원등록 관련 메서드 */
	public int empAdd(EmpDTO dto){		
		// 자원을 쓰는 코드에서는 형식처럼 써라 try-catch-finally-try-catch
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "insert into employee values(employee_idx.nextval, ?, ?, ?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			
			int count = ps.executeUpdate();
			
			return count;
			
		} catch(Exception e){
			e.printStackTrace();
			return -1; //에러가 났을 경우 -1을 반환한다 -> 0~1 정수값은 정상종료이므로 .. -1을 반환
		} finally{
			try{
				ps.close();
				conn.close();
			}catch(Exception e2){}
		}		
	}
	
	/** 사원 삭제 관련 메서드*/
	public int empDel(EmpDTO dto){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "delete from employee where name=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			
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
	
	/** 모든 사원 보기 관련 메서드*/
	//EmpDTO = 한 사원의 정보를 나타내는데 우린 모든 사원을 조회해야하므로  EmpDTO[]을 반환해주어야 한다
	public EmpDTO[] empList(){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from employee order by idx asc";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			//조회한 데이터가 몇개인지 모르므로 가변적 길이의 배열이 필요함
			Vector<EmpDTO> v = new Vector<EmpDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				
				v.add(dto);
			}
			
			EmpDTO dtos[] = new EmpDTO[v.size()];
			v.copyInto(dtos);
			//벡터 본인이 가지고 있는 데이터들을 자동적으로 복사해서 돌려줌
			
			return dtos;
			
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
	
	/** 사원 검색하기 관련 메서드 */
	public EmpDTO[] empFind(String name){
		try{
			conn = jin.db.JinDB.getConn();
			
			String sql = "select * from employee where name=? order by idx desc";
			
			ps = conn.prepareStatement(sql);			
			ps.setString(1, name);
			
			rs = ps.executeQuery();
			
			Vector<EmpDTO> v = new Vector<EmpDTO>();
			
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name2 = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				EmpDTO dto2 = new EmpDTO(idx, name2, email, dept);
				
				v.add(dto2);
			}
			
			EmpDTO dtos[] = new EmpDTO[v.size()];
			
			v.copyInto(dtos);	
			
			return dtos;
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
