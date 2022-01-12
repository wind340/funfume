/**
 * 
 */
package com.koreait.funfume.model.productgender;

import java.util.List;

import com.koreait.funfume.domain.ProductGender;

/**
 * @author easyd
 *
 */
public interface ProductGenderService {
	public List selectAll();
	public ProductGender select(int product_gender_id);
	public void insert(ProductGender productGender);
	public void update(ProductGender productGender);
	public void delete(int product_id);
}
