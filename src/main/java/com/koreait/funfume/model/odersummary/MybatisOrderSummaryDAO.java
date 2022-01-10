package com.koreait.funfume.model.odersummary;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.OrderSummary;
import com.koreait.funfume.exception.OrderException;

@Repository
public class MybatisOrderSummaryDAO implements OrderSummaryDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll(int member_id) {
		return sessionTemplate.selectList("OrderSummary.selectAll", member_id);
	}

	@Override
	public void insert(OrderSummary ordersummary) throws OrderException{
		int result = sessionTemplate.insert("OrderSummary.insert", ordersummary);
		if(result == 0) {
			throw new OrderException("주문등록실패");
		}
	}
}
