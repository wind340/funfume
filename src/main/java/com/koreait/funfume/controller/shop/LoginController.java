package com.koreait.funfume.controller.shop;

import java.net.http.HttpHeaders;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Member;
import com.koreait.funfume.exception.MemberException;
import com.koreait.funfume.model.member.MemberService;
import com.koreait.funfume.util.HashBuilder;
import com.koreait.funfume.util.Message;

@Controller
public class LoginController {
	@Autowired
	MemberService memberService;
	@Autowired
	private HashBuilder hashBuilder;
	
	
	//로그인 폼 요청
		@GetMapping("/sign-in-form")
		public String signupForm() throws Exception {
			
			return "shop/sign-in";
		}
	
	//로그인처리
	@PostMapping("/signIn")
	@ResponseBody  //return 값에 반환된 데이터를 viewResolver가 해석하는게 아니라 메서드의 반환형으로 명시한 데이터 자체를 응답데이터로 전송
	public Message signIn(HttpServletRequest request, Member member){
		
		//서비스에 일 시키기 전에 , 비밀번호 hash값으로 변환해서 비교.
		//db의 hash값과 , 변환한 hash값이 틀린경우 인증실패.
	
		String pass = hashBuilder.convertStringToHash(member.getPass());
		member.setPass(pass);
		
		Member result = memberService.signIn(member);
		
		Message message = new Message();
		message.setCode(1);
		message.setMsg("로그인되었습니다.");
		
		//클라이언트가 재접속시 데이터를 사용할 수 있도록 session에 result담자.
		HttpSession session = request.getSession();
		session.setAttribute("member", result); //세션에 DTO저장
		return message;
	}
	
	
	//로그아웃 요청 처리
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();//세션을 무효화... 기존의 세션을 사용할 수 없게 됨
		
		return "redirect:/sign-in-form";
	}
	
	
	@ExceptionHandler(MemberException.class) 
	@ResponseBody
	public ResponseEntity<Message> handle(MemberException e) {
		org.springframework.http.HttpHeaders header = new org.springframework.http.HttpHeaders();
		header.add("Content-Type","text/html;charset=utf8");
		//한글 및 제대로된 응답정보를 구성하려면, ResponseEntity header,body { code:1,msg:"실패입니다" }  <-이런 구조화된 형태를 응답해주자
		//Gson을 직접써도되지만, 로드존슨이 이미 자동으로 json으로 변환하는 내부적 처리를 했다.   객체 -->JSON
		Message message = new Message();
		message.setCode(0);
		message.setMsg(e.getMessage());
		
		ResponseEntity <Message> entity=new ResponseEntity(message, HttpStatus.OK);
		return entity;
	}
		
	
	//회원가입 폼 요청
	@GetMapping("/memberForm")
	public String MemberForm(HttpServletRequest request){
		
		return "shop/join";
	}
	
	//회원가입시 이메일 중복체크
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		System.out.println("emailCheck진입");
		System.out.println("전달받은email : " + email);
		int result = memberService.emailCheck(email);
		System.out.println("확인결과 : "+ result);
		
		return result;
	}
	
	
	// 가입회원 비밀번호 암호화
	@RequestMapping(value="/join" ,method = RequestMethod.POST)
	public String join(Member member) throws Exception{
		System.out.println(member.getAddr1());          
		System.out.println(member.getAddr2());          
		String pass=hashBuilder.convertStringToHash(member.getPass());
		member.setPass(pass);
		
		
		memberService.join(member);

		return "redirect:/sign-in-form";
		
	}
	
}
