package com.koreait.funfume.exception;

public class ProductNoteException extends RuntimeException{
	
	
	public ProductNoteException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public ProductNoteException(Throwable e) {
		super(e);
	}
	public ProductNoteException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
