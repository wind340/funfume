package com.koreait.funfume.domain;

import lombok.Data;

@Data
public class OrderDetail {
	private int order_detail_id;
	private int ea;
	private int order_summary_id;
	private int product_id;
	
	private Product product;
	private OrderSummary orderSummary;
}
