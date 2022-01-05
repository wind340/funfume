/**
 * 
 */
package com.koreait.funfume.model.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Admin;
import com.koreait.funfume.exception.AdminException;

/**
 * @author easyd
 *
 */
@Repository
public class MybatisAdminDAO implements AdminDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Admin.selectAll");
	}

	@Override
	public Admin select(Admin admin) throws AdminException {
		Admin result= sessionTemplate.selectOne("Admin.select",admin);
		if(result ==null) {
			throw new AdminException("관리자 정보가 올바르지 않습니다.");
		}
		
		return result;
	}

	@Override
	public void insert(Admin admin) throws AdminException{
		int result = sessionTemplate.insert("Admin.insert",admin);
		if(result ==0) {
			throw new AdminException("관리자 등록 실패");
		}
	}

	@Override
	public void update(Admin admin) throws AdminException{
		int result = sessionTemplate.insert("Admin.update",admin);
		if(result ==0) {
			throw new AdminException("관리자 수정 실패");
		}
	}

	@Override
	public void delete(Admin admin) throws AdminException{
		int result = sessionTemplate.insert("Admin.delete",admin);
		if(result ==0) {
			throw new AdminException("관리자 삭제 실패");
		}
	}

}
