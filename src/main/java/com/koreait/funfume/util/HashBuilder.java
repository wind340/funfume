package com.koreait.funfume.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashBuilder {
	
	
	public String convertStringToHash(String pass) {// banana
		//알고리즘 선택!!Sha-256 :64자길이를 갖음
		StringBuffer sb = new StringBuffer(); //하나의 문자열 객체로 수정하기 위해서
		try {
			MessageDigest digest= MessageDigest.getInstance("SHA-256");
			byte[] hash =  digest.digest(pass.getBytes("UTF-8")); // b a n a n a
			
			for(int i=0;i<hash.length;i++) {
				String hex = Integer.toHexString(0xff&hash[i]);
				if(hex.length()==1) {
					sb.append("0"); // 0a
				}
				sb.append(hex);
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}
}
