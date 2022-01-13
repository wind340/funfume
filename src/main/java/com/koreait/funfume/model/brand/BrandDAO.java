package com.koreait.funfume.model.brand;

import java.util.List;

import com.koreait.funfume.domain.Brand;

public interface BrandDAO {
	
	public List selectAll();
	public Brand select(int brand_id); //한건 가져오기
	public void insert(Brand brand);
	public void update(Brand brand);
	public void delete(int brand_id);
}
