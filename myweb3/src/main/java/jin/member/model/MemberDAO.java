package jin.member.model;

public interface MemberDAO {
	
	public int memberJoin(MemberDTO dto);
	
	public String memberIdCheck(MemberDTO dto);

}
