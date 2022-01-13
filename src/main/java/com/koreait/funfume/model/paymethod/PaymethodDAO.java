package com.koreait.funfume.model.paymethod;

import java.util.List;

import com.koreait.funfume.domain.Paymethod;

public interface PaymethodDAO {
	
	public List selectAll();
	public Paymethod select(int paymethod_id);
	
}
