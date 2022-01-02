package com.koreait.funfume.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Note;
import com.koreait.funfume.domain.NoteType;
import com.koreait.funfume.exception.NoteException;
import com.koreait.funfume.model.note.NoteService;
import com.koreait.funfume.model.notetype.NoteTypeService;
import com.koreait.funfume.util.FileManager;
import com.koreait.funfume.util.Pager;

@Controller
public class NoteController {
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private Pager pager;
	
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private NoteTypeService noteTypeService;
	
	//노트 목록 요청
	@GetMapping("/note/list")
	public String getList(HttpServletRequest request, Model model) {
		List<Note> noteList = noteService.selectAll();
		List<NoteType> noteTypeList=noteTypeService.selectAll();
		pager.init(noteList, request);
		model.addAttribute("noteList", noteList);
		model.addAttribute("noteTypeList", noteTypeList);
		model.addAttribute("pager", pager);
		return "admin/note/list";
	}
	
	//노트 등록 폼 요청
	@GetMapping("/note/registForm")
	public String registForm(Model model) {
		//노트타입 불러오기
		List<NoteType> noteTypeList=noteTypeService.selectAll();
		model.addAttribute("noteTypeList", noteTypeList);
	
		return "admin/note/regist";
	}
	
	//노트 등록
	@PostMapping("/note/regist")
	public String regist(HttpServletRequest request, Note note) {
		//3단계	
		String filename = fileManager.saveAsFile(request, note);
		note.setNote_img(filename);
		noteService.insert(note);
		
		return "redirect:/admin/note/list";
	}
	
	//노트 자세히 보기
	@GetMapping("/note/detail")
	public String getDetail(int note_id, Model model) {
		Note note = noteService.select(note_id);
		model.addAttribute("note", note);
		return "admin/note/detail";
	}
	
	
	//노트 수정
	@PostMapping("/note/update")
	public ModelAndView update(HttpServletRequest request, Note note) {
		String filename = fileManager.saveAsFile(request, note);
		note.setNote_img(filename);
		noteService.update(note);

		ModelAndView mav = new ModelAndView("redirect:/admin/note/detail?note_id="+note.getNote_id());
		return mav;
	}
	
	//노트 삭제
	@GetMapping("/note/delete")
	public String delete(int note_id) {
		//3단계
		noteService.delete(note_id);
		return "redirect:/admin/note/list";
	}
	
	@ExceptionHandler(NoteException.class)
	public ModelAndView handle(NoteException e) {
		ModelAndView mav = new ModelAndView("error");
		mav.addObject("e", e);
		return mav;
	}
	
}
