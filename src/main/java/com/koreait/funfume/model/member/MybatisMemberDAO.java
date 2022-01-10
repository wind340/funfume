package com.koreait.funfume.model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Member;

@Repository
public class MybatisMemberDAO implements MemberDAO{
	
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Member.selectAll");
	}

	@Override
	public Member select(int member_id) {
		return sessionTemplate.selectOne("Member.select", member_id);
	}

}
