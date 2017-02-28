package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class HelloController {

	@RequestMapping("/hello.do")
	public ModelAndView hello(){
		
		String msg = "spring mvc framework 적용 결과";

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.setViewName("hello"); //.jsp를 써도되고 안써도 됨 ViewResolver가 사용자가 반복적으로 사용하는 접미어를 붙여준다
		
		return mav;
	}
}
