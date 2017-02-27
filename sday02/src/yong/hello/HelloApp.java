package yong.hello;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class HelloApp {

	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("applicationContext.xml");
		//ClassPathResource는 src부터 찾음
		
		BeanFactory factory = new XmlBeanFactory(resource);

		MessageBean bean = (MessageBean)factory.getBean("messageBean");
		
		bean.sayHello();
	}

}
