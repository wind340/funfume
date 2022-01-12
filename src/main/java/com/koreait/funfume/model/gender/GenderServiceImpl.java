/**
 * 
 */
package com.koreait.funfume.model.gender;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Gender;

/**
 * @author easyd
 *
 */
@Service
public class GenderServiceImpl implements GenderService {
	
	@Autowired
	private GenderDAO genderDAO;
	
	@Override
	public List selectAll() {
		return genderDAO.selectAll();
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
