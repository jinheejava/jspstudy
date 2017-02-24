package jin.bbs.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.bbs.model.*;
import jin.controller.CommandHandler;

public class BbsGuestbookAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BbsDAO dao = new BbsDAO();
		
		int totalcnt = dao.totalCnt();
		int listsize = 5;
		int pagesize = 3;
		
		String cp_s = req.getParameter("cp");
		if(cp_s==null || cp_s.equals("")){
			cp_s="1";
		}
		int cp = Integer.parseInt(cp_s);
		
		ArrayList<BbsDTO> arr = dao.bbsList(cp, listsize);
		
		req.setAttribute("arr", arr);
		
		return "/bbs/guestbook.jsp";
	}

}
