package org.ezen.carrotmarket.domain; 

import lombok.Data;

@Data
public class MemberVO {

	private int id;
	private String userid;
	private String userpwd;
	private String username;
	private String nickname;
	private String address;
}
