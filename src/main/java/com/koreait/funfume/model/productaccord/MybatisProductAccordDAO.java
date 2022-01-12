/**
 * 
 */
package com.koreait.funfume.model.productaccord;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductAccord;
import com.koreait.funfume.domain.ProductNote;
import com.koreait.funfume.exception.ProductAccordException;
import com.koreait.funfume.exception.ProductNoteException;
import com.koreait.funfume.exception.UploadException;

/**
 * @author easyd
 *
 */
@Repository
public class MybatisProductAccordDAO implements ProductAccordDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("ProductAccord.selectAll");
	}

	@Override
	public ProductAccord select(int product_accord_id)  {
		return null;
	}

	@Override
	public void insert(ProductAccord productAccord) throws ProductAccordException {
		int result = sessionTemplate.insert("ProductAccord.insert",productAccord);
		if(result ==0) {
			throw new ProductAccordException("상품 등록 실패");
		}				
	}
	
	@Override
	public void insert(Product product,String[] uploadAccords) throws ProductAccordException{
		for(int i=0; i<uploadAccords.length;i++) {
			int accord_id = Integer.parseInt(uploadAccords[i]);
			ProductAccord productAccord = new ProductAccord();
			productAccord.setAccord_id(accord_id);
			productAccord.setProduct_id(product.getProduct_id());
			int result = sessionTemplate.insert("ProductAccord.insert",productAccord );
			if(result ==0) {
				throw new ProductNoteException("상품 등록 실패");
			}		
		}
		
		
	}

	@Override
	public void update(ProductAccord productAccord) throws ProductAccordException {
	}

	@Override
	public void delete(int product_id) throws ProductAccordException{
		int result = sessionTemplate.delete("ProductAccord.delete",product_id);
	}

}
