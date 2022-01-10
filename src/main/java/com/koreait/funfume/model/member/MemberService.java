package com.koreait.funfume.model.member;

import java.util.List;

import com.koreait.funfume.domain.Member;

public interface MemberService {
	public List selectAll();
	public Member select(int member_id);
}
