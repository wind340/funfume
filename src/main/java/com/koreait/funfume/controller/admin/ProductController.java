package com.koreait.funfume.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Accord;
import com.koreait.funfume.domain.Brand;
import com.koreait.funfume.domain.Gender;
import com.koreait.funfume.domain.Note;
import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductAccord;
import com.koreait.funfume.domain.ProductGender;
import com.koreait.funfume.domain.ProductImg;
import com.koreait.funfume.domain.ProductNote;
import com.koreait.funfume.exception.AdminException;
import com.koreait.funfume.exception.ProductException;
import com.koreait.funfume.exception.ProductImgException;
import com.koreait.funfume.exception.UploadException;
import com.koreait.funfume.model.accord.AccordService;
import com.koreait.funfume.model.brand.BrandService;
import com.koreait.funfume.model.gender.GenderService;
import com.koreait.funfume.model.note.NoteService;
import com.koreait.funfume.model.product.ProductService;
import com.koreait.funfume.model.productaccord.ProductAccordService;
import com.koreait.funfume.model.productgender.ProductGenderService;
import com.koreait.funfume.model.productnote.ProductNoteService;
import com.koreait.funfume.util.FileManager;
import com.koreait.funfume.util.Pager;

/*관리자의 상품과 관련된 요청을 처리하는 하위 컨트롤러*/
@Controller
public class ProductController {
	
	@Autowired
	private FileManager fileManager;
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
	private ProductNoteService productNoteService;
	@Autowired
	private ProductAccordService productAccordService;
	@Autowired
	private ProductGenderService productGenderService;
	
	@Autowired
	private Pager pager;
	
	//상품 한건 요청
	@GetMapping("/product/detail")
	public ModelAndView getDetail(HttpServletRequest request, int product_id) {
		Product product =productService.select(product_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("product",product);
		mav.setViewName("admin/product/detail");
		
		return mav;
	}
	//상품 한건 요청 Test
	@GetMapping("/product/detail2")
	public ModelAndView getDetailTest(HttpServletRequest request, int product_id) {
		Product product =productService.select(product_id);
		List<ProductNote> productNoteList = productNoteService.selectAll();
		List<ProductAccord> productAccordList = productAccordService.selectAll();
		List<ProductGender> productGenderList = productGenderService.selectAll();
		List<Note> noteList =noteService.selectAll();
		List<Accord> accordList =accordService.selectAll();		
		List<Gender> genderList = genderService.selectAll();
		List<Brand> brandList = brandService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("product",product);
		mav.addObject("productNoteList",productNoteList);
		mav.addObject("productAccordList",productAccordList);
		mav.addObject("productGenderList",productGenderList);
		mav.addObject("noteList", noteList);
		mav.addObject("accordList", accordList);		
		mav.addObject("genderList", genderList);		
		mav.addObject("brandList", brandList);		
		mav.setViewName("admin/product/detail2");
		
		return mav;
	}
	
	
	
	//상품 목록 요청
	@GetMapping("/product/list")
	public String getList(HttpServletRequest request,Model model) {
		List<Product> productList = productService.selectAll();
		pager.init(productList, request);
		model.addAttribute("productList",productList);
		model.addAttribute("pager",pager);
		return "admin/product/list";
	}
	
	//상품 등록 폼 요청
	@GetMapping("/product/registForm")
	public ModelAndView registForm(HttpServletRequest request) {
		List<Note> noteList =noteService.selectAll();
		List<Accord> accordList =accordService.selectAll();
		List<Brand> brandList = brandService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("noteList", noteList);
		mav.addObject("accordList", accordList);
		mav.addObject("brandList", brandList);
		mav.setViewName("admin/product/regist2");
		
		return mav;
	}
	
	//상품 한 건 등록
	@RequestMapping(value="/product/regist", method=RequestMethod.POST)
	public String regist(HttpServletRequest request, Product product) {
		
		//이미지 저장 + db 넣기  
		String[] imgArray = fileManager.saveMultiFile(request, product);
		List imgList = new ArrayList();
		
		if(imgArray !=null) {
			for(String obj : imgArray) {
				ProductImg productImg = new ProductImg();
				productImg.setImg(obj);
				imgList.add(productImg);
				System.out.println(productImg.getImg());
			}
		}else {
			imgList=null;
		}
		
		//서비스에게 db저장
		productService.regist(product,imgList); //product+ product_img테이블
		System.out.println("업로드 성공");
		return "redirect:/admin/product/list";
	}
	
	
	//상품 한 건 등록 test
	@RequestMapping(value="/product/regist2", method=RequestMethod.POST)
	public String registTest(HttpServletRequest request, Product product) {
		
		//이미지 저장 + db 넣기  
		String[] imgArray = fileManager.saveMultiFile(request, product);
		List imgList = new ArrayList();
		
		if(imgArray !=null) {
			for(String obj : imgArray) {
				ProductImg productImg = new ProductImg();
				productImg.setImg(obj);
				imgList.add(productImg);
				System.out.println(productImg.getImg());
			}
		}else {
			imgList=null;
		}
		//서비스에게 db저장
		
		productService.regist(product,imgList); //product+ product_img테이블
		System.out.println("업로드 성공");
		 
		return "redirect:/admin/product/list";
	}
	
	
	//상품 한건 수정
	@RequestMapping(value ="/product/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, Product product) {
		
		String[] imgArray = fileManager.saveMultiFile(request, product);
		List imgList = new ArrayList();
		
		if(imgArray !=null) {
			for(String obj : imgArray) {
				ProductImg productImg = new ProductImg();
				productImg.setImg(obj);
				imgList.add(productImg);
				System.out.println(productImg.getImg());
			}
		}else {
			imgList=null;
		}
		
		productService.update(product,imgList);
		
		return "redirect:/admin/product/detail2?product_id="+product.getProduct_id();
		
	}

	
	@RequestMapping(value="/product/delete", method=RequestMethod.GET)
	public String delete(HttpServletRequest request, int product_id) {
		
		productService.delete(product_id);
		return "redirect:/admin/product/list";
	}
	
	
	
	@ExceptionHandler(UploadException.class)
	public ModelAndView handle(UploadException e) {
		ModelAndView mav = new ModelAndView("admin/error/result");
		mav.addObject("e",e); //에러 객체 심기
		return mav;
	}
	@ExceptionHandler(ProductException.class)
	public ModelAndView handle(ProductException e) {
		ModelAndView mav = new ModelAndView("admin/error/result");
		mav.addObject("e",e); //에러 객체 심기
		return mav;
	}
	@ExceptionHandler(ProductImgException.class)
	public ModelAndView handle(ProductImgException e) {
		ModelAndView mav = new ModelAndView("admin/error/result");
		mav.addObject("e",e); //에러 객체 심기
		return mav;
	}
	

	
}
