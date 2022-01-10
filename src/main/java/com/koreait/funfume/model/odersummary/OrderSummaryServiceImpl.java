package com.koreait.funfume.model.odersummary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.OrderDetail;
import com.koreait.funfume.domain.OrderSummary;
import com.koreait.funfume.exception.OrderException;
import com.koreait.funfume.model.oderdetail.OrderDetailDAO;

@Service
public class OrderSummaryServiceImpl implements OrderSummaryService {
	
	
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;

	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Override
	public List selectAll(int member_id) {
		return orderSummaryDAO.selectAll(member_id);
	}

	@Override
	public void regist(OrderSummary ordersummary) throws OrderException {
		
		orderSummaryDAO.insert(ordersummary);
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setEa(ordersummary.getEa());
		orderDetail.setProduct_id(ordersummary.getProduct_id());
		orderDetail.setOrder_summary_id(ordersummary.getOrder_summary_id());
		orderDetailDAO.insert(orderDetail);
		
	}
}
