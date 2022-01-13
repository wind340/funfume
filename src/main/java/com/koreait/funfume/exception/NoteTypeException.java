package com.koreait.funfume.exception;

public class NoteTypeException extends RuntimeException{
	
	public NoteTypeException(String msg) {
		super(msg);
	}
	
	public NoteTypeException(Throwable e) {
		super(e);
	}
	
	public NoteTypeException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
