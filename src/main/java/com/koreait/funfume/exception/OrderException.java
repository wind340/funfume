package com.koreait.funfume.exception;

public class OrderException extends RuntimeException{
	
	
	public OrderException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public OrderException(Throwable e) {
		super(e);
	}
	public OrderException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
