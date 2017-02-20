package jin.emp.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;

import jin.emp.model.*;

public class EmpInfoAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EmpDAO dao = new EmpDAO();
		
		String idx_s = req.getParameter("idx_s");
		//System.out.println(idx_s);
		int useridx = Integer.parseInt(idx_s);
		
		EmpDTO dto = dao.empInfo(useridx);
		
		req.setAttribute("dto", dto);
		
		return "/emp/empUpdate.jsp";
	}

}
