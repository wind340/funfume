package com.koreait.funfume.model.note;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.funfume.domain.Note;
import com.koreait.funfume.exception.NoteException;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteDAO noteDAO;
	
	@Override
	public List selectAll() {
		return noteDAO.selectAll();
	}

	@Override
	public Note select(int note_id) {
		return noteDAO.select(note_id);
	}
	
	@Override
	public void insert(Note note) throws NoteException{
		noteDAO.insert(note);
	}

	@Override
	public void update(Note note) throws NoteException{
		noteDAO.update(note);
	}

	@Override
	public void delete(int note_id) throws NoteException{
		noteDAO.delete(note_id);
	}

	@Override
	public List selectType(int note_type_id) {
		return noteDAO.selectType(note_type_id);
	}

	
}
