package com.koreait.funfume.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.funfume.domain.Note;
import com.koreait.funfume.domain.NoteType;
import com.koreait.funfume.exception.NoteTypeException;
import com.koreait.funfume.model.note.NoteService;
import com.koreait.funfume.model.notetype.NoteTypeService;

@Controller
public class NoteTypeController {
	
	@Autowired
	private NoteTypeService noteTypeService;
	
	@Autowired
	private NoteService noteService;
	
	//노트타입목록 요청
	@GetMapping("/note/type/list")
	public String getList(Model model) {
		List<NoteType> noteTypeList=noteTypeService.selectAll();
		model.addAttribute("noteTypeList", noteTypeList);
		return "admin/note/type/list";
	}
	//노트타입등록폼 요청
	@GetMapping("/note/type/registForm")
	public String registForm() {
		return "admin/note/type/regist";
	}
	
	//노트타입등록
	@GetMapping("/note/type/regist")
	public String regist(NoteType noteType) {
		noteTypeService.insert(noteType);
		return "redirect:/admin/note/type/list";
	}
	
	//노트타입 자세히보기
	@GetMapping("/note/type/detail")
	public String getDetail(int note_type_id, Model model) {
		NoteType noteType = noteTypeService.select(note_type_id);
		model.addAttribute("noteType", noteType);
		List<Note> selectType=noteService.selectType(note_type_id);
		model.addAttribute("selectType", selectType);
		return "admin/note/type/detail";
	}
	
	//노트타입 수정
	@PostMapping("/note/type/update")
	public String update(NoteType noteType) {
		noteTypeService.update(noteType);
		return "redirect:/admin/note/type/detail?note_type_id="+noteType.getNote_type_id();
	}
	
	//노트타입 삭제
	@GetMapping("/note/type/delete")
	public String delete(int note_type_id) {
		noteTypeService.delete(note_type_id);
		return "redirect:/admin/note/type/list";
	}
	
	//익셉션처리
	@ExceptionHandler(NoteTypeException.class)
	public ModelAndView handle(NoteTypeException e) {
		ModelAndView mav = new ModelAndView("admin/error/result");
		mav.addObject("e", e);
		return mav;
	}
}
