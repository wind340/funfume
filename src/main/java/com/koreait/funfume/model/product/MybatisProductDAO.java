package com.koreait.funfume.model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.exception.ProductException;
import com.koreait.funfume.exception.UploadException;
import com.koreait.funfume.domain.Product;
@Repository
public class MybatisProductDAO implements ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Product.selectAll");
	}

	@Override
	public Product select(int product_id) {
		Product product =sessionTemplate.selectOne("Product.select",product_id);
		return product;
	}

	@Override
	public void insert(Product product) throws ProductException{
		int result = sessionTemplate.insert("Product.insert",product);
		if(result ==0) {
			throw new UploadException("상품 등록 실패");
		}
	}

	@Override
	public void update(Product product) throws ProductException{
		int result = sessionTemplate.update("Product.update",product);
		if(result ==0) {
			throw new UploadException("상품 수정 실패");
		}
	}

	@Override
	public void delete(int product_id)throws ProductException {
		int result = sessionTemplate.delete("Product.delete",product_id);
		if(result ==0) {
			throw new UploadException("상품 삭제 실패");
		}		
	}
	
	@Override
	public List selectGender(int gender_id) {
		return sessionTemplate.selectList("Product.selectGender", gender_id);
	}


}
