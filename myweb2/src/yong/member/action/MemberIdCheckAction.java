package yong.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import yong.member.model.*;
import java.util.*;

public class MemberIdCheckAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("userid");
		
		MemberDAO dao = new MemberDAO();
		
		boolean result = dao.idCheck(userid);
		
		String goPage = "";
		String msg = "";
		
		if(result){
			goPage="/ymember/idCheckMsg.jsp";
			msg = userid+"는 이미 가입되어있습니다";			
		} else {
			goPage="/ymember/idCheck_ok.jsp";
			msg = userid+"는 사용 가능합니다";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("userid", userid);
		
		return goPage;
	}

}
