package com.koreait.funfume.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.koreait.funfume.domain.Member;
import com.koreait.funfume.domain.OrderSummary;
import com.koreait.funfume.domain.Product;
import com.koreait.funfume.model.odersummary.OrderSummaryService;
import com.koreait.funfume.model.product.ProductService;

@RestController
public class RestShopController {
/**
 * 2022-01-07 현재 다른 기능 구현이 우선시 되어 현 레스트 컨트롤러는  보류 
 * */	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderSummaryService orderSummaryService;
	
	@GetMapping("/rest/product")
	public List getList(HttpServletRequest request) {
		List<Product> productList = productService.selectAll();
		return productList;
	}
	@GetMapping("/rest/orderdetail")
	public List getOrderList(HttpServletRequest request) {
		List<OrderSummary> orderSummaryList = orderSummaryService.selectAll(1);
		System.out.println(orderSummaryList.get(0));
		
		return orderSummaryList;
	}
}
