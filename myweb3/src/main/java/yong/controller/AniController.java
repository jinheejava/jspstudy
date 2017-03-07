package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AniController {
	
	@ModelAttribute("keyword") //해당 컨트롤러에 관리되는 모든 메소드에 전달된다
	public String[] getKeyword(){
		
		String keyword[]={"세일러문", "천사소녀 네티", "해모수", "라젠카", "다간"};
		
		return keyword;
	}
	
	@ModelAttribute("cate") 
	public String[] getCategory(){
		
		String cate[]={"한국", "일본", "미국"};
		
		return cate;
	}

	@RequestMapping("/aniFindA.do")
	public ModelAndView aniFindA(){
		
		/* 중복되는 내용을 모듈화 시킴
		 * String keyword[]={"세일러문", "천사소녀 네티", "해모수", "라젠카", "다간"};
		 * String cate[]={"한국", "일본", "미국"};*/		
				
		ModelAndView mav = new ModelAndView();
		
		/* 각 메소드가 실행될 때마다 값을 저장하고 전달하고 할 필요없이 중복되는 내용을 반환해주는 메소드에
		   ModelAttribute annotation을 이용해 자동으로 모든 메소드에 저장되어 전달되므로 생략 가능
		 * mav.addObject("keyword", keyword);
		 * mav.addObject("cate", cate);*/
		
		/* 각 메소드가 실행될 때마다 값을 저장하고 전달하고 할 필요없이 중복되는 내용을 반환해주는 메소드에
		   ModelAttribute annotation을 이용해 자동으로 모든 메소드에 저장되어 전달되므로 생략 가능
		 * mav.addObject("keyword", getKeyword());
		 * mav.addObject("cate", getCategory());*/
		
		mav.setViewName("ani/aniFindA");
		
		return mav;		
	}
	
	@RequestMapping("/aniFindB.do")
	public String aniFindB(Model model){	
		
		/*String keyword[]={"세일러문", "천사소녀 네티", "해모수", "라젠카", "다간"};
		
		String cate[]={"한국", "일본", "미국"};*/		
		
		/*mav.addObject("keyword", keyword);
		mav.addObject("cate", cate);*/
		
		/*model.addAttribute("keyword", getKeyword());
		model.addAttribute("cate", getCategory());*/
		
		return "ani/aniFindB";		
	}
}
