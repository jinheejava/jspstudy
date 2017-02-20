package jin.bbs;

import java.sql.*;

public class BbsDTO {
	
	private int idx;
	private String writer;
	private String pwd;
	private String subject;
	private String content;
	private Date writedate;
	private int readnum;
	private int ref; //그룹화 (답변글은 원본 글에 종속되어있어야 하기 때문에.. )
	private int lev; //들여쓰기 (원본 글에 답변인지, 답변글에 답변글인지)
	private int sunbun; //그룹내의 순서(그룹 내에서 최신글 일때 위로 올라가도록)
	
	public BbsDTO(){

	} 
	
	public BbsDTO(int idx, String writer, String subject, int readnum) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.readnum = readnum;
	}
		

	public BbsDTO(int idx, String writer, String subject, String content, Date writedate, int readnum) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
	}

	
	public BbsDTO(int idx, String writer, String pwd, String subject, String content, Date writedate, int readnum,
			int ref, int lev, int sunbun) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.pwd = pwd;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		readnum = 0;
		this.readnum = readnum;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}
	
	
}
