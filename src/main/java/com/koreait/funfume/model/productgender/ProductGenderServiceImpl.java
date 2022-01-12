/**
 * 
 */
package com.koreait.funfume.model.productgender;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.ProductGender;

/**
 * @author easyd
 *
 */
@Service
public class ProductGenderServiceImpl implements ProductGenderService{
	
	@Autowired
	ProductGenderDAO productGenderDAO;

	@Override
	public List selectAll() {
		return productGenderDAO.selectAll();
	}

	@Override
	public ProductGender select(int product_gender_id) {
		return null;
	}

	@Override
	public void insert(ProductGender productGender) {
		productGenderDAO.insert(productGender);
	}

	@Override
	public void update(ProductGender productGender) {
	}

	@Override
	public void delete(int product_id) {
		productGenderDAO.delete(product_id);
	}

}
