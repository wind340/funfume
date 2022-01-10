package com.koreait.funfume.model.odersummary;

import java.util.List;

import com.koreait.funfume.domain.OrderDetail;
import com.koreait.funfume.domain.OrderSummary;

public interface OrderSummaryService {
	
	public List selectAll(int member_id);
	public void regist(OrderSummary ordersummary);
}
