/**
 * 
 */
package com.koreait.funfume.model.product;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductNote;

/**
 * @author easyd
 *
 */

public interface ProductDAO {
	public List selectAll();
	public Product select(int product_id);
	public List selectGender(int gender_id);
	public void insert(Product product);
	public void update(Product product);
	public void delete(int product_id);
	public int countProduct();
	public List searchKeyword(String keyword);

}
