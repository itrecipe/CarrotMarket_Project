package org.ezen.carrotmarket_test.mapper;

import org.ezen.carrotmarket_test.domain.MemberVO;

public interface MemberMapper {

	//접근제어자, 멤버변수, 메소드명(데이터타입, 멤버변수); //작성형식

	//회원정보
	public MemberVO getMember(String userid);
	
	//회원가입
	public void joinMember(MemberVO memberVO);

	//회원 ID 가져오기
	public MemberVO getMemberID(int id);
	
	//회원 정보 수정
	public void ModifyMember(MemberVO memberVO);
	
	//회원 비번 수정
	public void modifyPasswd(int id, String hashpasswd);
	
	//회원 ID 삭제
	public void deleteMemberById(int id);
}
