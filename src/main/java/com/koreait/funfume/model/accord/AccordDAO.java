package com.koreait.funfume.model.accord;

import java.util.List;

import com.koreait.funfume.domain.Accord;

public interface AccordDAO {
	public List selectAll();
	public Accord select(int accord_id);
	public void insert(Accord accord);
	public void update(Accord accord);
	public void delete(int accord_id);
	public int accordCheck(String accord_name);
}
