/**
 * 
 */
package com.koreait.funfume.controller.shop;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.koreait.funfume.domain.Accord;
import com.koreait.funfume.domain.Brand;
import com.koreait.funfume.domain.Gender;
import com.koreait.funfume.domain.Member;
import com.koreait.funfume.domain.Note;
import com.koreait.funfume.domain.Notice;
import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductAccord;
import com.koreait.funfume.domain.ProductGender;
import com.koreait.funfume.domain.ProductNote;
import com.koreait.funfume.domain.Review;
import com.koreait.funfume.model.accord.AccordService;
import com.koreait.funfume.model.brand.BrandService;
import com.koreait.funfume.model.gender.GenderService;
import com.koreait.funfume.model.member.MemberService;
import com.koreait.funfume.model.note.NoteService;
import com.koreait.funfume.model.notice.NoticeService;
import com.koreait.funfume.model.product.ProductService;
import com.koreait.funfume.model.productaccord.ProductAccordService;
import com.koreait.funfume.model.productgender.ProductGenderService;
import com.koreait.funfume.model.productnote.ProductNoteService;
import com.koreait.funfume.model.review.ReviewService;
import com.koreait.funfume.util.Message;
import com.mysql.cj.xdevapi.JsonArray;

@Controller
public class ShopController {
	//?????? ????????? ????????? ??????
	@Autowired
	private ProductService productService;
	@Autowired
	private NoteService noteService;
	@Autowired
	private AccordService accordService;
	@Autowired
	private GenderService genderService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private ProductAccordService productAccordService;
	@Autowired
	private ProductNoteService productNoteService;
	@Autowired
	private ProductGenderService productGenderService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private NoticeService noticeService;

	@GetMapping("/")
	public String getMain(HttpServletRequest request, Model model) {
		List<Product> productList = productService.selectAll();
		model.addAttribute("productList",productList);
		return "shop/index";
	}
	
	//?????? ?????? ??????
	@RequestMapping(value="/product-detail")
	public ModelAndView getDetail(HttpServletRequest request, @RequestParam(name="product_id", defaultValue = "0") int product_id) {
		Product product = productService.select(product_id);
		List<Product> productList = productService.selectAll();
		List<Note> noteList =noteService.selectAll();
		List<Accord> accordList =accordService.selectAll();		
		List<Gender> genderList = genderService.selectAll();		 
		List<Brand> brandList = brandService.selectAll();		 
		List<ProductNote> productNoteList = productNoteService.selectAll();
		List<ProductAccord> productAccordList = productAccordService.selectAll();
		List<ProductGender> productGenderList = productGenderService.selectAll();
		
		ModelAndView mav = new ModelAndView("shop/product-detail");
		mav.addObject("product",product);
		mav.addObject("productList",productList);
		mav.addObject("noteList", noteList);
		mav.addObject("accordList", accordList);		
		mav.addObject("genderList", genderList);		
		mav.addObject("brandList", brandList);		
		mav.addObject("productNoteList",productNoteList);
		mav.addObject("productAccordList",productAccordList);
		mav.addObject("productGenderList",productGenderList);
		return mav;
	}
	
	//??????????????? ??????
	@GetMapping("/shop")
	public String getProduct(HttpServletRequest request, Model model) {
		List<Product> productList = productService.selectAll();
		model.addAttribute("productList", productList);
		return "shop/product";
	}
	
	//index?????? gender ??????
	@GetMapping("/product-gender")
	public String getProductGender(HttpServletRequest request,Model model, int gender_id) {
		//??????????????????
		List<Product> productList=productService.selectGender(gender_id);
		model.addAttribute("productList", productList);
		return "shop/product-gender";
	}
	
	//?????? ???????????? ???????????? ??????
	@RequestMapping(value="/productList", method=RequestMethod.GET)
	@ResponseBody
	public List productList(HttpServletRequest request) {
		List<Product> productList=productService.selectAll();
		return productList;
	}
	//?????? ???????????? ???????????? ??????
	@RequestMapping(value="/genderList", method=RequestMethod.GET)
	@ResponseBody
	public List genderList(HttpServletRequest request, @RequestParam(name="gender_id" , defaultValue="0") int gender_id) {
		List<Product> genderList=productService.selectGender(gender_id);
		return genderList;
	}
	
	
	//??????????????? ??????
	@GetMapping("/features")
	public ModelAndView getCart() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/shoping-cart");
		return mav;
	}
	
	
	//about ??????
	@GetMapping("/about")
	public ModelAndView getAbout() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/about");
		return mav;
	}
	
	//Notice??????
	@GetMapping("/notice")
	public ModelAndView getNotice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/notice");
		return mav;
	}
	
	//Notice ?????? ?????? 
	@GetMapping("/notice-detail")
	public ModelAndView getNoticeDetail(int notice_id) {
		noticeService.plusHit(notice_id);	//????????? ???????????? ?????????+1
		Notice notice = noticeService.select(notice_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice", notice);
		mav.setViewName("shop/notice-detail");
		return mav;
	}
	
	
	//??? ?????? ????????? ??????
	@GetMapping("/myaccount")
	public ModelAndView getMyAccount(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/myaccount");
		return mav;
	}
	
	//??????????????? ??????
	@GetMapping("/mypage")
	public ModelAndView getMyPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/mypage");
		return mav;
	}
	
	//???????????? ??????
	@RequestMapping(value="/review-regist", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Message> reviewRegist(HttpServletRequest request, Review review ) {
		int result =reviewService.insert(review);
		System.out.println("product_id: " + review.getProduct_id());
		System.out.println("name" + review.getName());
		System.out.println("email" + review.getEmail());
		System.out.println("review " + review.getReview());
		System.out.println("rating " + review.getRating());
		System.out.println(result);
		
		Message message = new Message();
		message.setMsg("????????????");
		message.setCode(1);		
		
		ResponseEntity<Message> entity = new ResponseEntity<Message>(message,HttpStatus.OK); //200	
		return entity;		
		
		
	}
	
	@RequestMapping(value = "/review-list")
	@ResponseBody
	public ResponseEntity<Message> reviewList(HttpServletRequest request, int product_id){
		List<Review> reviewList = reviewService.select(product_id);
		
		Message message = new Message();
		message.setMsg("????????????");
		message.setCode(1);	
		message.setList(reviewList);
		
		ResponseEntity<Message> entity = new ResponseEntity<Message>(message,HttpStatus.OK); //200
		return entity;
	}
	
	
	@GetMapping("/search")
	public String getSearch(String keyword, Model model) {
		List<Product> searchList = productService.searchKeyword(keyword);
		model.addAttribute("searchList", searchList);
		return "shop/search";
	}

}
