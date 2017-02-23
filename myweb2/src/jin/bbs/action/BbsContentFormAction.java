package jin.bbs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.bbs.model.BbsDAO;
import jin.bbs.model.BbsDTO;
import jin.controller.CommandHandler;

public class BbsContentFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int contentidx = Integer.parseInt(req.getParameter("contentidx"));
		
		//System.out.println(contentidx);
		
		BbsDAO dao = new BbsDAO();
		
		BbsDTO dto = dao.bbsContent(contentidx);
		
		req.setAttribute("dto", dto);
		
		return "/bbs/bbsContent.jsp";
		
	}

}
