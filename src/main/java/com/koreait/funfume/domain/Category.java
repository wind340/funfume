package com.koreait.funfume.domain;

import lombok.Data;

@Data
public class Category {
	
	private int category_id;
	private String category_name;
	private int team;
	private int step;
	private int depth;
}
