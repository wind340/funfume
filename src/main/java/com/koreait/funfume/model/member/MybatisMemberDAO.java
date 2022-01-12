package com.koreait.funfume.model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Member;
import com.koreait.funfume.exception.MemberException;
import com.koreait.funfume.exception.UploadException;

@Repository
public class MybatisMemberDAO implements MemberDAO{

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public List selectAll() {
		return sessionTemplate.selectList("Member.selectAll");
	}
	
	public Member select(int member_id) {
		return sessionTemplate.selectOne("Member.select", member_id);
	}

	public Member signIn(Member member)throws MemberException{
		Member result =  sessionTemplate.selectOne("Member.signIn",member);
		if(result ==null) {
			throw new MemberException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		return result;
	}

	public void join(Member member) throws MemberException{
		int result = sessionTemplate.insert("Member.join",member);
		if(result ==0) {
			throw new MemberException("회원가입 실패");
		}
	}

	public void update(Member member) throws MemberException{
		int result = sessionTemplate.update("Member.update",member);
		if(result==0) {
			throw new MemberException("수정 실패");
		}
	}

	public void delete(int member_id) throws MemberException{
		int result = sessionTemplate.delete("Member.delete",member_id);
		if(result==0) {
			throw new MemberException("회원정보 삭제 실패");
		}
	}

	public int emailCheck(String email) throws MemberException{
		int result = sessionTemplate.selectOne("Member.emailCheck",email);
		
		return result;
	}


//	@Override
//	public Member passCheck(String pass) throws MemberException{
//		Member result =  sessionTemplate.selectOne("Member.passCheck",pass);
//		if(result==null) {
//			throw new MemberException("비밀번호가 일치하지 않습니다.");
//		}
//		return result;
//	}

}





