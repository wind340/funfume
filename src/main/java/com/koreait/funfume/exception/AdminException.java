package com.koreait.funfume.exception;

public class AdminException extends RuntimeException{
	
	
	public AdminException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public AdminException(Throwable e) {
		super(e);
	}
	public AdminException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
