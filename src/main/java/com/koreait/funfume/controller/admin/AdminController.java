package com.koreait.funfume.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.funfume.domain.Admin;
import com.koreait.funfume.exception.AdminException;
import com.koreait.funfume.model.admin.AdminService;
import com.koreait.funfume.util.HashBuilder;
import com.koreait.funfume.util.Message;


//관리자 인증과 관련된 요청을 처리하는 하위 컨트롤러
@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private HashBuilder hashBuilder;
	
	//로그인 폼 요청 처리
	@GetMapping("/login/form")
	public String getLoginForm(HttpServletRequest request) {
		return "admin/login/loginForm";
	}
	
	//로그인 요청 처리
	@PostMapping("/login")
	@ResponseBody //return 값에 반환된 데이터를 viewResolver해석하는게 아니라, 메서드의 반환형으로 명시한 데이터 자체를 전송
	public Message loginCheck(HttpServletRequest request, Admin admin) {
		
		//서비스에게 일 시키기 전에, 비밀번호를 hash값으로 변환해서 비교해야 한다
		//db의 hash값과, 변환한 hash값이 틀린 경우 인증 실패
		String pass=hashBuilder.convertStringToHash(admin.getPass());
		admin.setPass(pass);
		
		Admin result = adminService.select(admin);
		System.out.println(result);
		
		Message message = new Message();// POJO
		message.setCode(1);
		message.setMsg("인증성공");
		
		//클라이언트가 재접속시 데이터를 사용할 수 있도록  session에 result를 담자!!
		HttpSession session = request.getSession();
		session.setAttribute("admin",result); //세션에 DTO저장
		
		
		return message;
	}
	
	//로그아웃 요청 처리
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();//세션을 무효화... 기존의 세션을 사용할 수 없게 됨
		
		return "redirect:/admin/login/form";
	}
	
	@ExceptionHandler(AdminException.class)
	@ResponseBody
	public ResponseEntity<Message> handle(HttpServletRequest request, AdminException e) {
		HttpHeaders header= new HttpHeaders();
		header.add("Content-Type", "text/html;charset=utf-8");
		//한글 및 제대로 된 응답 정보를 구성하려면,ResponseEntity header,body... 제이슨으로!
		//Gson을 직접 써도 되지만, 로드존슨이 이미 자동으로 json으로 변환하는 내부적 처리를 했다! 객체 -->JSON
		
		Message message = new Message();// POJO
		message.setCode(0);
		message.setMsg(e.getMessage());		
		
		ResponseEntity<Message> entity= new ResponseEntity(message, HttpStatus.OK); //일부만 보내지말자
		return entity;
	}
	

}
