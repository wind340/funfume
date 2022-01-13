package com.koreait.funfume.model.accord;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Accord;
import com.koreait.funfume.exception.AccordException;
import com.koreait.funfume.exception.UploadException;

@Repository
public class MybatisAccordDAO implements AccordDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public List selectAll() {
		return sessionTemplate.selectList("Accord.selectAll");
	}

	public Accord select(int accord_id) {
		return sessionTemplate.selectOne("Accord.select",accord_id);
	}

	public void insert(Accord accord) {
		int result = sessionTemplate.insert("Accord.insert",accord);
		if(result ==0) {
			throw new UploadException("등록실패");
		}
	}
	
	public void update(Accord accord) throws AccordException{
		int result = sessionTemplate.update("Accord.update",accord);
		if(result==0) {
			throw new AccordException("수정실패");
		}
	}

	public void delete(int accord_id){
		sessionTemplate.delete("Accord.delete",accord_id);
	}

	@Override
	public int accordCheck(String accord_name) {
		return sessionTemplate.selectOne("Accord.accordCheck",accord_name);
	}


}
