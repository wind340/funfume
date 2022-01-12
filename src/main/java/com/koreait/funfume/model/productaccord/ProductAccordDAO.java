/**
 * 
 */
package com.koreait.funfume.model.productaccord;

import java.util.List;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductAccord;

/**
 * @author easyd
 *
 */
public interface ProductAccordDAO {
	public List selectAll();
	public ProductAccord select(int product_accord_id);
	public void insert(ProductAccord productAccord);
	public void insert(Product product,String[] uploadAccords);
	public void update(ProductAccord productAccord);
	public void delete(int product_id);	
}
