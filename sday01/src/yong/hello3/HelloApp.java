package yong.hello3;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class HelloApp {

	public static void main(String[] args) {

		Resource resource = new ClassPathResource("applicationContext.xml"); //설정 문서를 가져오고
		//ClassPathResource는 src부터 찾음
		
		BeanFactory factory = new XmlBeanFactory(resource); //문서를 이용해 객체 생성
		
		MessageBean bean = (MessageBean)factory.getBean("messageBean"); //기능 수행

		bean.sayHello("spring");
	}

}
