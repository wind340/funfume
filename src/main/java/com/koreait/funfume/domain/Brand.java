package com.koreait.funfume.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Brand {
	private int brand_id;
	private String brand_name;
	private String brand_img;
	
	private MultipartFile imgFiles;
}
