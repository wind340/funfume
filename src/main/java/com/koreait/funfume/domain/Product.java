package com.koreait.funfume.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int product_id;
	
	private int brand_id;//fk  Brand
	private int gender_id; //Gender
	private String product_name;
	private int price;
	private String introduction;
	private MultipartFile[] imgFiles; //다중파일 업로드 때문에 배열로 준비해놓자
	private List productImgs;
	
	private String[] uploadTopNotes;
	private String[] uploadMiddleNotes;
	private String[] uploadBaseNotes;
	private String[] uploadAccords;
	
	
	
}
