package yong.bbs.action;

import java.io.IOException;

import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import yong.bbs.model.*;


public class BbsListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BbsDAO dao = new BbsDAO();
		
		int totalCnt = dao.getTotalCnt();
		int listSize = 7;
		int pageSize = 3;
		
		String cp_s = req.getParameter("cp");
		if(cp_s==null || cp_s.equals("")){
			cp_s = "1";
		}
		int cp = Integer.parseInt(cp_s);	
		
		ArrayList<BbsDTO> arr = dao.bbsList(cp, listSize);
		
		String pageStr = yong.page.PageModule.makePage("bbsList.yong", totalCnt, listSize, pageSize, cp);
		
		req.setAttribute("arr", arr);
		req.setAttribute("pageStr", pageStr);
		
		return "/ybbs/bbsList.jsp";
	}

}
