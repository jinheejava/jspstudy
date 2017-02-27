package yong.hello;

public class DbOutputter implements Outputter {

	@Override
	public void output(String msg) throws Exception {
		
		System.out.println("=DB 연동 가능=");
		System.out.println("저장 완료!");
		System.out.println("저장된 데이터: "+msg);
		System.out.println("=DB 연동 종료=");

	}

}
