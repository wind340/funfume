package com.koreait.funfume.exception;

public class ProductAccordException extends RuntimeException{
	
	public ProductAccordException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public ProductAccordException(Throwable e) {
		super(e);
	}
	public ProductAccordException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
