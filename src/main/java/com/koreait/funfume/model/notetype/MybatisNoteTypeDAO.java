package com.koreait.funfume.model.notetype;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.funfume.domain.NoteType;
import com.koreait.funfume.exception.NoteTypeException;
import com.koreait.funfume.exception.UploadException;

@Repository
public class MybatisNoteTypeDAO implements NoteTypeDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List selectAll() {
		return sessionTemplate.selectList("NoteType.selectAll");
	}

	@Override
	public NoteType select(int note_type_id) {
		return sessionTemplate.selectOne("NoteType.select", note_type_id);
	}

	@Override
	public void insert(NoteType noteType) throws NoteTypeException {
		int result =sessionTemplate.insert("NoteType.insert", noteType);
		if(result==0) {
			throw new NoteTypeException("등록에 실패하였습니다");
		}
	}

	@Override
	public void update(NoteType noteType) throws NoteTypeException {
		int result =sessionTemplate.update("NoteType.update", noteType);
		if(result==0) {
			throw new NoteTypeException("수정 실패하였습니다");
		}
	}

	@Override
	public void delete(int note_type_id) {
		int result = sessionTemplate.delete("NoteType.delete", note_type_id);
		if(result==0) {
			throw new NoteTypeException("타입삭제 실패");
		}
	}

}
