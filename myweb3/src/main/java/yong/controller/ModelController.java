package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

@Controller
public class ModelController {

	@RequestMapping("/modelTest1.do")
	public String modelTest1(Map model){
		//Map=인터페이스, new로 객체 생성X
		//Spring은 내가 생성하고 싶은 객체를 매개변수로 적어주면 자동으로 생성해주기 때문에 우린 바로 사용하면 된다
		
		model.put("result", "Map 객체를 이용한 데이터 전달"); //return에 지정해주지 않아도 자동으로 다음 jsp로 전달
		
		return "model/modelSuccess";
	}
	
	@RequestMapping("/modelTest2.do")
	public String modelTest2(Model model){
		
		model.addAttribute("result", "Model 객체를 이용한 데이터 전달");
		
		return "model/modelSuccess";		
	}
	
	@RequestMapping("/modelTest3.do")
	public String modelTest3(ModelMap model){
		
		model.addAttribute("result", "ModelMap 객체를 이용한 데이터 전달");		
		
		return "model/modelSuccess";		
	}
	
	/*@RequestMapping("/model/modelSuccess.do")
	public Map modelTest4(){		
		//반환타입의 경우에는 진입 메소드와는 달리 생성해서 사용해야 함, model은 인터페이스니까 model을 상속받아 만든 자식 객체 Hashmap을 이용해 객체 생성
		Map model = new HashMap();
		
		model.put("result", "Map을 반환해서 데이터 전달");
		
		return model;
	}*/
	
	@RequestMapping("/model/modelSuccess.do")
	public Model modelTest5(){		
		//Model은 인터페이스라 new를 이용하여 객체를 생성할 수 없어서 model을 상속받아 만든 자식 객체를 이용해 객체를 생성한다
		Model model = new ExtendedModelMap();
		
		model.addAttribute("result", "Model을 반환해 전달한 데이터");
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
