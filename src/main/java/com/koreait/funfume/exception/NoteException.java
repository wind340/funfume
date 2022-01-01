package com.koreait.funfume.exception;

public class NoteException extends RuntimeException{
	
	
	public NoteException(String msg) {
		super(msg);
	}
	
	public NoteException(Throwable e) {
		super(e);
	}
	
	public NoteException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
