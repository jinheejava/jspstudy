package yong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yong.memo.model.MemoDAO;
import yong.memo.model.MemoDTO;

@Controller
@RequestMapping("/memoWrite.do")
//해당 컨트롤러에 메소드가 2개뿐이고 명령어가 같을 경우 메소드 옆에 각각 써주지 않고 위에 통합해서 써주어도 됨.
public class MemoController {
	
	@Autowired //자동 주입을 받기위해서는 설정파일의 id값과 똑같이 정해주어야함
	private MemoDAO memoDao;	
	
	@RequestMapping(/*value="/memoWrite.do",*/ method=RequestMethod.GET ) //memoWrite.do 라는 명령어로 들어오되 GET방식 일 때 수행
	public ModelAndView memoForm(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("memo/memoForm"); //.jsp 생략
		
		return mav;
		
	}
	
	@RequestMapping(/*value="/memoWrite.do",*/ method=RequestMethod.POST) // memoWrite.do 라는 명령어로 들어오되 POST방식 일 때 수행
	public ModelAndView memoSubmit(MemoDTO command){
		/* Spring에서는 home의 이름과 DTO의 이름이 같으면 자동적으로 매칭을 해주어 DTO를 매개변수로만 넣어주면 된다
		 * 넘어오는 값들을 request.getParameter로 받아주지 않아도 자동 매칭된다 */		
		
		System.out.println(command.toString());
		
		int result = memoDao.memoWrite(command);		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("memo/memoSuccess");
		
		return mav;		
		
	}

}
