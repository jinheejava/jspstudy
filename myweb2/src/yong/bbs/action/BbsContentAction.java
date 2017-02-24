package yong.bbs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jin.controller.CommandHandler;
import yong.bbs.model.*;

public class BbsContentAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx_s = req.getParameter("idx");
		if(idx_s==null || idx_s.equals("")){
			idx_s="0";
		}
		int idx = Integer.parseInt(idx_s);
		
		BbsDAO dao = new BbsDAO();
		BbsDTO dto = dao.bbsContent(idx);
		
		String msg = "";
		String gopage ="";
		
		if(dto==null){
			msg = "삭제된 게시글이거나 잘못된 접근입니다";
			gopage = "/ybbs/bbsMsg.jsp";
			
			req.setAttribute("msg", msg);
		} else{
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			req.setAttribute("content", dto);
			gopage = "/ybbs/bbsContent.jsp";
		}
		
		return gopage;
	}

}
