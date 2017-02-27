package yong.hello;

public class MessageBeanImple implements MessageBean {

	//interface를 상속받아 생성된 클래스엔 접미로 Imple을 붙여 표시해줌
	
	private String name;
	private String greeting;
	private Outputter output;
	//요구사항(파일 저장 , DB 저장)을 변경할수 있기 때문에 Ouputter를 자료형으로 선언
	
	//이름은 생성자 주입방식
	//인삿말은 설정파일 주입방식
	//output 설정파일 주입방식
	
	public MessageBeanImple(String name) {
		super();
		this.name = name;
	}
	
	public String getGreeting() {
		return greeting;
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	
	public Outputter getOutput() {
		return output;
	}

	public void setOutput(Outputter output) {
		this.output = output;
	}

	@Override
	public void sayHello() {
			
		String msg = greeting+", "+name+"!";
		System.out.println(msg);
		
		try {
			output.output(msg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
