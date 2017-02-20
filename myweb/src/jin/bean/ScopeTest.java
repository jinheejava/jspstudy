package jin.bean;

public class ScopeTest {
	
	private int count;
	
	public ScopeTest(){
		System.out.println("ScopeTest()생성자 호출됨");
		count = 0;
	}

	public int getCount() {
		System.out.println("count의 값: "+ count);
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println("들어온 count 값:"+count+"/누적된 count :"+this.count);
	}
	

}
