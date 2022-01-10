package com.koreait.funfume.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Member;
import com.koreait.funfume.domain.OrderDetail;
import com.koreait.funfume.domain.OrderSummary;
import com.koreait.funfume.domain.Product;
import com.koreait.funfume.exception.OrderException;
import com.koreait.funfume.exception.ProductImgException;
import com.koreait.funfume.model.member.MemberService;
import com.koreait.funfume.model.oderdetail.OrderDetailService;
import com.koreait.funfume.model.odersummary.OrderSummaryService;
import com.koreait.funfume.model.product.ProductService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderSummaryService orderSummaryService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
	//주문페이지 불러오기
	@GetMapping("order")
	public ModelAndView getOrder(Model model,  OrderSummary orderSummary) {
		Product product =productService.select(orderSummary.getProduct_id());
		Member member = memberService.select(orderSummary.getMember_id());
		ModelAndView mav = new ModelAndView();
		OrderSummary ea = new OrderSummary();
		ea.setEa(orderSummary.getEa());
		mav.addObject("ea",ea);
		mav.addObject("product", product);
		mav.addObject("member", member);
		mav.setViewName("shop/order");
		return mav;
	}
	
	//주문 완료( DB등록 )
	@PostMapping("/ordered")
	public String registOrder(Model model, OrderSummary orderSummary) {
		orderSummaryService.regist(orderSummary);
		
		List<OrderSummary> orderSummaryList= orderSummaryService.selectAll(orderSummary.getMember_id());
		model.addAttribute("orderSummaryList", orderSummaryList);
		return "shop/ordersummary";
	}
	
	//주문요약가져오기
	@GetMapping("/ordersummary")
	public String getOrderSummary(Model model, int member_id) {
		 List<OrderSummary> orderSummaryList= orderSummaryService.selectAll(member_id);
		model.addAttribute("orderSummaryList", orderSummaryList);
		return "shop/ordersummary";
	}
	
	//주문디테일가져오기
	@GetMapping("/orderdetail")
	public String getOrderDetail(Model model, int order_summary_id) {
		List<OrderDetail> orderDetailList = orderDetailService.selectAll(order_summary_id);
		model.addAttribute("orderDetailList", orderDetailList);
		return "shop/orderdetail";
	}
	
	//에러
	@ExceptionHandler(OrderException.class)
	public ModelAndView handle(OrderException e) {
		ModelAndView mav = new ModelAndView("admin/error/result");
		mav.addObject("e",e); //에러 객체 심기
		return mav;
	}
}