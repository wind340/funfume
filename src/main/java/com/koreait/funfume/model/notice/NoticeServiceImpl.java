/**
 * 
 */
package com.koreait.funfume.model.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Notice;
import com.koreait.funfume.domain.Product;

/**
 * @author easyd
 *
 */
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	
	@Override
	public List selectAll() {
		return noticeDAO.selectAll();
	}

	@Override
	public Notice select(int notice_id) {
		return noticeDAO.select(notice_id);
	}

	@Override
	public void insert(Notice notice) {
		noticeDAO.insert(notice);
	}

	@Override
	public void update(Notice notice) {
		noticeDAO.update(notice);
	}

	@Override
	public void delete(int notice_id) {
		noticeDAO.delete(notice_id);
	}

}
