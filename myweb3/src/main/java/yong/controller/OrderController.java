package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yong.order.model.OrderDTO;

@Controller
public class OrderController {

	@RequestMapping(value="/order.do", method=RequestMethod.GET)
	public ModelAndView orderForm(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("order/orderForm");
		
		return mav;
		
	}
	
	@RequestMapping(value="/order.do", method=RequestMethod.POST)
	public ModelAndView orderSubmit(OrderDTO dto){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("order/orderSuccess");
		
		return mav;
		
	}
}
