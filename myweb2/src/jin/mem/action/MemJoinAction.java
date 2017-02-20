package jin.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import jin.mem.model.*;
import java.util.*;

public class MemJoinAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String addr = req.getParameter("addr");
		
		MemDTO dto = new MemDTO(id, pwd, name, tel, addr);
		MemDAO dao = new MemDAO();
		
		int result = dao.memJoin(dto);
		
		String msg = result>0? "회원가입 성공!":"회원가입 실패 :(";
		
		req.setAttribute("msg", msg);
		
		return "/member/memberMsg.jsp";
	}

}
