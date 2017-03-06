package yong.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ParamController {

	@RequestMapping("/paramTest.do")
	public ModelAndView paramTest(@RequestParam(value="idx", defaultValue="1") int idx,
			@RequestParam(value="str", required=false) String str){ /*Spring은 페이지 이동에서 넘어오는 파라미터들을 @RequestParam를 이용해 매개값으로 넣으면 자동으로 받아와지며 
																	뒤에 내가 적은 자료형으로 자동 형변환 해줌 */
		/* http://localhost:9090/myweb3/paramTest.do?idx=3&str=spring => 실행O
		 * http://localhost:9090/myweb3/paramTest.do?idx=3 => 에러
		 * @RequestParam은 필수값으로 여겨져 파라미터 값이 없을 경우엔 에러 발생.
		 * 뒤에 required=false 옵션을 주면 선택값으로 여겨지게 변경되어 페이지 실행 가능하다.
		 * 그럼 http://localhost:9090/myweb3/paramTest.do => 에러 why?
		 * Spring은  선택값으로 된 파라미터가 없을 경우엔 null을 넣게 되는데 idx는 정수형으로 null을 정수형으로 변환을 하려다보니 에러가 발생한다.
		 * 이 때에는, 파라미터가 없을 경우에 자동적으로 넘어가는 기본값을 defaultValue 옵션으로 설정할 수 있고 이럴 때에는 값이 없는 것이 아니므로 required 옵션은 사용하지 않아도 된다.*/
		
		System.out.println("idx: "+idx);
		System.out.println("str: "+str);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("param/paramSuccess");
		
		return mav;
	}
	
	@RequestMapping("/cookieView.do")
	public ModelAndView cookieView(@CookieValue(value="saveid", required=false, defaultValue="noId") String saveid){
		/* 쿠키에 저장되어 있는 값을 가져올 때 @CookieValue("키값")을 이용, 쿠키값은 없을 수도 있으니 required 옵션은 필수적 !
		 * required 옵션을 필수적으로 주던가, defaultValue를 설정해주던가! */
		
		System.out.println("saveid: "+saveid);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("param/paramSuccess");
		
		return mav;
		
	}
	
	@RequestMapping("/cookieMake.do")
	public ModelAndView cookieMake(HttpServletResponse resp){
		
		Cookie ck = new Cookie("saveid", "hong");
		ck.setMaxAge(60*60);
		//Response 객체는 서블릿의 객체 -> HttpServletResponse를 매개변수로 설정해주면 된다
		resp.addCookie(ck);		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("param/paramSuccess");
		
		return mav;
	}
	
	@RequestMapping("/sessionView.do")
	public ModelAndView sessionView(HttpServletRequest req){
		
		/* 세션 값 확인하기 */
		HttpSession session = req.getSession();
		
		String name = (String)session.getAttribute("name");
		
		System.out.println("name: "+name);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("param/paramSuccess");
		
		return mav;
	}
	
	@RequestMapping("/sessionMake.do")
	public ModelAndView sessionMake(HttpSession session){
		
		/* 세션 저장하기 */
		session.setAttribute("name", "홍길동");		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("param/paramSuccess");
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
