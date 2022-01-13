package com.koreait.funfume.model.paymethod;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Paymethod;

@Repository
public class MybatisPaymethodDAO implements PaymethodDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public Paymethod select(int paymethod_id) {
		return sessionTemplate.selectOne("Paymethod.select", paymethod_id);
	}

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Paymethod.selectAll");
	}
	
}
