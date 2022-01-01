package com.koreait.funfume.exception;

public class ProductImgException extends RuntimeException{
	
	
	public ProductImgException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public ProductImgException(Throwable e) {
		super(e);
	}
	public ProductImgException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
