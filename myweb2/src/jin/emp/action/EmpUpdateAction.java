package jin.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import jin.emp.model.EmpDAO;

public class EmpUpdateAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx_s = req.getParameter("idx");
		int idx = Integer.parseInt(idx_s);
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String dept = req.getParameter("dept");
		
		EmpDAO dao = new EmpDAO();
		
		int result = dao.empUpdate(name, email, dept, idx);
		
		String msg = result>0?"정보 수정 완료":"수정 실패";
		
		req.setAttribute("msg", msg);
		
		return "/emp/empMsg.jsp";
		
	}

}
