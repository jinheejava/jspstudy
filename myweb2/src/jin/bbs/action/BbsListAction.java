package jin.bbs.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.bbs.model.*;
import jin.controller.CommandHandler;

public class BbsListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//글 목록 정보
		BbsDTO dto = new BbsDTO();
		BbsDAO dao = new BbsDAO();
		
		int totalcnt = dao.totalCnt();
		int listsize = 7;
		int pagesize = 2;
		
		String cp_s = req.getParameter("cp");
		if(cp_s==null || cp_s==""){
			cp_s = "1";
		}
		int cp = Integer.parseInt(cp_s);
		
		int totalpage = totalcnt/listsize+1;
		if(totalcnt%listsize==0) totalpage --;
		
		int usergroup = cp/pagesize;
		if(cp%pagesize==0) usergroup --;		
		
		ArrayList<BbsDTO> arr = dao.bbsList(cp, listsize);

		req.setAttribute("arr", arr);
		req.setAttribute("pagesize", pagesize);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("usergroup", usergroup);
		
		return "/bbs/bbsList.jsp";
	}

}
