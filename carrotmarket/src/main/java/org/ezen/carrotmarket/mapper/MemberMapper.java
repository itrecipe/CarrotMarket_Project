package org.ezen.carrotmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.ezen.carrotmarket.domain.MemberVO;

@Mapper
public interface MemberMapper {

	MemberVO getMember(String userid);

	void joinMember(MemberVO memberVO);

	MemberVO getMemberId(int id);

	void modifyMember(MemberVO memberVO);

	void modifyPasswd(MemberVO memberVO);

	void deleteMemberById(int id);



}
