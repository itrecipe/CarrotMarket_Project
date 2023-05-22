package org.ezen.carrotmarket.service;

import org.ezen.carrotmarket.domain.MemberVO;

public interface MemberService {

	MemberVO getMember(String userid);

	void joinMember(MemberVO memberVO);

	MemberVO getMemberId(int id);

	void modifyMember(MemberVO memberVO);

	void modifyPasswd(int id, String hashPasswd);

	void deleteMemberById(int id);

}
