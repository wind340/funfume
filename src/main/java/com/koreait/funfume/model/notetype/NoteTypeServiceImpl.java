package com.koreait.funfume.model.notetype;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.NoteType;
import com.koreait.funfume.exception.NoteTypeException;

@Service
public class NoteTypeServiceImpl implements NoteTypeService{
	
	
	@Autowired
	private NoteTypeDAO noteTypeDAO;
	
	@Override
	public List selectAll() {
		return noteTypeDAO.selectAll();
	}

	@Override
	public NoteType select(int note_type_id) {
		return noteTypeDAO.select(note_type_id);
	}

	@Override
	public void insert(NoteType noteType) throws NoteTypeException{
		noteTypeDAO.insert(noteType);
	}

	@Override
	public void update(NoteType noteType)throws NoteTypeException {
		noteTypeDAO.update(noteType);
	}

	@Override
	public void delete(int note_type_id)throws NoteTypeException {
		noteTypeDAO.delete(note_type_id);
	}
	
}
