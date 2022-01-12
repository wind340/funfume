package com.koreait.funfume.model.ordersummary;

import java.util.List;

import com.koreait.funfume.domain.OrderSummary;

public interface OrderSummaryDAO {
	public List adminSelectAll();
	public List selectAll(int member_id);
	public void insert(OrderSummary ordersummary);
}
