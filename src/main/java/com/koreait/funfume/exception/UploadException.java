package com.koreait.funfume.exception;

public class UploadException extends RuntimeException{
	
	public UploadException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 */
	public UploadException(Throwable e) {
		super(e);
	}
	public UploadException(String msg,Throwable e) {
		super(msg,e);
	}
	
}
