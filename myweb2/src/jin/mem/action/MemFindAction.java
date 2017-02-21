package jin.mem.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;

import jin.mem.model.*;

public class MemFindAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//내 코드		
		String key = req.getParameter("key");
		String value = req.getParameter("value");
		
		MemDAO dao = new MemDAO();
		
		ArrayList<MemDTO> arr = dao.memFind(key, value);
		
		req.setAttribute("arr", arr);
		
		return "/member/memberFind.jsp";
	}

}
