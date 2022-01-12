/**
 * 
 */
package com.koreait.funfume.model.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Review;

/**
 * @author easyd
 *
 */
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public List selectAll() {
		return null;
	}

	@Override
	public List select(int product_id) {
		return reviewDAO.select(product_id);
	}

	@Override
	public int insert(Review review) {
		return reviewDAO.insert(review);
	}

	@Override
	public void update(Review review) {
	}

	@Override
	public void delete(int review_id) {
	}

}
