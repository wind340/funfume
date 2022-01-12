package com.koreait.funfume.domain;

import lombok.Data;

@Data
public class ProductNote {
	private int product_note_id;
	private int product_id;
	private int note_id;
	private String note_place;
}
