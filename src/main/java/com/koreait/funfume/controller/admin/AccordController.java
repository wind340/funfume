package com.koreait.funfume.controller.admin;

import java.lang.System.Logger;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Accord;
import com.koreait.funfume.exception.UploadException;
import com.koreait.funfume.model.accord.AccordService;
import com.koreait.funfume.util.Pager;

/*향 목록과 관련된 요청처리하는 하위 컨트롤러*/
@Controller
public class AccordController {
	
	@Autowired
	private AccordService accordService;
	
	@Autowired
	private Pager pager;
	
	//향기 목록 요청
		@GetMapping("/accord/list")
		public String getList(HttpServletRequest request,Model model) {
			List<Accord> accordList = accordService.selectAll();
			pager.init(accordList, request);
			model.addAttribute("accordList",accordList);
			model.addAttribute("pager",pager);
			return "admin/accord/list";
		}
		
		//향기 등록 폼 요청
		@GetMapping("/accord/registForm")
		public String registForm() {
			
			return "admin/accord/regist";
		}
		
		//향기등록
		@RequestMapping(value="/accord/regist", method=RequestMethod.POST)
		public String regist(HttpServletRequest request, Accord accord) {
			

			//서비스에게 db저장
			accordService.regist(accord); 
			
			System.out.println("업로드 성공");
			
			return "redirect:/admin/accord/list";
		}
		
		//향기이름 중복검사
		@RequestMapping(value="/accord/accordCheck", method=RequestMethod.POST)
		@ResponseBody
		public String accordCheck(String accord_name) throws Exception{
			
			  int result = accordService.accordCheck(accord_name);
			  
			  System.out.println("결과값="+result);
			  
			  if(result!=0) {
				  return "fail";
			  }else {
				  return "success";
			  }
			 
		}
		
		
		//향기수정
		@RequestMapping(value= "/accord/updateForm", method=RequestMethod.GET)
		public ModelAndView updateForm(int accord_id) {
			Accord accord = accordService.select(accord_id);
			ModelAndView mav = new ModelAndView();
			mav.addObject("accord",accord);
			mav.setViewName("/admin/accord/update");
			return mav;
		}
		
		//수정
		@RequestMapping(value="/accord/update", method=RequestMethod.POST)
		public String update(HttpServletRequest request, Accord accord) {
		
			accordService.update(accord);

			System.out.println("수정성공");
			
			return "redirect:/admin/accord/list";
		}
		
		
		// 삭제
		@RequestMapping(value="/accord/delete", method=RequestMethod.GET)
		public String delete(int accord_id){
			
			accordService.delete(accord_id);
			
			return "redirect:/admin/accord/list";
		}		
		
		

}
