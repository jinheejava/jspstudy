package yong.emp.model;

import java.util.List;

public interface EmpDAO {
	
	public int empAdd(EmpDTO dto);
	
//	public int empDel(EmpDTO dto);
	
	public int empDel(String name);
	
	public List<EmpDTO> empList();
	
	public List<EmpDTO> empFind(String name);
	
	public List<EmpDTO> empUpdateFind(int idx);
	
	public int empUpdate(EmpDTO dto);

}
