package com.koreait.funfume.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Member;
import com.koreait.funfume.model.member.MemberService;
import com.koreait.funfume.util.HashBuilder;
import com.koreait.funfume.util.Pager;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private Pager pager;
	
	@Autowired
	private HashBuilder hashBuilder;
	
	
	@GetMapping("/member/list")
	public String getList(HttpServletRequest request,Model model) {
		List<Member> memberList = memberService.selectAll();
		pager.init(memberList, request);
		model.addAttribute("memberList",memberList);
		model.addAttribute("pager",pager);
		return "admin/member/list";
	}

	//업데이트 폼 요청
    @RequestMapping(value="/member/updateForm" ,method=RequestMethod.GET) 
    public ModelAndView updateForm(int member_id) { 
	    Member member = memberService.select(member_id); 
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("member",member); 
	    mav.setViewName("/admin/member/update");
	    
	    return mav;
    }
    
    @RequestMapping(value="/member/update" , method=RequestMethod.POST) 
    public String update(HttpServletRequest request, Member member) {
  
	  memberService.update(member);
	  System.out.println(member.getAddr1());
	  System.out.println(member.getAddr2());
	  System.out.println("수정성공");
	 
	  return "redirect:/admin/member/list";
	  
	}    
	
	  // 삭제
	  
	 @RequestMapping(value="/member/delete", method=RequestMethod.GET)
	 public String delete(int member_id){
		 
		 memberService.delete(member_id);
		 
		 return "redirect:/admin/member/list"; 
	 }
	 
}
