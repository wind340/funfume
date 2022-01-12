/**
 * 
 */
package com.koreait.funfume.model.productgender;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductGender;

/**
 * @author easyd
 *
 */
@Repository
public class MybatisProductGenderDAO implements ProductGenderDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("ProductGender.selectAll");
	}

	@Override
	public ProductGender select(int product_gender_id) {
		return null;
	}

	@Override
	public void insert(ProductGender productGender) {
		sessionTemplate.insert("ProductGender.insert",productGender);
	}
	@Override
	public void insert(Product product) {
		ProductGender productGender = new ProductGender();
		productGender.setGender_id(product.getGender_id());
		productGender.setProduct_id(product.getProduct_id());		
		sessionTemplate.insert("ProductGender.insert",productGender);
	}

	@Override
	public void update(ProductGender productGender) {
	}

	@Override
	public void delete(int product_id) {
		sessionTemplate.delete("ProductGender.delete",product_id );
	}

}
