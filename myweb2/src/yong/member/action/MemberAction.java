package yong.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;

public class MemberAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		return "/ymember/memberJoin.jsp";
	}

}
