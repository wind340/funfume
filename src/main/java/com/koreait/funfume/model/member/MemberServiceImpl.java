package com.koreait.funfume.model.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Member;
import com.koreait.funfume.exception.MemberException;

@Service
public class MemberServiceImpl implements MemberService{

	
	@Autowired
	private MemberDAO memberDAO;
	
	public List selectAll() {
		return memberDAO.selectAll();
	}

	public Member signIn(Member member) throws MemberException{
		return memberDAO.signIn(member);
	}

	public void join(Member member) {
		memberDAO.join(member);
	}

	public void update(Member member) {
		memberDAO.update(member);
	}

	public void delete(int member_id) {
		memberDAO.delete(member_id);
	}

	public int emailCheck(String email) throws MemberException{
		int result =  memberDAO.emailCheck(email);
		
		return result;
	}

	public Member select(int member_id) {
		return memberDAO.select(member_id);
	}

//	@Override
//	public Member passCheck(String pass) {
//		return memberDAO.passCheck(pass);
//	}
}
