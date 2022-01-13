package com.koreait.funfume.model.orderdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Override
	public List selectAll(int order_summary_id) {
		return orderDetailDAO.selectAll(order_summary_id);
	}	
	
}
