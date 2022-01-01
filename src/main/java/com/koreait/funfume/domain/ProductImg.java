package com.koreait.funfume.domain;

import lombok.Data;

@Data
public class ProductImg {
	private int product_img_id;
	private Product product; //숫자 + 여러가지
	private String img;
}
