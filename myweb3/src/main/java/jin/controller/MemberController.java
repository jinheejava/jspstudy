package jin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jin.member.model.MemberDAO;
import jin.member.model.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberDao; 

	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public ModelAndView memberJoin(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/memberJoin");
		
		return mav;
		
	}
	
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.POST)
	public ModelAndView memberJoinSubmit(MemberDTO command){
		
		System.out.println(command.toString());
		
		int result = memberDao.memberJoin(command);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/memberSuccess");
		
		return mav;
		
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	public ModelAndView idCheck(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/memberIdCheck");
		
		return mav;
		
		
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public ModelAndView idCheckSubmit(MemberDTO command){
		
		String result = memberDao.memberIdCheck(command);
		
		System.out.println(result);
				
		ModelAndView mav = new ModelAndView();
		
		if(result==null || result.equals("")){
			mav.setViewName("member/memberIdCheckOk");
			mav.addObject("id", command.getId());
		} else{
			mav.setViewName("member/memberIdCheckResult");
		}
		
		return mav;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
