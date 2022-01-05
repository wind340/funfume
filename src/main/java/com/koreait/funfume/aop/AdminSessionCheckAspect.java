package com.koreait.funfume.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.exception.AdminException;

public class AdminSessionCheckAspect {
	
	
	//관리자로 들어오는 요청에 대한 검열을 시도할 수 있는 메서드 정의
	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws AdminException,Throwable {
		Object result =null; //최종적으로 반환될 반환값
		
		//원래 호출하려던 타겟이 되는 객체
		Object target = joinPoint.getTarget();
		
		Class targetClass = target.getClass();
		Signature method = joinPoint.getSignature();
		Object[] args= joinPoint.getArgs(); //원래 타겟이 보유한 메서드의 매개변수...
		
		//HttpServletRequest 가 몇번째에 있는지 알 수 가 없으므로, 반복문으로 끄집어 내자...
		HttpServletRequest request = null;
		for(int i =0; i<args.length;i++) {
			if(args[i] instanceof HttpServletRequest) {
				request = (HttpServletRequest)args[i];
			}
		}
		
		System.out.println("원래 호출하려던 컨트롤러와 메서드는"+targetClass.getName()+ ", " +method );
		
		String uri=request.getRequestURI();
		System.out.println("uri는: "+ uri);
		if(uri.equals("/admin/login/form") || uri.equals("/admin/login")) {//그냥 가게 해주고..
			
			result= joinPoint.proceed();
		}else {
			if(request !=null) {
				//세션이 존재하는지 체크..
				HttpSession session = request.getSession();
				
				if(session.getAttribute("admin")==null) {
					//로그인 에러페이지 보여주기
					throw new AdminException("관리자 인증이 필요한 서비스입니다.");
				}else {
					result = joinPoint.proceed();//원래 호출하려던 target의 메서드 호출(가던길)
				}
			}
		}
		
		return result;
	}
	
}
