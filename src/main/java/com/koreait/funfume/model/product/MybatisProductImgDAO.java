/**
 * 
 */
package com.koreait.funfume.model.product;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductImg;
import com.koreait.funfume.exception.ProductImgException;

@Repository
public class MybatisProductImgDAO implements ProductImgDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public void insert(ProductImg productImg) throws ProductImgException {
		int result =sessionTemplate.insert("ProductImg.insert",productImg);
		if(result ==0) {
			throw new ProductImgException("상품 사진 insert 실패");
		}
	}

	@Override
	public void update(ProductImg productImg) throws ProductImgException {
		int result =sessionTemplate.update("ProductImg.update",productImg);
		if(result ==0) {
			throw new ProductImgException("상품 사진 update 실패");
		}		
	}

	@Override
	public void delete(int product_id) throws ProductImgException {
		int result = sessionTemplate.delete("ProductImg.delete",product_id);
		
	}
	
}
