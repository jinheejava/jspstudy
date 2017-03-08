package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import yong.filetest.FileDTO;

import java.io.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FileController {
	
	@RequestMapping("/fileUploadForm.do")
	public String fileUploadForm(){
		
		return "file/fileUploadForm";		
	}
	
	@RequestMapping("/fileUpload1.do")
	public String fileUpload1(@RequestParam("writer") String writer, @RequestParam("upload") MultipartFile upload){
		/* MultipartFile = 우리가 기존에 사용했던 file의 스프링 버전
		 * 인터페이스로 객체를 만들 순 없음, 하지만 이를 제공받아 사용 가능.
		 * getName(): 원본 파일의 이름 x, ...등등 카페 글 참고  http://cafe.naver.com/seokstudy/1362
		 */
		
		copyInto(writer, upload);
				
		return "file/fileSuccess";		
	}
	
	@RequestMapping("/fileUpload2.do")
	public String fileUpload2(MultipartHttpServletRequest req){
		//파일을 io패키지 파일이 아니라 .. request를 이용해 멀티파트 파일..로 받겠다..?
		
		String writer = req.getParameter("writer");
		MultipartFile upload = req.getFile("upload");
		
		copyInto(writer, upload);
		
		return "file/fileSuccess";
	}
	
	@RequestMapping("/fileUpload3.do")
	public String fileUpload3(FileDTO dto){
		
		copyInto(dto.getWriter(), dto.getUpload());
		
		return "file/fileSuccess";
	}

	/**복사 관련 사용자 정의 메서드*/
	private void copyInto(String writer, MultipartFile upload){ 
		//복사 대상자가 없을 수도 있으므로 반환타입 void
		
		System.out.println("작성자: "+writer);
		System.out.println("파일명: "+upload.getOriginalFilename());
		System.out.println("임시 경로: "+upload);
		
		try {
			//1.원본파일 가져오기
			byte bytes[]=upload.getBytes();
			
			//2.복사 : 복사를 할 가상 대상자를 만들고 (File name, 경로)
			File outFile = new File("E:/한진희/upload/"+upload.getOriginalFilename()); //사용자가 upload한 이름으로 지정 경로에 만들기
			
			//3.	 원본에 대한 데이터를 복사 대상자로 하나하나 옮김
			FileOutputStream fos = new FileOutputStream(outFile);
			
			fos.write(bytes); //복사
			
			fos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		
		}
	}
	
	@RequestMapping("/fileDownList.do")
	public ModelAndView fileList(){
		
		File f = new File("E:/한진희/upload"); //다운로드할 파일이 있는 폴더를 가져와서
		//경로 지정에 따라 폴더를 가져오거나 파일을 가져옴. 위의 경우는 폴더를 통채로 가져오는거고 E:/한진희/upload/a.java 같은 경우엔 파일을 가져온다
		
		File files[] = f.listFiles(); //폴더 안의 파일 리스트를 배열로 만들고
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("files", files); //이를 사용자에게 보여지도록 뷰의 object로 등록한다
		mav.setViewName("file/fileList");
		
		return mav;
		
	}
	
	@RequestMapping("/fileDown.do")
	public ModelAndView fileDown(@RequestParam("filename") String filename){
		
		/*
		 * server web.xml에 URIEncoding="utf-8" 추가안하고 한글깨짐 방지
		  	String newfilename="";
		
			try {
				newfilename = new String(filename.getBytes("iso-8859-1"),("utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}*/
		
		File f = new File("E:/한진희/upload/"+filename);
		
		//ModelAndView mav = new ModelAndView(viewName, modelName, modelObject);
		ModelAndView mav = new ModelAndView("yongDown","downloadFile",f);
		/* viewName = DownloadView 클래스 이름  
		 * modelName = viewName(yong.view 패키지에 DownloadView의 파일)에 등록한 파일안의 파일 이름(26번째 줄)과 매칭해주어야함.
		 * modelObject = 사용자가 클릭하는 파일의 경로+이름. 위에서 설정해준 f */
		
		return mav;
		
	}
}
