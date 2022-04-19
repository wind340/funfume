package com.koreait.funfume.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.koreait.funfume.exception.ProductException;
import com.koreait.funfume.exception.ProductImgException;
import com.koreait.funfume.model.productaccord.ProductAccordDAO;
import com.koreait.funfume.model.productgender.ProductGenderDAO;
import com.koreait.funfume.model.productnote.ProductNoteDAO;
import com.koreait.funfume.domain.Gender;
import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductAccord;
import com.koreait.funfume.domain.ProductGender;
import com.koreait.funfume.domain.ProductImg;
import com.koreait.funfume.domain.ProductNote;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductImgDAO productImgDAO;
	@Autowired
	private ProductNoteDAO productNoteDAO;
	@Autowired
	private ProductAccordDAO productAccordDAO;
	@Autowired
	private ProductGenderDAO productGenderDAO;

	@Override
	public List selectAll() {
		return productDAO.selectAll();
	}

	@Override
	public Product select(int product_id) {
		return productDAO.select(product_id);
	}

	//적어도 상품 등록이란? product + product_img + 이미지업로드
	@Transactional(propagation = Propagation.REQUIRED)
	public void regist(Product product , List<ProductImg> productImgList) 
			throws ProductException, ProductImgException {
		
		//product_id =0
		productDAO.insert(product);//상품정보
		//product_id = 최근에 들어간 값
		
		if(productImgList !=null) {
			for(ProductImg obj :productImgList) {
				//pk값을 채워넣자!
				obj.setProduct(product); //productImg가 필요로 하는 부모의 객체를 대입!!
				obj.getProduct().setProduct_id(product.getProduct_id());
				
				productImgDAO.insert(obj);//상품 이미지
			}
		}
		
		productNoteDAO.insert(product, product.getUploadTopNotes(), "top");
		productNoteDAO.insert(product, product.getUploadMiddleNotes(), "middle");
		productNoteDAO.insert(product, product.getUploadBaseNotes(), "base");
		
		productAccordDAO.insert(product, product.getUploadAccords());
		
		productGenderDAO.insert(product);
		
	}
	
	
	//수정
	@Override
	public void update(Product product, List<ProductImg> productImgList) throws ProductException, ProductImgException{
		productDAO.update(product);
		
		//넣기 전, 삭제
		productImgDAO.delete(product.getProduct_id());
		productNoteDAO.delete(product.getProduct_id());
		productAccordDAO.delete(product.getProduct_id());
		productGenderDAO.delete(product.getProduct_id());
		System.out.println("삭제완료");
		
		if(productImgList !=null) {
			for(ProductImg obj :productImgList) {
				//pk값을 채워넣자!
				obj.setProduct(product); //productImg가 필요로 하는 부모의 객체를 대입!!
				productImgDAO.insert(obj);//상품 이미지
			}
		}
		productNoteDAO.insert(product, product.getUploadTopNotes(), "top");
		productNoteDAO.insert(product, product.getUploadMiddleNotes(), "middle");
		productNoteDAO.insert(product, product.getUploadBaseNotes(), "base");
		productAccordDAO.insert(product, product.getUploadAccords());
		productGenderDAO.insert(product);		
		System.out.println("삽입 완료");
	}
	
	//삭제
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void delete(int product_id) throws ProductException, ProductImgException{
		productImgDAO.delete(product_id);
		productNoteDAO.delete(product_id);
		productAccordDAO.delete(product_id);
		productGenderDAO.delete(product_id);
		productDAO.delete(product_id);
	}

	
	@Override
	public List selectGender(int gender_id) {
		return productDAO.selectGender(gender_id);
	}

	@Override
	public int countProduct() {
		return productDAO.countProduct();
	}

	@Override
	public List searchKeyword(String keyword) {
		return productDAO.searchKeyword(keyword);
	}
}
