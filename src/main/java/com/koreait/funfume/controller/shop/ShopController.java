package com.koreait.funfume.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Note;
import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductImg;
import com.koreait.funfume.model.product.ProductService;
import com.koreait.funfume.util.Pager;

@Controller
public class ShopController {
	//공통 로직인 서비스 보유
	@Autowired
	private ProductService productService;
	
	@Autowired
	private Pager pager;
	
	//메인페이지 요청
	@GetMapping("/")
	public String getMain(HttpServletRequest request, Model model) {
		List<Product> productList = productService.selectAll();
		model.addAttribute("productList",productList);
		return "shop/index";
	}
	
	//상품페이지 요청
	@GetMapping("/shop")
	public String getProduct(HttpServletRequest request, Model model) {
		List<Product> productList = productService.selectAll();
		model.addAttribute("productList",productList);
		return "shop/product";
	}
	
	//상품 디테일 페이지 요청
	@GetMapping("/product-detail")
	public ModelAndView getProductDetail(HttpServletRequest request, int product_id) {
		Product product =productService.select(product_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("product",product);
		mav.setViewName("shop/product-detail");
		return mav;
	}
	
	//
	@GetMapping("/features")
	public ModelAndView getCart() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/shoping-cart");
		return mav;
	}
	@GetMapping("/about")
	public ModelAndView getAbout() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/about");
		return mav;
	}
	@GetMapping("/blog")
	public ModelAndView getBlog() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/blog");
		return mav;
	}
	@GetMapping("/blogdetail")
	public ModelAndView getBlogDetail() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/blog-detail");
		return mav;
	}
	@GetMapping("/myaccount")
	public ModelAndView getMyAccount() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/myaccount");
		return mav;
	}
	@GetMapping("/mypage")
	public ModelAndView getMyPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/mypage");
		return mav;
	}

}
