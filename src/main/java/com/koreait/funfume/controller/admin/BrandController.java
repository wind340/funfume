package com.koreait.funfume.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Brand;
import com.koreait.funfume.exception.BrandException;
import com.koreait.funfume.exception.UploadException;
import com.koreait.funfume.model.brand.BrandService;
import com.koreait.funfume.util.FileManager;
import com.koreait.funfume.util.Pager;

/*관맂아의 상품과 관련된 요청을 처리하는 하위 컨트롤러*/
@Controller
public class BrandController {
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private Pager pager;
	
	//브랜드목록요청
	@GetMapping("/brand/list")
	public String getList(HttpServletRequest request, Model model) {
		List<Brand> brandList = brandService.selectAll();
		pager.init(brandList, request);
		
		model.addAttribute("brandList", brandList);
		model.addAttribute("pager", pager);
		
		return "admin/brand/list";
	}
	
	//상품등록 폼 요청
	@GetMapping("/brand/registform")
	public String registForm() {
		
		return "admin/brand/regist";
	}
	
	//등록처리
	@RequestMapping(value="/brand/regist", method=RequestMethod.POST)
	public String regist(HttpServletRequest request,Brand brand) {
		
		//이미지 저장 + db에 저장
		String img=FileManager.saveAsFile(request, brand);
		brand.setBrand_img(img);//empty
			 //3124234.jpg
			//imgList.add(brand1); //리스트에 모으기
		
		
		//서비스에게 db저장
		brandService.regist(brand);
		
		return "redirect:/admin/brand/list";
	}
	
	@GetMapping("/brand/detail")
	public String getDetail(int brand_id, Model model) {
		//3단계 한건의 데이터 가져오기
		Brand brand=brandService.select(brand_id);
		//4단계 저장
		model.addAttribute("brand", brand);
		
		return "admin/brand/detail";
	}
	
	//브랜드 수정
		@PostMapping("/brand/update")
		public ModelAndView update(HttpServletRequest request, Brand brand) {
			System.out.println(brand.getImgFiles().getOriginalFilename());
			int checkFile=brand.getImgFiles().getOriginalFilename().length();
			if(checkFile>0) {
				String filename = fileManager.saveAsFile(request, brand);
				brand.setBrand_img(filename);	
			}
			brandService.update(brand);
			
			ModelAndView mav = new ModelAndView("redirect:/admin/brand/detail?brand_id="+brand.getBrand_id());
			return mav;
		}
//		
		//브랜드 삭제
		@GetMapping("/brand/delete")
		public String delete(int brand_id) {
			//3단계
			brandService.delete(brand_id);
			return "redirect:/admin/brand/list";
		}
	
	
	@ExceptionHandler(UploadException.class)
	public ModelAndView handle(UploadException e) {
		ModelAndView mav = new ModelAndView("");
		mav.addObject("e", e); //에러객체 심기
		return mav;
	}
	
	@ExceptionHandler(BrandException.class)
	public ModelAndView handle(BrandException e) {
		ModelAndView mav = new ModelAndView("");
		mav.addObject("e", e); //에러객체 심기
		return mav;
	}
}
