package org.ezen.carrotmarket.service;

import java.util.List;

import org.ezen.carrotmarket.domain.CarVO;
import org.ezen.carrotmarket.domain.Criteria;
import org.ezen.carrotmarket.mapper.CarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service //서비스 계층 로직임을 알리는 어노테이션
@AllArgsConstructor //모든 멤버변수를 갖는 생성자로서 멤버변수가 한개일때 사용한다.
//서비스 계층 로직 실제 구현체
public class CarServiceImpl implements CarService {

	private CarMapper mapper;
	
	//목록보기 - 페이징 처리 전
	/*
	@Override
	public List<CarVO> getList() {
		
		log.info("getList : ");
		
		return mapper.getList();
	}
	*/
	
	//목록보기 - 페이징 처리 후
	@Override
	public List<CarVO> getList(Criteria cri) {
		
		log.info("get List With Criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	//게시글 총 합계 - 페이징 처리
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count : ");
		
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public void register(CarVO car) {
		log.info("register 호출 : " + car);
		
		mapper.insert(car);
	}

	@Override
	public CarVO get(Long cno) {
		log.info("get : " + cno);
		
		return mapper.read(cno);
	}

	@Override
	public boolean modify(CarVO car) {
		
		log.info("modify : " + car);
		
		return mapper.update(car) == 1;
	}

	@Override
	public boolean remove(Long cno) {
		
		log.info("remove : " + cno);
		return mapper.delete(cno) == 1;
	}
}