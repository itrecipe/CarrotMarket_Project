package org.ezen.carrotmarket_test.service;

import org.ezen.carrotmarket_test.domain.MemberVO;
import org.ezen.carrotmarket_test.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service //서비스 어노테이션을 붙여줘야 서비스 로직을 쓸 수 있음
@AllArgsConstructor
//Lombok의 모든 멤버변수를 파라미터로 갖는 생성자를 생성해준다.
//멤버변수가 한개일때 사용한다.
public class MemberServiceImpl implements MemberService{ //MemberServiceImpl 클래스명 끝에 Impl이 붙으면 실제 서비스 로직 구현체를 의미
	
	private MemberMapper memberMapper; //db와 연결하기 위해 메퍼와 연결함.
	
	//로그인시 멤버 가져오기
	@Override //재정의된 메서드
	public MemberVO getMember(String userId) {
		
		return memberMapper.getMember(userId);
	}
	
	
}
