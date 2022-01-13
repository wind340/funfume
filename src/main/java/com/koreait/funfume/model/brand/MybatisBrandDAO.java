package com.koreait.funfume.model.brand;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Brand;
import com.koreait.funfume.exception.BrandException;
import com.koreait.funfume.exception.UploadException;

@Repository
public class MybatisBrandDAO implements BrandDAO{

	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Brand.selectAll");
	}

	@Override
	public Brand select(int brand_id) {
		return sessionTemplate.selectOne("Brand.select", brand_id);
	}

	@Override
	public void insert(Brand brand) throws BrandException{
		int result = sessionTemplate.insert("Brand.insert", brand);
		if(result==0) {
			throw new BrandException("상품 등록 실패");
		}
	}

	@Override
	public void update(Brand brand) throws BrandException{
		int result=sessionTemplate.update("Brand.update", brand);
		if(result == 0) {
			throw new BrandException("상품수정 실패");
		}
	}

	@Override
	public void delete(int brand_id) throws BrandException{
		int result=sessionTemplate.delete("Brand.delete", brand_id);
		if(result==0) {
			throw new BrandException("상품삭제실패");
		}
	}
}
