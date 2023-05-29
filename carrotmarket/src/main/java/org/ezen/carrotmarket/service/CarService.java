package org.ezen.carrotmarket.service;

import java.util.List;

import org.ezen.carrotmarket.domain.CarAttachVO;
import org.ezen.carrotmarket.domain.CarVO;
import org.ezen.carrotmarket.domain.Criteria;

//비즈니스 계청 인터페이스
public interface CarService {

	//R- 리스트 출력(목록 select - 페이징 처리 전)
	//public List<CarVO> getList();
	
	//페이징을 위한 처리
	//R - 리스트 출력(목록 select - 페이징 처리 후)
	public List<CarVO> getList(Criteria cri);
	
	//게시글 총 합계, 페이징을 위한 처리
	public int getTotal(Criteria cri);
	
	//기본 CRUD
	//C
	public void register(CarVO car);
	
	//R
	public CarVO get(Long cno);
	
	//U
	public boolean modify(CarVO car);
	
	//D
	public boolean remove(Long cno);
	
	//파일 첨부를 위한 처리
	public List<CarAttachVO> getAttachList(Long cno);
}