package org.ezen.carrotmarket.mapper;

import java.util.List;

import org.ezen.carrotmarket.domain.CarVO;

public interface CarMapper {

	//리스트 가져올 메서드
	public List<CarVO> getList();
	
	//C
	public void insert(CarVO car);
	
	//R
	public CarVO read(Long cno);
	
	//U
	public int update (CarVO car);
	
	//D
	public int delete(Long cno);
	
}
