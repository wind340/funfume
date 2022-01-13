/**
 * 
 */
package com.koreait.funfume.model.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Notice;
import com.koreait.funfume.domain.Product;
import com.koreait.funfume.exception.NoticeException;

/**
 * @author easyd
 *
 */
@Repository
public class MybatisNoticeDAO implements NoticeDAO {
	

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Notice.selectAll");
	}

	@Override
	public Notice select(int notice_id) {
		return sessionTemplate.selectOne("Notice.select",notice_id);
	}

	@Override
	public void insert(Notice notice) throws NoticeException {
		int result = sessionTemplate.insert("Notice.insert",notice);
		if(result==0) {
			throw new NoticeException("게시물 등록 실패");
		}
	}

	@Override
	public void update(Notice notice) throws NoticeException{
		int result = sessionTemplate.insert("Notice.update",notice);
		if(result==0) {
			throw new NoticeException("게시물 수정 실패");
		}		
	}

	@Override
	public void delete(int notice_id) throws NoticeException{
		int result = sessionTemplate.insert("Notice.delete",notice_id);
		if(result==0) {
			throw new NoticeException("게시물 삭제 실패");
		}		
	}

}
