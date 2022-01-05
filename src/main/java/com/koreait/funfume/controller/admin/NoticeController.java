package com.koreait.funfume.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class NoticeController {
	
	
	@GetMapping("/notice/list")
	public String getList(HttpServletRequest request) {
		
		
		
		return "admin/notice/list";
	}
	
	@GetMapping("/notice/registForm")
	public String getForm(HttpServletRequest request) {
		
		
		
		return "admin/notice/regist";
	}
}
