/**
 * 
 */
package com.koreait.funfume.domain;

import lombok.Data;

/**
 * @author easyd
 *
 */
@Data
public class Notice {
	private int notice_id;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
}
