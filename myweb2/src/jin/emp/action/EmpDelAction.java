package jin.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import jin.emp.model.EmpDAO;

public class EmpDelAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("delname");
		
		EmpDAO dao = new EmpDAO();
		
		int result = dao.empDel(name);
		
		String msg = result>0?"사원 삭제 성공(mvc)":"사원 삭제 실패(mvc)";
		
		req.setAttribute("msg", msg);
		
		return "/emp/empMsg.jsp";
	}

}
