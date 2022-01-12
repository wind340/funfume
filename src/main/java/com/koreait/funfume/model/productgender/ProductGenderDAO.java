/**
 * 
 */
package com.koreait.funfume.model.productgender;

import java.util.List;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductGender;
import com.koreait.funfume.domain.ProductNote;

/**
 * @author easyd
 *
 */

public interface ProductGenderDAO {
	public List selectAll();
	public ProductGender select(int product_gender_id);
	public void insert(ProductGender productGender);
	public void insert(Product product);
	public void update(ProductGender productGender);
	public void delete(int product_id);
}
