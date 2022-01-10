package com.koreait.funfume.model.paymethod;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Paymethod;

@Service
public class MybatisPaymethodService implements PaymethodService{
	
	@Autowired
	private PaymethodDAO paymethodDAO;
	
	@Override
	public Paymethod select(int paymethod_id) {
		return paymethodDAO.select(paymethod_id);
	}

	@Override
	public List selectAll() {
		return paymethodDAO.selectAll();
	}

}
