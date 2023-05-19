package org.ezen.carrotmarket_test.domain;

import lombok.Data;

@Data
//해당 어노테이션을 사용해야 getter/setter, equals, toString 등을 자동으로 등록해주므로 쉽게 사용할 수 있다.
public class MemberVO {

	private int id; //pk
	private String userId; 
	private String userName; 
	private String userNickname;
	private String userAddress;
	private String userEmail;
	private String userGender;
	private String userPhone;
}
