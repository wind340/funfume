/**
 * 
 */
package com.koreait.funfume.model.productaccord;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.ProductAccord;

/**
 * @author easyd
 *
 */
@Service
public class ProductAccordServiceImpl implements ProductAccordService {
	
	@Autowired
	private ProductAccordDAO productAccordDAO;
	
	@Override
	public List selectAll() {
		return productAccordDAO.selectAll();
	}

	@Override
	public ProductAccord select(int product_accord_id) {
		return null;
	}

	@Override
	public void insert(ProductAccord productAccord) {
		productAccordDAO.insert(productAccord);
	}

	@Override
	public void update(ProductAccord productAccord) {
	}

	@Override
	public void delete(int product_id) {
		productAccordDAO.delete(product_id);
	}

}
