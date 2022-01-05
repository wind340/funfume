package com.koreait.funfume.model.accord;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Accord;

@Service
public class AccordServiceImpl implements AccordService{

	@Autowired
	private AccordDAO accordDAO;
	
	
	public List selectAll() {
		return accordDAO.selectAll();
	}

	public Accord select(int accord_id) {
		return accordDAO.select(accord_id);
	}

	public void regist(Accord accord) {
		accordDAO.insert(accord);
	}

	public void update(Accord accord) {
		accordDAO.update(accord);
	}

	public void delete(int accord_id) {
		accordDAO.delete(accord_id);
	}

	public int accordCheck(String accord_name) {
		return accordDAO.accordCheck(accord_name);
	}

}
