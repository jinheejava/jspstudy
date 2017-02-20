package jin.emp.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import jin.emp.model.EmpDAO;
import jin.emp.model.EmpDTO;

public class EmpFindAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		
		EmpDAO dao = new EmpDAO();
		ArrayList<EmpDTO> arr = dao.empFind(name);
		
		req.setAttribute("arr", arr);
		
		return "/emp/empFind.jsp";
	}

}
