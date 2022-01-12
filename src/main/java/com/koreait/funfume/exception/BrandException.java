package com.koreait.funfume.exception;

public class BrandException extends RuntimeException{
	
	
	public BrandException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public BrandException(Throwable e) {
		super(e);
	}
	public BrandException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
