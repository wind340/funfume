package com.koreait.funfume.model.note;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.Note;
import com.koreait.funfume.exception.NoteException;

@Repository
public class MybatisNoteDAO implements NoteDAO{
	
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Note.selectAll");
	}

	@Override
	public Note select(int note_id) {
		return sessionTemplate.selectOne("Note.select", note_id);
	}

	@Override
	public void insert(Note note) throws NoteException {
		int result=sessionTemplate.insert("Note.insert", note);
		if(result==0) {
			throw new NoteException("노트 등록에 실패하였습니다");
		}
	}

	@Override
	public void update(Note note) throws NoteException {
		int result=sessionTemplate.update("Note.update", note);
		if(result==0) {
			throw new NoteException("노트 수정에 실패하였습니다");
		}
	}

	@Override
	public void delete(int note_id) throws NoteException {
		int result=sessionTemplate.delete("Note.delete", note_id);
		if(result==0) {
			throw new NoteException("노트 삭제에 실패하였습니다");
		}
	}

	@Override
	public List selectType(int note_type_id) {
		return sessionTemplate.selectList("Note.selectType", note_type_id);
	}

}
