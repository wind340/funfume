package com.koreait.funfume.model.admin;

import java.util.List;

import com.koreait.funfume.domain.Admin;

public interface AdminDAO {
	public List selectAll();//관리자 모든 목록
	public Admin select(Admin admin);//
	public void insert(Admin admin);
	public void update(Admin admin);
	public void delete(Admin admin);
	
	

}
