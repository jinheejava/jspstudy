package yong.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import jin.mem.model.*;

public class MemberFindAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8"); //3 -> 아래 쭉
		// post방식 한글 깨짐 방지
		
		String method = req.getMethod();
		String fkey = req.getParameter("key");
		String fvalue = req.getParameter("value");
		
		MemDAO dao = new MemDAO();
		
		ArrayList<MemDTO> arr = null;		
		
		if(method.equals("POST")){
			arr = dao.memFind(fkey, fvalue);
			req.setAttribute("dtos", arr);
		}
		
		req.setAttribute("method", method); //1
		
		return "/ymember/memberFind.jsp"; //2
	}

}
