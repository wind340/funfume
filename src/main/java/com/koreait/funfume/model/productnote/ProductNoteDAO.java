package com.koreait.funfume.model.productnote;

import java.util.List;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductNote;


public interface ProductNoteDAO {
	
	public List selectAll();
	public Product select(int product_note_id);
	public void insert(ProductNote productNote);
	public void insert(Product product,String[] uploadNotes,String place);
	public void update(ProductNote productNote);
	public void delete(int product_id);
}
