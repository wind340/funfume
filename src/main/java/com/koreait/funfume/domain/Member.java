package com.koreait.funfume.domain;

import lombok.Data;

@Data
public class Member {
	private int member_id;
	private String member_name;
	private String email;
	private String pass;
	private String addr1;
	private String addr2;
	private String reg_date;
	
}