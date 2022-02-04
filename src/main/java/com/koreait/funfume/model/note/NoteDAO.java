package com.koreait.funfume.model.note;

import java.util.List;

import com.koreait.funfume.domain.Note;

public interface NoteDAO {
	
	public List selectAll();
	public List selectType(int note_type_id);
	public Note select(int note_id);
	public List search(String keyword);
	public void insert(Note note);
	public void update(Note note);
	public void delete(int note_id);
}
