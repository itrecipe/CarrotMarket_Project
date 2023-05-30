package org.ezen.carrotmarket.service;

import java.util.List;

import org.ezen.carrotmarket.domain.CarAttachVO;
import org.ezen.carrotmarket.domain.CarVO;
import org.ezen.carrotmarket.domain.Criteria;
import org.ezen.carrotmarket.mapper.CarAttachMapper;
import org.ezen.carrotmarket.mapper.CarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service //서비스 계층 로직임을 알리는 어노테이션
//@AllArgsConstructor //모든 멤버변수를 갖는 생성자로서 멤버변수가 한개일때 사용한다.
//서비스 계층 로직 실제 구현체
public class CarServiceImpl implements CarService {

	@Setter(onMethod_= @Autowired)
	private CarMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private CarAttachMapper attachMapper;
	
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
	
	@Transactional
	@Override
	public void register(CarVO car) {
		log.info("register 호출 : " + car);
		
		mapper.insertSelectKey(car);
		
		if (car.getAttachList() == null || car.getAttachList().size() <= 0) {
			return;
		}

		car.getAttachList().forEach(attach -> {

			attach.setCno(car.getCno()); 
			attachMapper.insert(attach);
		});
	}

	@Override
	public CarVO get(Long cno) {
		log.info("get : " + cno);
		
		return mapper.read(cno);
	}
	
	/* 첨부파일 처리 전 (modify)
	@Override
	public boolean modify(CarVO car) {
		
		log.info("modify : " + car);
		
		return mapper.update(car) == 1;
	}
	 */
	
	//첨부파일 처리 후 (modify)
	@Transactional //두개의 테이블을 처리해야 하므로 트랜잭션을 걸어준다.
	@Override
	public boolean modify(CarVO car) {
		
		log.info("modify... 호출 : " + car);
		
		attachMapper.deleteAll(car.getCno()); //기존의 특정 게시물에 대한 첨부 파일들은 모두 삭제한다.
		
		boolean modifyResult = mapper.update(car) == 1; //일반 게시물은 업데이트 처리를 해준다.
		
		if(car.getAttachList() == null) {
			return modifyResult;
		}
		
		if(modifyResult && car.getAttachList().size() > 0) {
			
			car.getAttachList().forEach(attach -> {
				attach.setCno(car.getCno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	
	/* 첨부파일 처리 전 (remove)
	@Override
	public boolean remove(Long cno) {
		
		log.info("remove : " + cno);
		return mapper.delete(cno) == 1;
	}
	 */
	
	//첨부파일 처리 후 (remove)
	@Transactional
	@Override
	public boolean remove(Long cno) {
		log.info("remove... 호출 : " + cno);
		
		attachMapper.deleteAll(cno);
		
		return mapper.delete(cno) == 1;
	}
	
	//첨부파일 리스트 처리
	@Override
	public List<CarAttachVO> getAttachList(Long cno) {
		log.info("get Attach list buy cno 호출 : " + cno);
		
		return attachMapper.findByCno(cno);
	}
}