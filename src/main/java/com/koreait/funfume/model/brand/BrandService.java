package com.koreait.funfume.model.brand;

import java.util.List;

import com.koreait.funfume.domain.Brand;

//제품을 관리하는 서비스
public interface BrandService {

	
	public List selectAll();
	public Brand select(int brand_id); //한건 가져오기
	public void regist(Brand brand);
	public void update(Brand brand);
	public void delete(int brand_id);
}
