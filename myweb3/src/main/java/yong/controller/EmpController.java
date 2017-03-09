package yong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yong.emp.model.EmpDAO;
import yong.emp.model.EmpDTO;

@Controller
public class EmpController {
	
	@Autowired
	private EmpDAO empDao;

	@RequestMapping("/emp.do")
	public String empMain(){
		
		return "emp/emp";
	}
	
	@RequestMapping("/empAdd.do")
	public ModelAndView empAddAction(EmpDTO dto){
		
		int result = empDao.empAdd(dto);
		
		String msg = result>0?"사원등록 완료":"사원등록 실패";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		
		return mav;
	}
	
	/* 내코드
 	@RequestMapping("/empDel.do")
	public ModelAndView empDelAction(EmpDTO dto){
		
		int result = empDao.empDel(dto);
		
		String msg = result>0?"사원삭제 성공":"사원삭제 실패";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		
		return mav;
		
	}*/
	
	//사원삭제 강사님코드
	@RequestMapping("/empDel.do")
	public String empDelAction(@RequestParam("name") String name,Model model){
		
		int result = empDao.empDel(name);
		
		String msg = result>0?"사원삭제 성공":"사원삭제 실패";
		
		model.addAttribute("msg", msg);
		
		return "emp/empMsg"; 	
	}
	
	@RequestMapping("/empList.do")
	public ModelAndView empListAction(){
		
		List<EmpDTO> list = empDao.empList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("emplist", list);
		mav.setViewName("emp/empList");
		
		return mav;
	}
	
	@RequestMapping("/empFind.do")
	public ModelAndView empFindAction(@RequestParam("name") String name){
		
		List<EmpDTO> list = empDao.empFind(name);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("empFindList", list);
		mav.setViewName("emp/emp");
		
		return mav;		
		
	}
	
	@RequestMapping("/empUpdateFind.do")
	public ModelAndView empUpdateFind(@RequestParam("idx") int idx){
		
		List<EmpDTO> list = empDao.empUpdateFind(idx);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("empUpdateFind", list);
		mav.setViewName("emp/emp");
		
		return mav;
		
	}
	
	@RequestMapping("/empUpdate.do")
	public String empUpdate(EmpDTO dto, Model model){
		
		int result = empDao.empUpdate(dto);
		
		String msg = result>0?"사원수정 성공":"사원수정 실패";
		
		model.addAttribute("msg", msg);
		
		return "emp/empMsg";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
