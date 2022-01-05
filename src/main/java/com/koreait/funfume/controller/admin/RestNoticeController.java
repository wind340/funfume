package com.koreait.funfume.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.koreait.funfume.domain.Notice;
import com.koreait.funfume.model.notice.NoticeService;


@RestController
public class RestNoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/rest/notice")
	public List getList(HttpServletRequest request) {
		
		List<Notice> noticeList= noticeService.selectAll();
		return noticeList;
	}
	
	
	//한 건의 데이터 rest 요청 처리 /admin/rest/notice/1
	@RequestMapping(value="/rest/notice/{notice_id}", method = RequestMethod.GET)
	public Notice getDetail(@PathVariable(name = "notice_id") int notice_id) {
		
		Notice notice =noticeService.select(notice_id);
		
		return notice;
	}
	
}
