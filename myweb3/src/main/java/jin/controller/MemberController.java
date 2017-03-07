package jin.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		Boolean result = memberDao.memberIdCheck(command);
		
		System.out.println(result);
				
		ModelAndView mav = new ModelAndView();
		
		if(result){
			mav.setViewName("member/memberIdCheckResult");			
		} else{
			mav.setViewName("member/memberIdCheckOk");
			mav.addObject("id", command.getId());
		}
		
		return mav;
		
		
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView login(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/login");
		
		return mav;		
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView loginSubmit(MemberDTO command, HttpSession session, 
			@RequestParam(value="saveid", required=false) String saveid, HttpServletResponse resp, HttpServletRequest req){
		
		int result = memberDao.memberLogin(command);
		
		ModelAndView mav = new ModelAndView();
		
		if(result==memberDao.LOGIN_OK){
			
			String name = memberDao.getUserInfo(command);
			
			session.setAttribute("sname", name);
			
			//System.out.println("saveid: "+saveid);
			
			if(saveid==null || saveid.equals("")){
				Cookie ck = new Cookie("saveid", command.getId());
				ck.setMaxAge(0);
				resp.addCookie(ck);				
				
			} else{			
				Cookie ck = new Cookie("saveid", command.getId());
				ck.setMaxAge(60*60*24);
				resp.addCookie(ck);
			}
				
			mav.setViewName("member/memberLoginSuccess");
			
		} else if(result==memberDao.NOT_ID || result==memberDao.NOT_PWD){
			
			mav.setViewName("member/memberLoginFail");
			
		} else{
			
			mav.setViewName("member/memberLoginError");
		}		
		
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session){
		
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/logout");
		
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
