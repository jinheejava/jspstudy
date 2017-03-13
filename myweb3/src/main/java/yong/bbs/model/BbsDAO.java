package yong.bbs.model;

import java.util.*;

public interface BbsDAO {
	
	public List<BbsDTO> bbsList(int cp, int ls);
	
	public int getTotalCnt();

}
