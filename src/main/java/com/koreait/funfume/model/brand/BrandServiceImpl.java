package com.koreait.funfume.model.brand;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Brand;
import com.koreait.funfume.exception.BrandException;

@Service
public class BrandServiceImpl implements BrandService{
	@Autowired
	private BrandDAO brandDAO;

	@Override
	public List selectAll() {
		return brandDAO.selectAll();
	}

	@Override
	public Brand select(int brand_id) {
		return brandDAO.select(brand_id);
	}
	
	//젇어도 상품등록은 브랜드 브랜드이미지 이미지업로드
	public void regist(Brand brand) throws BrandException{
		brandDAO.insert(brand); //상품정보
	
	
//	for(Brand obj : brandList) {
//		brandDAO.insert(obj);
//		}
	}

	@Override
	public void update(Brand brand) throws BrandException{
		brandDAO.update(brand);
	}

	@Override
	public void delete(int brand_id) throws BrandException{
		brandDAO.delete(brand_id);
	}

	

}
