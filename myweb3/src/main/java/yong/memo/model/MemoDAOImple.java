package yong.memo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemoDAOImple implements MemoDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;	

	public int memoWrite(MemoDTO dto) {
	
		try{
			conn = yong.db.YongDB.getConn();
			
			String sql = "insert into memo values(?,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getIdx());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			
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
