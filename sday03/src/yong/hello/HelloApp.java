package yong.hello;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp {

	public static void main(String[] args) {
		
		//어제와 다른 방식!
		String[] configs = {"applicationContext.xml"}; //설정파일이 여러개라면 ,를 이용해 계속 추가해줄 수 있음
		
		ApplicationContext factory = new ClassPathXmlApplicationContext(configs); //설정파일을 찾아 객체를 생성
		
		MessageBean bean = (MessageBean)factory.getBean("messageBean");
		
		bean.sayHello();		
		
	}

}
