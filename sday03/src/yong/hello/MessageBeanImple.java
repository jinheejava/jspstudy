package yong.hello;

public class MessageBeanImple implements MessageBean {

	//변경될 수 있는 ..? 내가 사용하는 데이터들은 존재하고 있다. 외부주입의 대상자들은 멤버변수로 설정
	private String name;
	private String greeting;
	
	//이름은 생성자주입 방식
	//인사말은 setter 주입방식

	public String getGreeting() {
		return greeting;
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}

	public MessageBeanImple(String name) {
		super();
		this.name = name;
	}
	
	@Override
	public void sayHello() {
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String msg = greeting+", "+name+"!";
		System.out.println(msg);

	}

}
