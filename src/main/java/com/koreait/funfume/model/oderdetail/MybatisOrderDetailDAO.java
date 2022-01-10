package com.koreait.funfume.model.oderdetail;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.OrderDetail;
import com.koreait.funfume.exception.OrderException;

@Repository
public class MybatisOrderDetailDAO implements OrderDetailDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll(int order_summary_id) {
		return sessionTemplate.selectList("OrderDetail.selectAll", order_summary_id);
	}

	@Override
	public void insert(OrderDetail orderDetail) throws OrderException {
		int result= sessionTemplate.insert("OrderDetail.insert", orderDetail);
		if(result==0) {
			throw new OrderException("주문등록실패");
		}
	}
}
