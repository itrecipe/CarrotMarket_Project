package org.ezen.carrotmarket.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ezen.carrotmarket.domain.MemberVO;
import org.ezen.carrotmarket.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper memberMapper;
	
	@Override
	public MemberVO getMember(String userid) {

		return memberMapper.getMember(userid);
	}

	@Override
	public void joinMember(MemberVO memberVO) {
		memberMapper.joinMember(memberVO);
	}

	@Override
	public MemberVO findMember(String username) {
		return memberMapper.findMember(username);
	}

	@Override
	public void modifyUserPwd(MemberVO memberVO) {
		memberMapper.modifyUserPwd(memberVO);
	}
	
//	//목록보기
//	@Override
//	public List<MemberVO> getHome() {
//		
//		log.info("get home...");
//		return memberMapper.getHome();
//	}

}
