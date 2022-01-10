package com.koreait.funfume.model.oderdetail;

import java.util.List;

import com.koreait.funfume.domain.OrderDetail;

public interface OrderDetailDAO {
	public List selectAll(int order_summary_id);
	public void insert(OrderDetail orderDetail);
}
