package org.ezen.carrotmarket.service;

import org.ezen.carrotmarket.domain.MemberVO;

//비지니스 로직 처리 인터페이스
public interface MemberService {
	
	MemberVO getMember(String userid);
	
	void joinMember(MemberVO memberVO);
	
	MemberVO findMember(String username);
	
	void modifyUserPwd(MemberVO memberVO);
	
}
