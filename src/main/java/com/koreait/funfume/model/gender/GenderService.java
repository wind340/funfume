/**
 * 
 */
package com.koreait.funfume.model.gender;

import java.util.List;

import com.koreait.funfume.domain.Gender;

/**
 * @author easyd
 *
 */
public interface GenderService {
	
	public List selectAll();
	public Gender select(int gender_id);
	public void insert(Gender gender);
	public void update(Gender gender);
	public void delete(int gender_id);	
}
