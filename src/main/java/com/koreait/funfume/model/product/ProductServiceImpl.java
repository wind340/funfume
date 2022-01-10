package com.koreait.funfume.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.koreait.funfume.exception.ProductException;
import com.koreait.funfume.exception.ProductImgException;
import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductImg;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductImgDAO productImgDAO;
	

	@Override
	public List selectAll() {
		return productDAO.selectAll();
	}

	@Override
	public Product select(int product_id) {
		return productDAO.select(product_id);
	}

	//적어도 상품 등록이란? product + product_img + 이미지업로드
	public void regist(Product product , List<ProductImg> productImgList) throws ProductException, ProductImgException {
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
	}

	@Override
	public void update(Product product, List<ProductImg> productImgList) throws ProductException, ProductImgException{
		productDAO.update(product);
		productImgDAO.delete(product.getProduct_id());
		
		if(productImgList !=null) {
			for(ProductImg obj :productImgList) {
				//pk값을 채워넣자!
				obj.setProduct(product); //productImg가 필요로 하는 부모의 객체를 대입!!
				productImgDAO.insert(obj);//상품 이미지
			}
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void delete(int product_id) throws ProductException, ProductImgException{
		productImgDAO.delete(product_id);
		productDAO.delete(product_id);
	}

}
