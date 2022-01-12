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
public class Review {
	private int review_id;
	private int product_id;
	private String name;
	private String email;
	private int rating;
	private String review;
}
