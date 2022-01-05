package com.koreait.funfume.exception;

public class AccordException extends RuntimeException{
	
	
	public AccordException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public AccordException(Throwable e) {
		super(e);
	}
	public AccordException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
