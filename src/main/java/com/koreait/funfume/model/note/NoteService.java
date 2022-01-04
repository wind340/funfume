package com.koreait.funfume.model.note;

import java.util.List;

import com.koreait.funfume.domain.Note;

public interface NoteService {
	
	public List selectAll();
	public List selectType(int noteType);
	public Note select(int note_id);
	public void insert(Note note);
	public void update(Note note);
	public void delete(int note_id);

}
