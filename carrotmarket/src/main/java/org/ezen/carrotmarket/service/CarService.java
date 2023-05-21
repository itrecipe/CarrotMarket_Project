package org.ezen.carrotmarket.service;

import java.util.List;

import org.ezen.carrotmarket.domain.CarVO;

//비즈니스 계청 인터페이스
public interface CarService {

	//리스트 출력
	public List<CarVO> getList();
	
	//C
	public void register(CarVO car);
	
	//R
	public CarVO get(Long cno);
	
	//U
	public boolean modify(CarVO car);
	
	//D
	public boolean remove(Long cno);
}