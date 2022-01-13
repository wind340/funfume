package com.koreait.funfume.model.notice;

import java.util.List;
import com.koreait.funfume.domain.Notice;
import com.koreait.funfume.domain.Product;


public interface NoticeService {
	
	public List selectAll();
	public Notice select(int notice_id);
	public void insert(Notice notice);
	public void update(Notice notice);
	public void delete(int notice_id);
}
