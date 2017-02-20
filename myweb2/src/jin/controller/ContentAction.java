package jin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String result = "커맨드를 적용한 본문 보기";
		
		req.setAttribute("result", result);
		
		return "/content.jsp";
	}

}
