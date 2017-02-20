package jin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GradeTest extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html><head><title>");
		pw.println("성적 관리");
		pw.println("</title>");
		
		pw.println("<script>");
		
		pw.println("function show(){"
		+"var kor = parseInt(document.fm.kor.value);"
		+"var eng = parseInt(document.fm.eng.value);"
		+"var mat = parseInt(document.fm.mat.value);"
		+"var sum = kor+eng+mat;"
		+"var avg = sum/3;"
		+"window.alert('총점 : '+ sum +'평균 : '+avg);"
		+"}");		
		
		pw.println("</script>");
		pw.println("</head><body>");
		
		pw.println("<form name='fm'>");
		pw.println("<h2>성적 입력</h2>");
		
		pw.println("<table border='1' cellspacing='0'>");
		
		pw.println("<tr>");
		pw.println("<th> 국어 </th>");
		pw.println("<td> <input type='text' name='kor'> </td> </tr>");		
		
		pw.println("<tr> <th> 영어 </th>");
		pw.println("<td> <input type='text' name='eng'> </td> </tr>");
		
		pw.println("<tr> <th> 수학 </th>");
		pw.println("<td> <input type='text' name='mat'> </td> </tr>");
		
		pw.println("<tr> <td colspan='2' align='center'> <input type='button' value='확인' onclick='show()'>"
				+ "<input type='reset' value='다시입력'");
		
		pw.println("</table>");
		
		pw.println("</form></body></html>");
		pw.close();
		
	}
	
	

}
