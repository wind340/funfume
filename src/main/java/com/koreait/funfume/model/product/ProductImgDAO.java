/**
 * 
 */
package com.koreait.funfume.model.product;

import com.koreait.funfume.domain.ProductImg;

/**
 * @author easyd
 *
 */
public interface ProductImgDAO {
	
	
	public void insert(ProductImg productImg);
	public void update(ProductImg productImg);
	public void delete(int product_id);
}
