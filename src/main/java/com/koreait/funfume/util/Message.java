/**
 * 
 */
package com.koreait.funfume.util;

import java.util.List;

import lombok.Data;

/**
 * @author easyd
 *
 */
//로직이 아닌, 서버와 클라이언트 간 정보를 주고받기 위한 메시지 객체
@Data
public class Message {
	private int code; //1,0 나만의 결과코드(이 데이터로 클라이언트는 성공 or 실패)
	private String msg; //클아이언트에게 전달하고 싶은 메시지
	private List list;
}
