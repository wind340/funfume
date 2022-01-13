/**
 * 
 */
package com.koreait.funfume.model.review;

import java.util.List;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductNote;
import com.koreait.funfume.domain.Review;

/**
 * @author easyd
 *
 */
public interface ReviewDAO {
	
	public List selectAll();
	public List select(int product_id);
	public int insert(Review review);
	public void update(Review review);
	public void delete(int review_id);	
}
