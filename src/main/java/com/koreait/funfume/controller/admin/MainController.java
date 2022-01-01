/**
 * 
 */
package com.koreait.funfume.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.model.product.ProductService;

@Controller
public class MainController {
	//공통 로직인 서비스 보유
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView getMain() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/index");
		//System.out.println(productService);
		
		return mav;
	}
}
