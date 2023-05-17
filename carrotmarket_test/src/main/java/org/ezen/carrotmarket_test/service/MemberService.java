package org.ezen.carrotmarket_test.service;

import org.ezen.carrotmarket_test.domain.MemberVO;

public interface MemberService {
	
	//회원정보
	MemberVO getMember(String userid);
	
	//회원가입
	void joinMember(MemberVO memberVO);

	//회원 ID 가져오기
	MemberVO getMemberId(int id);
	
	//회원 정보 수정
	void modifyMember(MemberVO memberVO);
	
	//회원 비밀번호 수정
	void modifyPasswd(int id, String hashpasswd);
	
	//회원 ID 삭제
	void deleteMemberById(int id);
}
