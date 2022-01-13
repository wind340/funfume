/**
 * 
 */
package com.koreait.funfume.model.productnote;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductNote;
import com.koreait.funfume.exception.ProductNoteException;

/**
 * @author easyd
 *
 */
@Service
public class ProductNoteServiceImpl implements ProductNoteService {
	
	
	@Autowired
	private ProductNoteDAO productNoteDAO;

	@Override
	public List selectAll() {
		return productNoteDAO.selectAll();
	}

	@Override
	public Product select(int product_note_id) {
		return null;
	}

	@Override
	public void insert(ProductNote productNote) throws ProductNoteException{
		productNoteDAO.insert(productNote);
	}

	@Override
	public void update(ProductNote productNote) {
	}

	@Override
	public void delete(int product_id) {
	}

}
