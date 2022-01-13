package com.koreait.funfume.exception;

public class MemberException extends RuntimeException{
	
	public MemberException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public MemberException(Throwable e) {
		super(e);
	}
	public MemberException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
