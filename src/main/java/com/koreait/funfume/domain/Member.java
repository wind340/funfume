package com.koreait.funfume.domain;

import lombok.Data;

//나현님이 주시기전까지임시
@Data
public class Member {
	private int member_id; 
	private String member_name;
	private String email;
	private String pass;
	private String addr1;
	private String addr2;
}
