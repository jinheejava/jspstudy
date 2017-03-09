package yong.emp.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class EmpDAOImple implements EmpDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int empAdd(EmpDTO dto) {

		int count = sqlMap.insert("empInsert", dto); 
		
		return count;
	}
	
	/** 사원 삭제 내 코드
	public int empDel(EmpDTO dto) {
		
		int count = sqlMap.delete("empDelete", dto);
		
		return count;	
	}*/
	
	//강사님
	public int empDel(String name){
		
		int count = sqlMap.delete("empDelete", name);
		
		return count;
	}
	
	public List<EmpDTO> empList() {
		
		List list = sqlMap.selectList("empAllList");
		
		return list;		
	}
	
	public List<EmpDTO> empFind(String name) {
		
		List list = sqlMap.selectList("empFind", name);
		
		return list;
		
	}
	
	public List<EmpDTO> empUpdateFind(int idx) {
		
		List list = sqlMap.selectList("empUpdateFind", idx);
		
		return list;
	}
	
	public int empUpdate(EmpDTO dto) {
		
		int result = sqlMap.update("empUpdate", dto);
		
		System.out.println(result);
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
