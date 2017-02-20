package jin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class GuguServlet extends HttpServlet{
	
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
		pw.println("서블릿으로 구구단 만들기");
		pw.println("</title></head><body>");
		
		pw.println("<h2> 서블릿으로 구구단 만들기 </h2>");
		
		pw.println("<table border='1' width='550' bordercolor='navy' cellspacing='0'>");
		
		for(int j=1; j<=9; j++){//행을 담당
			pw.println("<tr>");
			for(int i=2; i<=9; i++){//열을 담당
				pw.println("<td>");
				pw.println(i+"*"+j+"="+(j*i));
				pw.println("</td>");
			}
			pw.println("</tr>");
		}
			
		pw.println("</table>");
		
		pw.println("</body></html>");
		
		
		pw.close();	
	
	}
	

}
