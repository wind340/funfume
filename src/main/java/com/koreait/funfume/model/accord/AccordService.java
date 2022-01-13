package com.koreait.funfume.model.accord;

import java.util.List;

import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Accord;

@Service
public interface AccordService {
	
	public List selectAll();
	public Accord select(int accord_id);
	public void regist(Accord accord);
	public void update(Accord accord);
	public void delete(int accord_id);
	public int accordCheck(String accord_name);
}
