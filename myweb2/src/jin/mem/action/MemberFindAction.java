package jin.mem.action;

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
		//강사님코드
		req.setCharacterEncoding("utf-8"); //3 ->쭉
		
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
		
		return "/member/memberFind.jsp"; //2
	}

}
