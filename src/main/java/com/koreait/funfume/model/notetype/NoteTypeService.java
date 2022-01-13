package com.koreait.funfume.model.notetype;

import java.util.List;

import com.koreait.funfume.domain.NoteType;

public interface NoteTypeService {
	
	
	public List selectAll();
	public NoteType select(int note_type_id);
	public void insert(NoteType noteType);
	public void update(NoteType noteType);
	public void delete(int note_type_id);
	
}
