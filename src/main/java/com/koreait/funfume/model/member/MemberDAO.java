package com.koreait.funfume.model.member;

import java.util.List;

import com.koreait.funfume.domain.Member;
import com.koreait.funfume.domain.Note;

public interface MemberDAO {
	public List selectAll();
	public Member select(int member_id);
}
