
package com.koreait.funfume.model.product;

import java.util.List;

import com.koreait.funfume.domain.Product;
import com.koreait.funfume.domain.ProductImg;

//제품을 관리하는 서비스
public interface ProductService {
	public List selectAll();
	public Product select(int product_id);
	public void regist(Product product, List<ProductImg> productImgList);
	public void update(Product product);
	public void delete(int product_id);
}
