package org.ezen.carrotmarket.domain;

import lombok.Getter;
import lombok.ToString;

@Getter //getter 메서드 자동 생성 어노테이션
@ToString //toString을 자동으로 생성해주는 어노테이션

//페이징 관련 DTO
public class PageDTO {

	private int startPage; //표시할 페이지 번호중 가장 적은 번호
	private int endPage; //표시할 페이지 번호중 가장 큰 번호
	private boolean prev, next; 
	//prev는 이전 페이지로 이동이 가능한지 여부를 나타내는 boolean값
	//next는 다음 페이지로 이동이 가능한지 여부를 나타내는 boolean값
	
	
	private int total; //데이터 전체 개수

	public PageDTO(Criteria cri, int total) {
		
	}
}
