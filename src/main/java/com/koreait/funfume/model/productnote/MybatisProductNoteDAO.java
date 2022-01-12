/**
 * 
 */
package com.koreait.funfume.model.productnote;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductNote;
import com.koreait.funfume.exception.ProductNoteException;
import com.koreait.funfume.exception.UploadException;

/**
 * @author easyd
 *
 */
@Repository
public class MybatisProductNoteDAO implements ProductNoteDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List selectAll() {
		return sessionTemplate.selectList("ProductNote.selectAll");
	}

	@Override
	public Product select(int product_note_id) {
		return null;
	}

	@Override
	public void insert(Product product,String[] uploadNotes,String place) throws ProductNoteException{
		for(int i=0; i<uploadNotes.length;i++) {
			int note_id = Integer.parseInt(uploadNotes[i]);
			ProductNote productNote= new ProductNote();
			productNote.setNote_id(note_id);
			productNote.setProduct_id(product.getProduct_id());
			productNote.setNote_place(place);
			int result = sessionTemplate.insert("ProductNote.insert",productNote );
			if(result ==0) {
				throw new ProductNoteException("상품 등록 실패");
			}		
		}
		
		
	}
	@Override
	public void insert(ProductNote productNote) throws ProductNoteException{
		int result = sessionTemplate.insert("ProductNote.insert",productNote );
		
		if(result ==0) {
			throw new ProductNoteException("상품 등록 실패");
		}		
	}

	@Override
	public void update(ProductNote productNote) {
	}

	@Override
	public void delete(int product_id) {
		int result = sessionTemplate.delete("ProductNote.delete",product_id );
	}

}
