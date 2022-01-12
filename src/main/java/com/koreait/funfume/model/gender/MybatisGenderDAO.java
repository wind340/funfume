/**
 * 
 */
package com.koreait.funfume.model.gender;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Gender;

/**
 * @author easyd
 *
 */
@Repository
public class MybatisGenderDAO implements GenderDAO{
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Gender.selectAll");
	}

	@Override
	public Gender select(int gender_id) {
		return null;
	}

	@Override
	public void insert(Gender gender) {
	}

	@Override
	public void update(Gender gender) {
	}

	@Override
	public void delete(int gender_id) {
	}

}
