package com.koreait.funfume.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Member;
import com.koreait.funfume.model.member.MemberService;
import com.koreait.funfume.util.HashBuilder;
import com.koreait.funfume.util.Message;

@Controller
public class MyPageController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private HashBuilder hashBuilder;
	
	//수정폼
	@RequestMapping(value="/myinfoUpdateForm", method=RequestMethod.POST)
	public ModelAndView updateForm(int member_id) {
		Member member = memberService.select(member_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("Member",member);
		mav.setViewName("/myinfoUpdateForm");
		return mav;
	}
	
	//수정시 비밀번호 확인
	/*
	 * @PostMapping("/passCheck")
	 * 
	 * @ResponseBody public Message passCheck(HttpServletRequest request, Member
	 * member) { String pass = hashBuilder.convertStringToHash(member.getPass());
	 * member.setPass(pass);
	 * 
	 * Member result = memberService.passCheck(pass);
	 * 
	 * Message message = new Message(); message.setCode(1);
	 * message.setMsg("회원정보가 수정되었습니다.");
	 * 
	 * return message; }
	 */
	
	//수정
	@RequestMapping(value="/myinfoUpdate", method=RequestMethod.POST)
	public String update(HttpServletRequest request, Member member) {
		
		String pass = hashBuilder.convertStringToHash(member.getPass());
		member.setPass(pass);

		memberService.update(member);
		System.out.println("수정성공");
		
		return "redirect:/mypage";
	}
	
	//회원탈퇴-삭제
	// 삭제
	@RequestMapping(value="/infoDel", method=RequestMethod.GET)
	public String delete(int member_id){
		
		memberService.delete(member_id);
		
		return "redirect:/logout";
	}		
	
}
