package yong.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import yong.member.model.*;


public class MemberJoinAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String addr = req.getParameter("addr");
		
		MemberDTO dto = new MemberDTO(id, pwd, name, tel, addr);
		MemberDAO dao = new MemberDAO();
		
		int result = dao.memJoin(dto);
		
		String msg = result>0? "회원가입 성공!":"회원가입 실패 :(";
		
		req.setAttribute("msg", msg);
		
		return "/ymember/memberMsg.jsp";
	}

}
