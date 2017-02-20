package jin.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.io.*;


public class JinController extends HttpServlet{
	
	private Map commandMap;
	
	public JinController() {
		commandMap = new HashMap();
	}
	//메서드는 변수 초기화
	
	//init은 기능 초기화
	@Override
	public void init() throws ServletException {
		
		//1. 설정파일 불러와서 키와 밸류값 가져오기
		String path = this.getServletContext().getRealPath("/WEB-INF/jinCommand.properties"); //현재 프로젝트 위치 자동으로 가져오기 뒤에 상세 위치
				
		Properties pr = new Properties();  //저장된 문자열을 키와 밸류값의 형태로 가져올 수 있음
		
		try {
			FileInputStream f = new FileInputStream(path); //해당 경로의 파일을 가져옴
			pr.load(f); //키,밸류,키,밸류 ..로 저장된 문자열 파일의 내용을 키,밸류 형태로 가져옴
			f.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
		
		//2.설정 파일의 키와 밸류 값을 가져와 객체 생성하기
		Iterator keys = pr.keySet().iterator();
		/* 맵의 키 값을 가져오는 code : .iterator()
		 * 우리는 properties 파일에서 키값을 가져와 키값에 해당하는 클래스 파일의 처리를 해주어야하므로! key값이 필요함! 
		 */		
		
		while(keys.hasNext()){
			String key = (String)keys.next();
			String value = pr.getProperty(key);
			
			try {
				Class s_object = Class.forName(value); //설계도
				Object obj = s_object.newInstance(); //설계도를 이용한 객체 생성
				
				commandMap.put(key, obj);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//class.forName - 지정된 위치의 클래스 파일을 찾아 메모리에 올려 객체로 생성할 수 있게 해준다
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/* 1단계 기본
		//1. 요청받음
		String type = req.getParameter("type");
		
		//2. 요청분석
		String result="";
		String goPage = "";
		
		if(type.equals("list")){
			//3. 요청처리
			result = "리스트 기능을 요청하였음";
			goPage ="/list.jsp";
		} else if(type.equals("write")){
			result = "글쓰기 기능을 요청하였음";
			goPage = "/write.jsp";
			
		} else if(type.equals("content")){
			result = "본문 보기 기능을 요청하였음";
			goPage = "/content.jsp";
		}
		
		//4. 저장
		req.setAttribut	e("result", result);
		
		//5. 전달
		RequestDispatcher dis = req.getRequestDispatcher(goPage);  //저장된 값을 goPage 값으로 전달
		
		dis.forward(req, resp); //요청과 응답을 forward 방식으로 전송*/
		
		
		/* 우리가 여태까지 작성했던 Model 1 방법 에서의 _ok 페이지들같이 처리기능을 해주는 것이 -Action 클래스.
		 * 이를 controller에 처리기능의 코드까지 모두 다 치면 코드가 너무 길어지니까
		 * 예전에 메소드로 빼냈던 것처럼 클래스를 따로 빼서 만들었고
		 * 클래스를 따로 만들경우 계속 객체를 생성하고 해야하므로 이 클래스들을 한번에 관리해주는
		 * 부모 클래스로 commandhandler를 만들어줌.
		 */	
		
		
		/* 2단계 
		//1. 요청받음
		String type = req.getParameter("type");
		
		//2. 요청분석
		CommandHandler cmd = null;
		
		if(type.equals("list")){
			//3. 요청처리
			cmd = new ListAction();
		} else if(type.equals("write")){
			cmd = new WriteAction();
			
		} else if(type.equals("content")){
			cmd = new ContentAction();
		}
		
		//값의 저장은 cmd에서 해주었기때문에 안해줘도 됨
		String goPage = cmd.process(req, resp);
		
		//5. 전달
		RequestDispatcher dis = req.getRequestDispatcher(goPage); 
		
		dis.forward(req, resp);
		*/
		
				
		/* 3단계 17.02.14   
		//1. 요청받음
		String type = req.getParameter("type");
		
		//2. 요청분석
		CommandHandler cmd = (CommandHandler)commandMap.get(type);
		
		//key값에 따른 처리과정을 commandMap에 저장해주었기 때문에.. 따로 조건문을 주어 설정에 따른 처리문을 따로 적어주지 않아도 됨.
		
		//값의 저장은 cmd에서 해주었기때문에 안해줘도 됨
		String goPage = cmd.process(req, resp);
		
		//5. 전달
		RequestDispatcher dis = req.getRequestDispatcher(goPage); 
		
		dis.forward(req, resp);
		*/
		
		//17.02.15 URL명령문
		//1. 요청받음
		String type = req.getRequestURI(); //사용자의 주소를 가져옴
		//System.out.println(req.getContextPath());
		if(type.indexOf(req.getContextPath())==0){ //사용자의 주소에 해당 프로젝트가 명령문으로 들어왔는지 확인  contextpath = 프로젝트명
			type = type.substring(req.getContextPath().length());			
		}
				
		//2. 요청분석
		CommandHandler cmd = (CommandHandler)commandMap.get(type);
		
		//key값에 따른 처리과정을 commandMap에 저장해주었기 때문에.. 따로 조건문을 주어 설정에 따른 처리문을 따로 적어주지 않아도 됨.
		
		//값의 저장은 cmd에서 해주었기때문에 안해줘도 됨
		String goPage = cmd.process(req, resp);
		
		//5. 전달
		RequestDispatcher dis = req.getRequestDispatcher(goPage); 
		
		dis.forward(req, resp);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
