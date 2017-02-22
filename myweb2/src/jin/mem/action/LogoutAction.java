package jin.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jin.controller.CommandHandler;

public class LogoutAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		session.invalidate();
		return "/member/logout.jsp";
		/* 바로 index.jsp 페이지로 가면 로그아웃 한 후에 재 로그인이 안되기때문에 징검다리 .jsp를 하나 더 만들어주어야 한다 */
	}

}
