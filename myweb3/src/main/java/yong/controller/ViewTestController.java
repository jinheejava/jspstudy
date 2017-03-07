package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewTestController {
	
	@RequestMapping("/viewTest1.do")
	public ModelAndView viewTest1(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("view/viewTest"); //명시적 지정 방법
		
		return mav;
		
	}
	
	@RequestMapping("/viewTest2.do")
	public String viewTest2(){
		//단순 페이지 이동일 때 반환타입으로 String 이용 가능, 명시적 지정 방법
		return "view/viewTest";
		
	}
	
	@RequestMapping("/view/viewTest.do")
	public void veiwTest3(){
	
	}
	
	@RequestMapping("viewTest3.do")
	public String viewTest4(){
		
		return "redirect:/hello.do";
		//명령어에서 다른 명령어를 실행하고 싶을 때 리턴값에 jsp 페이지를 써주는 게 아니라 redirect:/다른명령어 를 적어주면 된다
	}

}
