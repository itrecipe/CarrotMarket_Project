package org.ezen.carrotmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ezen.carrotmarket.domain.MemberVO;

@Mapper
public interface MemberMapper {
	
	MemberVO getMember(String userid);
	
	void joinMember(MemberVO memberVO);
	
	MemberVO findMember(String username);
	
	void modifyUserPwd(MemberVO memberVO);
	
//	public List<MemberVO> getHome();
}
