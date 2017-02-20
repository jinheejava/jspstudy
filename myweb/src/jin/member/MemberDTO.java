package jin.member;

import java.sql.*;

public class MemberDTO {
	
	private int idx;
	private String id;	
	private String pwd;
	private String name;
	private String tel;
	private String addr;
	private Date joindate;

	public MemberDTO(){
		//System.out.println("MemberDTO 객체 생성됨");
	}
	
	public MemberDTO(int idx, String id, String pwd, String name, String tel, String addr, Date joindate) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.joindate = joindate;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	
}