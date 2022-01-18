/**
 * 
 */
package com.koreait.funfume.controller.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.css.Counter;

import com.koreait.funfume.domain.OrderDetail;
import com.koreait.funfume.domain.OrderSummary;
import com.koreait.funfume.model.member.MemberService;
import com.koreait.funfume.model.orderdetail.OrderDetailService;
import com.koreait.funfume.model.ordersummary.OrderSummaryService;
import com.koreait.funfume.model.product.ProductService;
import com.koreait.funfume.util.Pager;

@Controller
public class MainController {
	//공통 로직인 서비스 보유
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderSummaryService orderSummaryService;
	
	@Autowired
	private Pager pager;
	
	@Autowired
	private MemberService memberService;
		
	@Autowired
	private OrderDetailService orderDetailService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String getMain(HttpServletRequest request, Model model) {
		int countOrder=orderSummaryService.countOrder();
		int countProduct=productService.countProduct();
		int countMember=memberService.countMember();
		model.addAttribute("countOrder", countOrder);
		model.addAttribute("countProduct", countProduct);
		model.addAttribute("countMember", countMember);
		return "admin/index";
	}
	
	//주문내역 리스트페이지
	@GetMapping("/order/list")
	public String getOrderSummary(HttpServletRequest request, Model model) {
		List<OrderSummary> orderSummaryList= orderSummaryService.adminSelectAll();
		pager.init(orderSummaryList, request);
		model.addAttribute("orderSummaryList", orderSummaryList);
		model.addAttribute("pager", pager);
	return "admin/order/list";
	}

	//주문디테일가져오기
	@GetMapping("/order/detail")
	public String getOrderDetail(Model model, int order_summary_id) {
		List<OrderDetail> orderDetailList = orderDetailService.selectAll(order_summary_id);
		model.addAttribute("orderDetailList", orderDetailList);
		return "admin/order/detail";
	}
}
