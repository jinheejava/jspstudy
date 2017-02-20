package jin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

/* 
		서블릿
	생성자(); -> 멤버변수 초기화
	init(); -> 기능 초기화
	service(); - doGet() : get 방식으로 접속할 떄 / doPost() : post방식으로 접속할 때
	destroy();
*/

public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html><head><title>");
		pw.println("서블릿으로 만듦");
		pw.println("</title></head><body>");
		
		pw.println("<h2> Hello Servlet 처음 만든 서블릿 </h2>");
		
		Calendar now = Calendar.getInstance();
		
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DATE);
		
		pw.println("<h2>"+year+"년"+(month+1)+"월"+day+"일</h2>");
		
		
		pw.println("</body></html>");
		
		pw.close();
	}
	
	

}
