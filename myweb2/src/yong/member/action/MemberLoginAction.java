package yong.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jin.controller.CommandHandler;
import jin.mem.model.*;

public class MemberLoginAction implements CommandHandler {

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
			gopage = "/ymember/login_ok.jsp";
			
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
			gopage = "/ymember/loginMsg.jsp";
			
		} else if(result==dao.NOT_PWD){
			msg = "잘못된 비밀번호입니다";
			gopage = "/ymember/loginMsg.jsp";
		}
		
		req.setAttribute("msg", msg);
		
		return gopage;

	}
	

}
