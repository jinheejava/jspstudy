package jin.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jin.controller.CommandHandler;
import jin.mem.model.*;

public class LoginAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("userid");
		String userpwd = req.getParameter("userpwd");
		
		//ID기억하기 추가
		String saveid = req.getParameter("saveid");
		//
		
		MemDAO dao = new MemDAO();
		
		int result = dao.loginCheck(userid, userpwd);
		
		String msg = "";
		String gopage = "";		
		
		if(result==dao.LOGIN_OK){
			String username = dao.getUserInfo(userid);
			
			HttpSession session = req.getSession();
			
			session.setAttribute("sid", userid);
			session.setAttribute("sname", username);
			
			msg = username+"님 환영합니다";
			gopage = "/member/login_ok.jsp";
			
			//ID 기억하기
			if(saveid==null || saveid.equals("")){
				//체크하지 않았을 경우 cookie 지우기
				Cookie ck = new Cookie("saveid", userid);
				ck.setMaxAge(0);
				resp.addCookie(ck);
				
			} else{
				Cookie ck = new Cookie("saveid", userid);
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}
			
			
		} else if(result==dao.NOT_ID){
			msg = "가입되어 있지 않은 ID입니다";
			gopage = "/member/loginMsg.jsp";
			
		} else if(result==dao.NOT_PWD){
			msg = "잘못된 비밀번호입니다";
			gopage = "/member/loginMsg.jsp";
		}
		
		req.setAttribute("msg", msg);
		
		return gopage;
		
		/* 내 코드
		String userid = req.getParameter("id");
		String userpwd = req.getParameter("pwd");
		
		MemDAO dao = new MemDAO();
		
		int result = dao.memLogin(userid, userpwd);
		
		String goPage = "";
		String msg = "";		
		
		if(result==3){			
			goPage = "/member/loginMsg.jsp";
			msg = "환영합니다";			
			
			MemDTO dto = dao.getInfo(userid);
			String name = dto.getName();	
			
			HttpSession session = req.getSession();
			session.setAttribute("name", name);
			
			String checked = req.getParameter("checked");
			
			Cookie ck = new Cookie("checked", checked);
			ck.setMaxAge(60*60*60);
			resp.addCookie(ck);			
			
		} else if(result==2){			
			goPage = "/member/loginFailMsg.jsp";
			msg = "비밀번호를 확인해주세요";			
		} else{			
			goPage = "/member/loginFailMsg.jsp";
			msg = "ID가 없습니다";			
		}
		
		req.setAttribute("msg", msg);	
		
		return goPage;
		*/
	}
	

}
