/**
 * 
 */
package com.koreait.funfume.model.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Review;

/**
 * @author easyd
 *
 */
@Repository
public class MybatisReviewDAO  implements ReviewDAO{
	
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll() {
		return null;
	}

	@Override
	public List select(int product_id) {
		return sessionTemplate.selectList("Review.select", product_id);
	}

	@Override
	public int insert(Review review) {
		return sessionTemplate.insert("Review.insert", review);
	}

	@Override
	public void update(Review review) {
	}

	@Override
	public void delete(int review_id) {
	}

}
