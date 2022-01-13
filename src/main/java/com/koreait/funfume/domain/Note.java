package com.koreait.funfume.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Note {
	
	
	private NoteType noteType;
	private int note_id;
	private String note_name;
	private String note_img;
	
	private MultipartFile noteFile;
}
