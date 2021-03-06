package jin.mem.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import jin.mem.model.*;

public class MemListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemDAO dao = new MemDAO();
		
		ArrayList<MemDTO> arr = dao.memList();
		
		req.setAttribute("arr", arr);
		
		return "/member/memberList.jsp";
	}

}
