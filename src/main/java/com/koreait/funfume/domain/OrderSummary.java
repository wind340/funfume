package com.koreait.funfume.domain;

import lombok.Data;

@Data
public class OrderSummary {
	
	
	private int order_summary_id;
	private int member_id;
	private int paymethod_id;
	private String orderdate;
	private int totalpay;
	
	private int ea;
	private int product_id;

	private Member member;
	private Paymethod paymethod;
}
