package jin.member.model;

import java.util.ArrayList;

public interface MemberDAO {
	
	public static final int LOGIN_OK =1;
	public static final int NOT_PWD = 2;
	public static final int NOT_ID = 3;
	public static final int ERROR = -1;
	
	public int memberJoin(MemberDTO dto);
	
	public Boolean memberIdCheck(MemberDTO dto);
	
	public int memberLogin(MemberDTO dto);
	
	public String getUserInfo(MemberDTO dto);

}
