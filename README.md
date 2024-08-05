# Spring Final Project : CarrotMarket_Car

## 주제 : 당근마켓 웹 사이트 구현 - 중고차 직거래 PART 구현

<details>
  <summary>프로젝트 소개</summary>
  
  - 해당 프로젝트를 진행하며, 팀원들과 협의하여 무엇을 만들어 볼까?<br>
    하고 고민 하다가 각자 만들어 보고 싶은 기능들과 플랫폼들을 생각해보면서 토론하고 생각을 정리해보니<br>
    중고거래 플랫폼으로 유명한 "**당근마켓 웹 사이트**"가 적합 하다는 결론이 나오게 되어<br>
    채택하게 되었습니다.<br><br>
    **Front-End 부분은 최대한 원본 사이트와 비슷하게 구현하였으며, <br> 정확한 데이터 처리와 기능 수행, 안정적인 서버와의 <br> 통신을 할 수 있도록 구현하는 것이 가장 중요하다고 생각되어 <br> Back_End 부분을 조금 더 신경써서 구현한 첫 프로젝트 입니다.** 

  - 제가 "**중고차 직거래 파트**"를 맡아서 제작한 **가장 큰 이유** 는 평소에 **차량을<br>
    좋아하기 때문에** 내가 가진 IT 기술로 중고차 직거래 플랫폼을 한번 만들어 보고 싶다<br>
    라는 생각으로 진행하게 되었습니다.<br>

  - **본 ReadMe 파일은 전체 프로젝트의 일부만 있으며,<br>
    필자 본인이 작업한 파트에 대한 내용만 게시되어 있음을 알려드립니다.**
  
  - **개발기간 : 23.05.15 ~ 23.6.13**

</details>

## Development Environment & Libraly
<details>
  <summary>프로젝트에 적용한 Skill Set & 개발 도구 목록</summary>
  
- **Back-End : Java (15), Spring Framework (5.3.26) - Spring Legacy Project, Mybatis**
- **Front-End : HTML5, CSS3, JSP, J-Query (A-Jax), JavaScript, BootStrap4**
- **DataBase & Server (DBMS, WEB, WAS) : Oracle (DB & SQL), Apache Tomcat 9.0**
- **Build & Tool(IDE) : Maven, SpringToolSuite3, SQLDEVELOPER (Oracle 11g), Eclipse, GitHub**

</details>

## 설계의 주안점
<details>
  <summary>접기 & 상세보기</summary><br>

  - **당근마켓 웹 사이트에는 로그인/회원가입 기능이 QR코드로 인증받아서 앱과 연동되도록<br>
      처리 되어 있어서 별도로 로그인/회원가입 기능을 추가하였습니다.**
  - 프론트단 디자인은 벤치마킹한 원본 사이트와 최대한 비슷하게 구현 하였습니다.
  - 백엔드 부분을 중점적으로 개발 하였습니다.
</details>

## 중고차 직거래 - 구현 기능
<details>
  <summary>접기 & 상세보기</summary><br>
  
- **로그인/회원가입**
- **게시판 (C, R, U, D) 기능 구현 (쇼핑몰 이미지 리스트 형식)**
- **파일 업로드 & 다운로드 기능 구현, 업로드 이미지 썸네일 형식으로 출력 (구현)**
- **페이징 처리**
- **카카오맵 api 연동**

</details>

## CarrotMarket - 중고차 직거래 - 테이블 구조
<details>
<summary>테이블명 : Carrot_Car 구조</summary><br><br>
테이블명 : Carrot_Car 구조
  
![carrot_car - DB 테이블 구조](https://github.com/itrecipe/carrotmarket_project/assets/40875025/5174a4fc-688b-47e5-b287-f3bcd23016b3)
</details>

## CarrotMarket - 중고차 직거래 - 구현 코드

### DB (Oracle_SQL)
<details>
<summary>CarrotMarket.sql</summary>
CarrotMarket.sql

```sql
--중고차 직거래 파트 개인 작업용 쿼리

--carrot_member 테이블 생성
create table carrot_member(
id number(10) constraint carr_mem_id_pk primary key,
userid varchar2(20) not null,
userpwd varchar2(60) not null,
username varchar2(10) not null,
usernickname varchar2(20) not null,
useraddress varchar2(40) not null,
useremail varchar2(60),
usergender char(1)
);

--carr_mem_id_seq 시퀀스 생성
create sequence carr_mem_id_seq;

--dummy 데이터 삽입
insert into carrot_member values(1,'admin','1234','관리자','master','서울','admin@naver.com','1');

select * from carrot_member;

drop table carrot_member;

--테이블 데이터 삭제 쿼리
delete from carrot_member
where carrot_member.id = '21';

--중고차 직거래 테이블 생성
create table carrot_car(
id number(10,0),  
cno number(10,0) constraint pk_carrot_car primary key,
writer varchar(50) not null,
title varchar2(200) not null,
content varchar2(4000) not null,
regDate date default sysdate,
updateDate date default sysdate,
carname varchar2(100) not null,
cartype varchar2(50) not null,
caryear varchar2(50) not null,
carprice varchar2(4000) not null,
cardate varchar2(100) not null,
fuel varchar2(50) not null,
disp varchar2(50) not null,
kilos varchar2(50) not null,
mission varchar2(50) not null
);

--car_seq 시퀀스 생성
create sequence car_seq;

--carrot_member테이블의 ID를 참조 하기 위한 외래키 잡기
alter table carrot_car add constraint fk_carrot_car_id foreign key (id) references carrot_member(id);

select * from carrot_car;

drop table carrot_car;
drop sequence car_seq;

select * from carrot_car where cno > 0 order by cno desc;

delete carrot_car where cno = 1;

--select문 뒤에 hint를 붙여서 데이터 검색하기
select /*+ INDEX_ASC(carrot_car pk_carrot_car) */
rownum cno, title, content, writer, regdate, updatedate
from carrot_car order by cno;

--test - dummy data 삽입
insert into carrot_car(cno,writer,title,content,carname,cartype,caryear,carprice,cardate,fuel,disp,kilos,mission)
values(car_seq.nextval,'국쌤','코란도 팝니다.','23년식 코란도 팔아요','코란도','suv','2023.05.22','1000000','23.05.22','디젤','2000CC','200,000km','오토매틱');

--carrot_attach(중고차 직거래 파트(carrot_car) - 첨부파일) 테이블 생성
create table carrot_attach(
uuid varchar2(200) not null,
uploadPath varchar2(200) not null,
fileName varchar2(200) not null,
filetype char(1) default '1',
cno number(10,0)
);

--pk_carrot_attach, 기본키 잡기
alter table carrot_attach add constraint pk_carrot_attach primary key(uuid);

--fk_car_attach, 외래키 잡기
alter table carrot_attach add constraint fk_carrot_attach foreign key(cno) references carrot_car(cno);

select * from carrot_attach;

select * from carrot_car order by  cno;

drop table carrot_attach;

desc carrot_attach;

select * from carrot_attach;

select count(cno) from carrot_car;

--이미지를 한개씩 가져올때 사용하려고 만든 쿼리
select * from carrot_attach where cno = 57 and rownum <= 1;

commit;
```
</details>

### Domain
<details>
  <summary>CarVO</summary>

  ```java
  package org.ezen.ex02.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

//bean class(DTO, VO) -> getter/setter, toString, equals 자동생성
@Data
public class CarVO {

	//로그인시 carrot_member 테이블의 ID 정보를 받아올 PK
	private int id; //pk

	//차량 게시글 정보
	private Long cno; //게시글 번호
	private String title; //게시글 제목
	private String writer; //게시글 작성자
	private String content; //게시글 내용
	private Date regDate; //게시글 등록 날짜
	private Date updateDate; //게시글 수정일
	
	private int replyCnt; //댓글 조회수 
	
	//게시판에서 특정 게시글에 첨부되는 첨부파일 리스트(여러개의 첨부 파일을 가져올수 있도록 List로 등록 한다.)
	private List<CarAttachVO> attachList; 
	
	//차량 정보
	private String carName; //차량명
	private String carType; //차종
	private String carYear; //차량 연식
	private String carPrice; //차량의 금액
	private String carDate; //차량 등록일
	private String fuel; //연료
	private String disp; //배기량
	private String Kilos; //키로수
	private String mission; //변속기(종류, 타입)
}
  ```
</details>

<details>
  <summary>CarPageDTO</summary>

  ```java
  package org.ezen.ex02.domain;

import lombok.Getter;
import lombok.ToString;

@Getter //getter 메서드 자동 생성 어노테이션
@ToString //toString을 자동으로 생성해주는 어노테이션
//페이징 관련 DTO
public class CarPageDTO {

	private int startPage; //표시할 페이지 번호중 가장 적은 번호
	private int endPage; //표시할 페이지 번호중 가장 큰 번호
	private boolean prev, next; 
	//prev는 이전 페이지로 이동이 가능한지 여부를 나타내는 boolean값
	//next는 다음 페이지로 이동이 가능한지 여부를 나타내는 boolean값
	
	private int total; //데이터 전체 개수
	private CarCriteria cri; //pageNum, amount

	public CarPageDTO(CarCriteria cri, int total) {
		
		this.cri = cri;
		
		this.total  = total;
		
		//페이징 끝 번호 계산
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		//ceil은 .0인 윗수로 올림을 한다.

		//페이징 시작 번호 계산
		this.startPage = this.endPage - 9;
		
		//total을 이용해 endPage를 재계산 처리하기
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전 페이지 처리
		this.prev = this.startPage > 1;
		
		//다음 페이지 처리
		this.next = this.endPage < realEnd;
	}
}
  ```
  
</details>

<details>
  <summary>CarCriteria</summary>
  
  ```java
  package org.ezen.ex02.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//페이징, 검색 관련 클래스
public class CarCriteria {

	//페이징 처리
	private int pageNum; //페이지 번호
	private int amount; //페이지당 레코드의 갯수
	
	//페이징 처리
	public CarCriteria() {
		this(1, 12);
	}
	
	//페이징 처리
	public CarCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
  ``` 
</details>

<details>
  <summary>CarAttachVO</summary>

  ```java
package org.ezen.ex02.domain;

import lombok.Data;

@Data
//carrot_attach 테이블과 매핑하는 VO 클래스
public class CarAttachVO {
	
	private String uuid;
	private String uploadPath; // YYYY/MM/DD형식
	private String fileName;
	private boolean fileType; //image는 true 아닌것은 false

	private Long cno; //carrot_car의 cno 값을 매핑하기 위한 변수
}

  ```
</details>

<details>
  <summary>CarAttachFileDTO</summary>

  ```java
  package org.ezen.ex02.domain;

import lombok.Data;

@Data
public class CarAttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}

  ```
</details>

<details>
	<summary>CarReplyVO</summary>
	- 미.완 (구현중)
</details>

<details>
	<summary>CarReplyPageDTO</summary>
	- 미.완 (구현중)
</details>

### Mapper
<details>
  <summary>CarMapper</summary>

```java
package org.ezen.ex02.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ezen.ex02.domain.CarCriteria;
import org.ezen.ex02.domain.CarVO;

public interface CarMapper {

	//리스트 가져올 메서드
	public List<CarVO> getList();
	
	//페이징 관련 메서드, Criteria객체를 파라미터로 갖는 메서드
	public List<CarVO> getListWithPaging(CarCriteria cri);
	
	//C
	public void insert(CarVO car);
	/* carrot_car 테이블 cno 컬럼에 들어가는 car_seq의
	nextval(시퀀스를 이용하여 자동으로 증가하는 값)을 미리 알 필요가 없는
	경우 처리 하는 방법, insert(Create)만 처리
	 */
	
	public Integer insertSelectKey(CarVO car);
	/* carrot_car 테이블 cno 컬럼에 들어가는 car_seq의
	nextval(시퀀스를 이용하여 자동으로 증가하는 값)을 미리 알아야 하는
	경우 처리 하는 방법, car 객체의 데이터가 DB에 삽입되고, 삽입된 데이터의
	키 값을 Integer 타입으로 반환해주고, 
	새로운 레코드를 삽입 후 해당 키값을 반환 한다.
	 */
	
	//R
	public CarVO read(Long cno);
	
	//U
	public int update(CarVO car);
	//클라이언트에서 수정한 내용을 CarVO로 수집하여 파라미터로 사용한다.
	
	//D
	public int delete(Long cno);
	
	//페이징 관련 메서드, 게시글 총 갯수를 반환
	public int getTotalCount(CarCriteria cri);
	
	//게시판 댓글 숫자 업데이트 메서드
	public void updateReplyCnt(@Param("cno") Long cno, @Param("amount") int amount);
	
}

```

```xml
CarMapper.xml

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="org.ezen.ex02.mapper.CarMapper">

<!-- CDATA는 sql문 안에서 키워드 or 부호 등...을 사용가능 하도록 해주는 것이고, 
	id 속성은 CarMapper인터페이스의 추상메서드명이다. -->
<select id="getList" resultType="org.ezen.ex02.domain.CarVO">
	<![CDATA[select * from carrot_car where cno > 0 order by cno desc]]>
</select>

<!-- page 처리가 포함된 sql
	정렬 성능을 위해 힌트 사용 /*+INDEX_DESC(tbl_board pk_board)*/
	rownum사용 위해 인라인뷰를 사용,rownum은 1이 꼭 포함되게 조건 만든다.
	인라인뷰의 결과도 가상 view객체처럼 사용
	
	SELECT 문을 사용하여 cno, title, content, writer, regdate, updatedate 열을 선택한다.
	FROM 절에서 하위 쿼리를 사용합니다. 하위 쿼리는 테이블 carrot_car에서 데이터를 가져오는데, rownum이라는 가상의 열을 추가합니다. rownum은 각 행의 일련번호를 의미합니다.
	하위 쿼리에서는 WHERE 절을 사용하여 rownum이 #{pageNum} * #{amount}보다 작거나 같은 행만 선택합니다. 이를 통해 원하는 페이지의 데이터 개수를 조절할 수 있습니다.
	최종 결과는 WHERE 절의 조건을 만족하는 행만 선택합니다. WHERE 절의 조건은 (#{pageNum} - 1) * #{amount}보다 큰 rownum을 가진 행들입니다. 이를 통해 페이징 처리를 구현합니다.
	resultType="org.ezen.ex02.domain.BoardVO"는 결과를 매핑할 자바 객체의 타입을 지정합니다. 결과가 BoardVO 클래스의 인스턴스로 매핑될 것을 의미합니다.
	이렇게 작성된 SQL 쿼리는 페이지 번호(pageNum)와 한 페이지당 출력할 데이터 개수(amount)를 입력받아 해당하는 페이지의 데이터를 조회합니다. 페이징 처리를 위한 로직이 내장되어 있어 효과적인 데이터 조회가 가능합니다. 
-->
<select id="getListWithPaging" resultType="org.ezen.ex02.domain.CarVO">
	<![CDATA[
		select cno, title, content, writer, regdate, updatedate
		from
		(
			select /* +INDEX_DESC(carrot_car pk_carrot_car) */
			rownum cno, title, content, writer, regdate, updatedate
			from carrot_car
			where rownum <= #{pageNum} * #{amount}
		)
		where cno > (#{pageNum} -1) * #{amount}
	]]>
</select>

<!-- pk인 cno 값을 미리 알 필요가 없는 경우에 사용, insert(Create)만 수행한다. 
	PreaparedStatement를 사용, ? 바인딩 변수 대신 #{변수명}을 사용한다
	parameterType은 기본형, 문자열, 객체형일시에 생략이 가능하다.
-->
<insert id="insert">
insert into carrot_car(cno,writer,title,content,carName,carType,carYear,carPrice,carDate,fuel,disp,kilos,mission) 
values(car_seq.nextval, #{writer}, #{title}, #{content}, #{carName}, #{carType}, #{carYear}, #{carPrice}, #{carDate}, #{fuel}, #{disp}, #{kilos}, #{mission})
</insert>

<insert id="insertSelectKey">
	<selectKey keyProperty="cno" order="BEFORE" resultType="Long">
		select car_seq.nextval from dual
	</selectKey>
	
	insert into carrot_car(cno,writer,title,content,carName,carType,carYear,carPrice,carDate,fuel,disp,kilos,mission) 
	values(#{cno}, #{title}, #{writer}, #{content}, #{carName}, #{carType}, #{carYear}, #{carPrice}, #{carDate}, #{fuel}, #{disp}, #{kilos}, #{mission})
</insert>

<select id="read" resultType="org.ezen.ex02.domain.CarVO">
	select * from carrot_car where cno = #{cno}
</select>

<update id="update">
	update carrot_car
	set title = #{title},
		writer = #{writer},
		content = #{content},
		updateDate = sysdate,
		carName = #{carName},
		carType = #{carType},
		carYear = #{carYear},
		carPrice = #{carPrice},
		carDate = #{carDate},
		fuel = #{fuel},
		disp = #{disp},
 		kilos = #{kilos},
		mission = #{mission}
	where cno = #{cno}
</update>

<delete id="delete">
	delete carrot_car where cno = #{cno}
</delete>

<!-- getTotalCount : 검색처리 전 -->
<select id="getTotalCount" resultType="int">
	select count(*) from carrot_car where cno > 0
</select>

<update id="updateReplyCnt">	
	update carrot_car set replycnt = (select replycnt from carrot_car where cno = #{cno}) + 1
	where cno = #{cno}
</update>

</mapper>
```
</details>

<details>
  <summary>CarAttachMapper</summary>
 
```java
package org.ezen.ex02.mapper;

import java.util.List;

import org.ezen.ex02.domain.CarAttachVO;

public interface CarAttachMapper {	
	//첨부파일은 수정이 필요가 없다. update 메서드는 추가 하지 않는다.
	
	//C
	public void insert(CarAttachVO vo);
	
	//D
	public void delete(String uuid);
	
	//R
	public List<CarAttachVO> findByCno(Long cno); 
	//게시물 번호로 첨부파일의 목록을 찾는 메서드
	
	//게시물 이미지 1개 가져오기
	public CarAttachVO getImage(Long cno);
	
	//D
	public void deleteAll(Long cno);
	
	//R
	public List<CarAttachVO> getOldFiles(); //어제 날짜의 첨부 파일 데이터를 반환한다.
	
}
	
 ```
	
 ```xml

CarAttachMapper.xml

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="org.ezen.ex02.mapper.CarAttachMapper">

<!-- java의 boolean인 fileType은 문자 '0'이나 '1'로 처리(true는 '1') -->
<insert id="insert">
	insert into carrot_attach(uuid,uploadpath,filename,filetype,cno)
	values(#{uuid},#{uploadPath},#{fileName},#{fileType},#{cno})
</insert>

<!-- uuid가 pk인 첨부 파일 하나를 지우기 -->
<delete id="delete">
	delete from carrot_attach where uuid = #{uuid}
</delete>

<!-- 게시물 번호를 이용해서 첨부파일 목록을 조회 해주는 쿼리 -->
<select id="findByCno" resultType="org.ezen.ex02.domain.CarAttachVO">
	select * from carrot_attach where cno = #{cno}
</select>

<!-- 게시물 번호를 이용해서 이미지 1개를 가져올 쿼리 -->
<select id="getImage" resultType="org.ezen.ex02.domain.CarAttachVO">
	<![CDATA[
		select * from carrot_attach where cno = #{cno} and rownum <= 1
	]]> 
</select>

<!-- 게시물 번호에 해당하는 cno 번호 모두 삭제하는 쿼리 -->
<delete id="deleteAll">
	delete carrot_attach where cno = #{cno}
</delete>

<!-- 어제 날짜로 등록된 경로를 찾아 첨부파일 데이터를 반환해주는 쿼리 -->
<select id="getOldFiles" resultType="org.ezen.ex02.domain.CarAttachVO">
	select * from carrot_attach where uploadpath = to_char(sysdate -1,'yyyy/mm/dd')
</select>

</mapper>	
 ```
</details>

<details>
	<summary>CarReplyMapper</summary>
	- 미.완 (구현중)
</details>



### Service
<details>
  <summary>CarService</summary>
	
```java
package org.ezen.ex02.service;

import java.util.List;

import org.ezen.ex02.domain.CarAttachVO;
import org.ezen.ex02.domain.CarCriteria;
import org.ezen.ex02.domain.CarVO;

//비즈니스 계층 인터페이스
public interface CarService {

	//페이징을 위한 처리
	//R - 리스트 출력(목록 select - 페이징 처리 후)
	public List<CarVO> getList(CarCriteria cri);
	
	//게시글 총 합계, 페이징을 위한 처리
	public int getTotal(CarCriteria cri);
	
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
	
	//이미지 1개 가져올 메서드
	public CarAttachVO getImage(Long cno);
}
```
</details>

<details>
  <summary>CarServiceImpl</summary>
	
```java
package org.ezen.ex02.service;

import java.util.List;

import org.ezen.ex02.domain.CarAttachVO;
import org.ezen.ex02.domain.CarCriteria;
import org.ezen.ex02.domain.CarVO;
import org.ezen.ex02.mapper.CarAttachMapper;
import org.ezen.ex02.mapper.CarMapper;
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
	
	//목록보기 - 페이징 처리 후
	@Override
	public List<CarVO> getList(CarCriteria cri) {
		
		log.info("get List With Criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	//게시글 총 합계 - 페이징 처리
	@Override
	public int getTotal(CarCriteria cri) {
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
			
			log.info(attach);
			attachMapper.insert(attach);
		});
	}

	@Override
	public CarVO get(Long cno) {
		log.info("get : " + cno);
		
		return mapper.read(cno);
	}
	
	@Override
	public CarAttachVO getImage(Long cno) {
		log.info("get Image : cno" + cno);
		
		return attachMapper.getImage(cno);
	}
	
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
```
</details>

<details>
  <summary>CarReplyService</summary>
	- 미.완 (구현중)
</details>

<details>
  <summary>CarReplyServiceImpl</summary>
	- 미.완 (구현중)
</details>

### Controller
<details>
  <summary>CarController</summary>

  ```java

  package org.ezen.ex02.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.ezen.ex02.domain.CarAttachVO;
import org.ezen.ex02.domain.CarCriteria;
import org.ezen.ex02.domain.CarPageDTO;
import org.ezen.ex02.domain.CarVO;
import org.ezen.ex02.service.CarService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //컨트롤러 클래스로서 스프링 빈으로 등록한다.
@Log4j //log를 출력하기 위해 사용
@RequestMapping("/car") //받은 요청을 해당 메서드로 연결하며 클래스로 지정할시에는 공통 경로가 된다.
@AllArgsConstructor //lombok의 모든 멤버변수를 파라미터로 갖는 생성자를 생성해준다, 멤버변수가 하나일때 사용한다.
public class CarController {
	private CarService service; //CarService 인터페이스를 구현한 구현체를 주입받는 멤버 변수
	
	//페이징 처리 후 - list(R)
	@GetMapping("/list_car")
	public void list(CarCriteria cri, Model model) {
		log.info("list_car");
		log.info(cri);
		log.info(service.getList(cri));
		model.addAttribute("list_car", service.getList(cri));
		
		//실제 게시글의 개수
		int total = service.getTotal(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new CarPageDTO(cri, total));
	}
	
	//게시글 등록창 보기
	@GetMapping("/register_car")
	public void registerForm() {
		log.info("registerForm : ");
	}
	
	//게시글 등록 처리 - 첨부파일 처리 후
	@PostMapping("/register_car")
	public String register(CarVO car, RedirectAttributes rttr) {
			
		log.info("register : " + car);
		
		if(car.getAttachList() != null) {
			car.getAttachList().forEach(attach -> log.info(attach));
		}
			
		service.register(car);
			
		rttr.addFlashAttribute("result", car.getCno());
			
		return "redirect:list_car";
		}
	
	@GetMapping({"/get_car", "/modify_car"})
	public void get(@RequestParam("cno") Long cno, @ModelAttribute("cri") CarCriteria cri, Model model) {
		log.info("get_car & modify");
		
		model.addAttribute("car", service.get(cno));
	}
	
	// 첨부파일, 페이징 처리 후
	@PostMapping("/modify_car")
	public String modify(CarVO car, CarCriteria cri, RedirectAttributes rttr) {
		
		log.info("modify_car" + car);
		
		if(service.modify(car)) {
			
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:list_car";
	}
	
	// 페이징, 첨부파일 처리 후
	@PostMapping("/remove_car")
	public String remove(@RequestParam("cno") Long cno, CarCriteria cri, RedirectAttributes rttr ) {
		
		log.info("remove_car : " + cno);
		
		List<CarAttachVO> attachList = service.getAttachList(cno);
		
		if(service.remove(cno)) {
			
			//폴더에 있는 파일들을 삭제 한다.
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addFlashAttribute("pageNum" + cri.getPageNum());
		rttr.addFlashAttribute("amount" + cri.getAmount());
		
		return "redirect:list_car";
	}
	
	//클라이언트에서 특정 게시물에 대한 첨부파일 정보를 요청하는 메서드
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<CarAttachVO>> getAttachList(Long cno) {
		log.info("getAttachList : " + cno);
		log.info(service.getAttachList(cno));
		return new ResponseEntity<>(service.getAttachList(cno), HttpStatus.OK);
	}

	@GetMapping(value = "/display/{cno}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<byte[]> getImage(@PathVariable("cno") Long cno) {
		
		CarAttachVO attach = service.getImage(cno);
		
		// 실제 이미지 데이터를 바이트 배열로 보냄(외부 경로에 있는 파일에는 직접 접근이 불가능해서 바이트 배열로 데이터를 보냄)
		// fileName은 전체 경로 보냄(YYYY/MM/DD/S_UUID/이름
		log.info("fileName: " + attach);

		File file = new File("c:/upload/" + attach.getUploadPath() + "\\s_" + attach.getUuid()+"_" + attach.getFileName());
		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			// header에 Content-Type에 MIME추가

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			// file객체를 byte배열로 변환하여 JSON으로 반환

		} catch (IOException e) {

			e.printStackTrace();
		}
		return result;
	}
	
	/*
	이 코드는 /display/{cno} 경로로 GET 요청이 들어왔을 때 이미지 파일을 서버에서 읽어와 클라이언트에게 전송하는 기능을 구현한 핸들러 메서드입니다.
	
	@GetMapping 어노테이션은 /display/{cno} 경로에 대한 GET 요청을 처리합니다.
	
	@PathVariable("cno") 어노테이션을 사용하여 경로 변수 cno를 매개변수 Long cno에 바인딩합니다.
	service.getImage(cno)를 호출하여 cno 값에 해당하는 이미지 파일 정보를 가져옵니다.
	이미지 파일의 실제 경로를 생성하기 위해 attach 객체의 정보를 사용합니다.
	
	File 객체를 생성하여 이미지 파일에 대한 전체 경로를 지정합니다.
	HttpHeaders 객체를 생성하여 Content-Type 헤더를 설정합니다. 
	Files.probeContentType() 메서드를 사용하여 파일의 MIME 타입을 확인하고,
	이를 Content-Type 헤더에 추가합니다.
	
	FileCopyUtils.copyToByteArray() 메서드를 사용하여 이미지 파일을 바이트 배열로 읽어옵니다.
	ResponseEntity 객체를 생성하여 바이트 배열과 헤더를 설정하고, 상태 코드는 HttpStatus.OK로 설정합니다.
	생성된 ResponseEntity 객체를 반환하여 클라이언트에게 이미지 파일 데이터를 전송합니다.
	이 코드는 클라이언트에서 /display/{cno} 경로로 GET 요청을 보내면,
	해당 cno 값을 사용하여 서버에 저장된 이미지 파일을 읽어와서 클라이언트에게 전송합니다.
	클라이언트는 응답을 받아 이미지 파일 데이터를 화면에 표시할 수 있습니다.
	*/
	
	//첨부파일을 삭제하는 메서드
	private void deleteFiles(List<CarAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;		
		}
		log.info("delete attach files...");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"c:/upload/" + attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("c:/uplaod/" + attach.getUploadPath() + "/s_" + attach.getUuid() + "_"
							+ attach.getFileName());
					
					Files.delete(thumbNail);
				}
			
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
}

  ```
</details>

<details>

<summary>CarUploadController</summary>

```java
package org.ezen.ex02.service;

import java.util.List;

import org.ezen.ex02.domain.CarAttachVO;
import org.ezen.ex02.domain.CarCriteria;
import org.ezen.ex02.domain.CarVO;
import org.ezen.ex02.mapper.CarAttachMapper;
import org.ezen.ex02.mapper.CarMapper;
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
	
	//목록보기 - 페이징 처리 후
	@Override
	public List<CarVO> getList(CarCriteria cri) {
		
		log.info("get List With Criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	//게시글 총 합계 - 페이징 처리
	@Override
	public int getTotal(CarCriteria cri) {
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
			
			log.info(attach);
			attachMapper.insert(attach);
		});
	}

	@Override
	public CarVO get(Long cno) {
		log.info("get : " + cno);
		
		return mapper.read(cno);
	}
	
	@Override
	public CarAttachVO getImage(Long cno) {
		log.info("get Image : cno" + cno);
		
		return attachMapper.getImage(cno);
	}
	
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
```
</details>

<details>
	<summary>CarReplyController</summary>
	- 미.완 (구현중)
</details>

### View

<details>
  <summary>list_car.jsp</summary>

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9" />

</head>
<body>

<%@ include file="../include/header.jspf"%>

<div class="container mt-5 mb-5" id="mainContent">
	<div class="row">
		<div class="col-md-30">
			<div class="container mt-10 mb-10 p-0 m-0 mx-auto">

				<div id="myCarousel" class="carousel slide" data-ride="carousel">

					<!-- Indicators -->
					<ul class="carousel-indicators ">
						<li data-target="#myCarousel" data-slide-to="0"
							class="active bg-danger"></li>
						<li data-target="#myCarousel" data-slide-to="1"
							class=" bg-danger"></li>
						<li data-target="#myCarousel" data-slide-to="2"
							class=" bg-danger"></li>
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner ">
						<div class="carousel-item active">
							<img src="../images/bmw520d.jpg" alt="Los Angeles" class="d-block mx-auto">
							<div class="carousel-caption">
								<h1>최근 인기 매물 TOP-1</h1>
								<p>BMW - 520d</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="../images/펠리세이드.jpg" alt="Chicago" class="d-block mx-auto ">
							<div class="carousel-caption">
								<h1>최근 인기 매물 TOP-2</h1>
								<p>현대 - 펠리세이드</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="../images/그랜저.jpg" alt="New York" class="d-block mx-auto ">
							<div class="carousel-caption">
								<h1>최근 인기 매물 TOP-3</h1>
								<p>현대 - 그랜저</p>
							</div>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev bg-primary" href="#myCarousel"
						data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next bg-primary" href="#myCarousel"
						data-slide="next"> <span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>

			<!--  
			<h2>TITLE HEADING</h2>
			<h5>Title description, Dec 7, 2017</h5>
			<div class="fakeimg">
				<img src="../images/스포티지.png" class="w-100 h-100" />
			</div>
			<p>Some text..</p>
			<p>Some text.. Some text.. Some text..</p>
			<br />
			<h2>TITLE HEADING</h2>
			<h5>Title description, Dec 7, 2017</h5>
			<div class="fakeimg">
				<img src="../images/qm6.jpg" class="w-100 h-100" />
			</div>
			<p>Some text..</p>
			<p>Some text.. Some text.. Some text..</p>
			<br />
			-->
			
		</div>
	</div>
</div>

<!-- 리스트 영역 -->
<main>
<section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">인기 중고차 매물!</h1>
        <p class="lead text-muted">최근 인기있는 매물들을 소개 합니다!!</p>
        <p>
        <!-- 
          <a href="#" class="btn btn-primary my-2">Main call to action</a>
          <a href="#" class="btn btn-secondary my-2">Secondary action</a>
         -->
        </p>

      <!-- 게시글 등록 -->
      <div>
			<button type="button" class="btn btn-primary float-center mb-3" id="regBtn">게시글 등록</button>
	  </div>

      </div>
    </div>
</section>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">				
		
		<c:forEach items="${list_car}" var="car">        
        <div class="col">
          <div class="card shadow-sm">
            <svg style="background: url(display/${car.cno});background-repeat: no-repeat;
    background-size: cover;" class="bd-placeholder-img card-img-top" width="100%" height="210" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
            
            <!-- 
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/>
            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
             -->
            </svg>

            <div class="card-body">
              <p class="card-text">${car.title}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                  <a class="btn btn-sm btn-outline-secondary" href='get_car?cno=<c:out value="${car.cno}"/>'>상세보기</a>&nbsp;&nbsp;
				  <!--  <a class="btn btn-sm btn-outline-secondary" href='modify_car?cno=<c:out value="${car.cno}"/>'>수정</a> -->
				  
				  <!-- 참고용 코드  
                  <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
                	-->
                	
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
	</c:forEach>  
	</div>
	</div>4
</div>

<!-- 페이지 표시 -->
<ul class="pagination justify-content-center" style="margin: 20px 0">
	<c:if test="${pageMaker.prev}">
		<li class="page-item">
		<a class="page-link" href="${pageMaker.startPage - 1}">이전</a>
		</li>
	</c:if>
	
	<c:forEach var="num" begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}">

		<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
			<a class="page-link" href="${num}">${num}</a>
		</li>
	</c:forEach>
	
	<c:if test="${pageMaker.next}">
		<li class="page-item">
		<a class="page-link" href="${pageMaker.endPage + 1}">다음</a>
		</li>
	</c:if>
</ul> 

<!-- 페이지 번호 클릭시 처리를 담당하는 form(안보이게 처리함), -->
<form id='actionForm' action="list_car" method="get">
	<input type='hidden' name='pageNum'
		value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount'
		value='${pageMaker.cri.amount}'>
</form>

</main>

<!-- 게시글 Test -->
<!--  
<div class="container mt-4 mb-4" id="mainContent">
	<div class="row">
			<div class="table-responsive-md">
						<table id="carTable" class="table table-bordered table-hover ">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>내용</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list_car}" var="car">
									<tr>
										<td class="cno"><c:out value="${car.cno}" /></td>
										<td>
		
											   jquery로 페이지 이벤트 처리 전  
											<a class="move" href='get_car?cno=<c:out value="${car.cno}"/>'>
												<c:out value="${car.title}" />
											</a>
											
										</td>
										<td><c:out value="${car.writer}" /></td>
										<td><c:out value="${car.content}"/></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${car.regDate}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${car.updateDate}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
-->		
<script>
$(document).ready(function(){
				
	let result = '<c:out value="${result}"></c:out>';
	//result는  redirect:로 URL이동시 RedirectAttributes에 저장한 속성값

	console.log("result : " + result);

	history.replaceState({}, null, null);
	//현재 히스토리를 전부 비운다
	
	$("#regBtn").on("click", function(){
		self.location = "register_car";
	});
	
	let actionForm = $("#actionForm");
	$(".page-item a").on("click", function(e){
		e.preventDefault(); //a 태그의 본래의 기능을 취소 시킨다.
		console.log('page 번호 클릭!');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		//find(selector)메서드는 자식 엘리먼트에서 selector에 해당하는 엘리먼트를 선택한다.
		//pageNum이 name인 input의 value에 클릭한 a의 href값(페이지 번호)을 넣어준다.
		//this는 이벤트가 일어난 객체이므로 <a>가 된다.
		actionForm.submit(); //submit(),reset()은 form의 이벤트
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='cno' value='" 
				+ $(this).attr("href") + "'>");
		//메서드에 의해 구해지는 값이므로 +로 연결을 해준다. 뒤에는 변수 선언시가 아닌 표시를 의미하므로 보이는 대로 표시한다.
		actionForm.attr("action", "get_car");
		actionForm.submit();
	});
});
</script>

<%@ include file="../include/footer.jspf"%>
</body>
</html>
```
</details>

<details>
	<summary>get_car.jsp</summary>

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9" />

<style>
.card img {
	width : 150px;
	height : 150px;
}
</style>
</head>

<body>
<%@ include file="../include/header.jspf" %>

<div class="container mt-5 mb-5" id="mainContent">
	<div class="row">
	<div class="col-md-30">
		<div class="col-md-20">
			<div id="submain">
				<br/><br/>
				<br/><br/>
				
				<h3 class="text-center multiEffect text-success">상세보기</h3>
				
				<div class='bigPictureWrapper w-100 mb-5 h-100'>
					<div class='bigPicture'>
					</div>
				</div>

				<!-- 첨부물 처리 창 (추가) -->
	  				<div class='uploadResult mt-4'>
	  					<div class='row' id='card'>
	  					</div>
	  				</div>	
				
				<br/><br/>
  				
  				<form>
  				 	<div class="form-group">
  				 		<label for="cno">번호 : </label>
  				 		<input type="text" class="form-control" id="cno" name="cno" readonly
  				 			value='<c:out value="${car.cno}"/>' />
  				 	</div>
  				 	
  				 	<div class="form-group">
  				 		<label for="writer">작성자 : </label>
  				 		<input type="text" class="form-control" id="writer" name="writer" readonly
  				 			value='<c:out value="${car.writer}"/>' />
  				 	</div>

  				 	<div class="form-group">
  				 		<label for="title">제목 : </label>
  				 		<input type="text" class="form-control" id="title" name="title" readonly
  				 			value='<c:out value="${car.title}"/>' />
  				 	</div>
  				 	
  				 	
  				 	<div class="form-group">
  				 		<label for="content">내용 : </label>
<textarea class="form-control" id="content" name="content" rows="10" readonly><c:out value="${car.content}"/></textarea>
  				 	</div>

	  				<br/><br/>
	  				<div class="form-group">
						<label for="carName">차량명 : </label>
						<input type="text" class="form-control" id="carName" name="carName" 
							readonly="readonly" value='<c:out value="${car.carName}"/>' />
					</div>

	  				<div class="form-group">
						<label for="carType">차종 : </label>
						<input type="text" class="form-control" id="carType" name="carType" 
							readonly="readonly" value='<c:out value="${car.carType}"/>' />
					</div>
	  				
	  				<div class="form-group">
						<label for="carYear">연식 : </label>
						<input type="text" class="form-control" id="carYear" name="carYear" 
							readonly="readonly" value='<c:out value="${car.carType}"/>' />
					</div>
	  				
	  				<div class="form-group">
						<label for="carPrice">금액 : </label>
						<input type="text" class="form-control" id="carPrice" name="carPrice" 
							readonly="readonly" value='<c:out value="${car.carPrice}"/>' />
					</div>

	  				<div class="form-group">
						<label for="carDate">차량 등록일 : </label>
						<input type="text" class="form-control" id="carDate" name="carDate" 
							readonly="readonly" value='<c:out value="${car.carDate}"/>' />
					</div>

	  				<div class="form-group">
						<label for="fuel">연료 : </label>
						<input type="text" class="form-control" id="fuel" name="fuel" 
							readonly="readonly" value='<c:out value="${car.fuel}"/>' />
					</div>
					
	  				<div class="form-group">
						<label for="disp">배기량 : </label>
						<input type="text" class="form-control" id="disp" name="disp" 
							readonly="readonly" value='<c:out value="${car.disp}"/>' />
					</div>

	  				<div class="form-group">
						<label for="kilos">키로수 : </label>
						<input type="text" class="form-control" id="kilos" name="kilos" 
							readonly="readonly" value='<c:out value="${car.kilos}"/>' />
					</div>

	  				<div class="form-group">
						<label for="mission">변속기 : </label>
						<input type="text" class="form-control" id="mission" name="mission" 
							readonly="readonly" value='<c:out value="${car.mission}"/>' />
					</div>
					
					<div class="form-group">
  				 		<label for="regDate">게시글 등록일 : </label>
  				 		<input type="text" class="form-control" id="regDate" name="regDate" readonly
  				 			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${car.regDate}"/>' />
  				 	</div>

  				 	<div class="form-group">
  				 		<label for="updateDate">게시글 수정일 : </label>
  				 		<input type="text" class="form-control" id="updateDate" name="updateDate" readonly
  				 			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${car.updateDate}"/>' />
  				 	</div>
	  				</form>
  				
  				<button type="button" data-oper='modify_car' class="btn btn-info">수정</button>
  				&nbsp;&nbsp;
  				<button data-oper='list_car' class="btn btn-danger">목록</button>
  				
	  				<!-- 버튼 클릭을 처리하기 위해 form추가, 보이지 않게 설정해둠 -->
	  				<form id='operForm' action="modify_car" method="get">
	  					<input type="hidden" id="cno" name="cno"
	  						value='<c:out value="${car.cno}"/>'>
	  				</form>
	  				
	  				<!-- 페이지 정보를 추가 -->	
					<input
						type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> 
					<input
						type='hidden' name='amount'
						value='<c:out value="${cri.amount}"/>'>
					
					<div id="map" style="width:500px;height:400px;"></div>
						<p><em>지도를 클릭해주세요!</em></p> 
					<div id="clickLatlng"></div>
					
					<!-- 댓글 창 추가-->
					<div class="row mt-4">
						<div class="col-md-12 clearfix">
							<i class="fas fa-reply fa-2x">댓글</i>
							<button id='addReplyBtn' class='btn btn-outline-primary fload-right'>
								새 댓글
							</button>
						</div>
					</div>
					
					<div class="row mt-2">
						<div class="col-md-12">
							<ul class="chat list-group">
							
							</ul>
						</div>
					</div>
				
					<!-- 댓글용 페이지 표시하기 -->
					<div id='replyPage'>
					
					</div>
								
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 카카오맵 api 사용 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=?"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.541494514251, 126.84040179518), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		//지도를 생성합니다.
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		});
	</script>

<!-- 게시판 상세보기 - 관련 이벤트 (동적)처리 -->
<script>
//페이지 로드시 실행 코드를 정의해주는 함수, 즉 페이지가 로드되면 아래 코드 블록이 실행됨.
$(document).ready(function(){
	let operForm = $("#operForm"); 
	//operForm이라는 변수를 선언하여 $("#operForm"); 을 선택자로 하여 id가 operForm인 요소를 가져온다
	
	$("button[data-oper='modify_car']").on("click", function(e){
		
		if(!confirm("수정 하시겠습니까?")){
			alert("수정을 취소 합니다.");
			return false;
		} else {
			alert("수정 창으로 이동 합니다.");
		}
		
		operForm.attr("action", "modify_car").submit();
		
		
	});
	
	$("button[data-oper='list_car']").on("click", function(e){
		operForm.find("#cno").remove();
		//id가 cno인 DOM 객체를 찾아서 제거한다.
		operForm.attr("action", "list_car");
		operForm.submit();
	});
});
</script>

<!-- 첨부파일 처리 자바스크립트 -->
<script>
$(document).ready(function(){
	//즉시실행함수(1회)
	(function(){
		let cno = '<c:out value="${car.cno}"/>';
		$.getJSON("getAttachList", {cno : cno}, function(arr){
		      //GET방식으로 컨트롤러의 getAttachList로 cno값을 보내서 결과를 arr로 받아서 처리
		      console.log(arr);	
		      
		      let str = "";
		      
		      $(arr).each(function(i, obj){
		    	  
		    	  if (!obj.fileType)  {	 //일반 파일일시
		    		  
		    		    //한글 이나ㅣ 공백등이 URL에 포함되어 있을시를 해결 encodeURIComponent()
						let fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
						//YYYY/MM/DD/uuid_파일명
						//BS4의 카드 방식으로 표시
						str += "<div class='card col-md-4'>";
						str += "<div class='card-body'>";
						str += "<p class='mx-auto' style='width:90%;' title='"+ obj.fileName + "'>";
						str += "<a href='../car/download?fileName=" + fileCallPath +"'>";						
						str += "<img class='mx-auto d-block' src='../images/attach.png' >";
						str += "</a>";
						str += "</p>";
						//str += "<h4><span class='d-block w-50 mx-auto' data-file='"+fileCallPath+"' data-type='file'> &times; </span></h4>";
						str += "</div>";
						str += "</div>";
						
					}				    	  
					else { //이미지 일시
														
						let fileCallPath = encodeURIComponent( obj.uploadPath + "/s_"+obj.uuid+"_" + obj.fileName);
						let originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName; //원본파일 경로
						originPath = originPath.replace(new RegExp(/\\/g),"/"); //\\를 /로 대체 
						
						str += "<div class='card col-md-4'>";
						str += "<div class='card-body'>";
						str += "<p class='mx-auto' style='width:90%;' title='"+ obj.fileName + "'>";
						str += "<a href=\"javascript:showImage(\'"+originPath+"\')\">"; //원본 파일 보기 위해 클릭 이벤트 처리
						str += "<img class='mx-auto d-block' src='../car/display?fileName=" +fileCallPath+"'></a>"; //클릭 링크 이미지,직접 자원에 접근 못함
						str += "</p>";
						//str += "<h4><span class='d-block w-50 mx-auto' data-file='"+fileCallPath+"' data-type='image'> &times; </span></h4>";
						str += "</div>";
						str += "</div>";
					}
		    	  				    	  
		      });
		      console.log(str);
		      $(".uploadResult #card").html(str);
		 });
	})(); //()는 즉시 실행 연산자	
});

function showImage(fileCallPath) {
	//<a>태그에서 직접 호출시 대비
	alert(fileCallPath);
	
	$(".bigPictureWrapper").css("display","block").show();
			
	$(".bigPicture")
		.html("<img class='d-block w-75 mx-auto' src='../car/display?fileName="+ encodeURI(fileCallPath)+"'>")
		.animate({width:'100%', height: '100%'}, 1000);
	
	$('.imageModal_car .modal-body').html("<img class='d-block w-75 mx-auto' src='../car/display?fileName=" + encodeURI(fileCallPath)+"&size=1'>");
    
	$(".imageModal_car").modal("show");
}
</script>

<!-- 댓글 처리 -->
	<script>
		$(document).ready(function(){
			let cnoValue = '<c:out value="${car.cno}"/>';
			let replyUL = $(".chat");
			
			showList(1);
			
			function showList(page) {
				console.log("show list " + page);
				
				replyService.getList({cno:cnoValue,page: page|| 1 },						
						function(list){  //list는 서버에서 ArrayList(배열형태,요소는 reply객체의 JSON배열)
						//자바스크립트에서는 JS객체 처럼 사용
						
						var str="";							
						
						if(list == null || list.length == 0){
						       replyUL.html("");						      
						       return;
						}
						
						for (let i = 0, len = list.length || 0; i < len; i++) {
							str += "<li class='list-group-item clearfix' data-rno='"+list[i].rno+"'>";
							str += "<strong class='text-primary'>" + list[i].replyer + "</strong>";
							//str += "<small class='float-right text-mute'>" + list[i].replyDate + "</small>";
							str += "<small class='float-right text-mute'>" + replyService.displayTime(list[i].replyDate) + "</small>";						
							str += "<p>" + list[i].reply + "</p>";
							str += "</li>";							
					    }
					
					//자바에서 Date객체는 ajax로 클라이언트에서 처리시는 posix로 처리됨
					
					replyUL.html(str);
					
				});
			} 
			
			/*
			function showList(page){
				
				console.log("show list " + page);
			    
			    replyService.getList({cno:cnoValue,page: page|| 1 }, function(rpDto) {
			    	let replyCnt = rpDto.replyCnt;
			    	let list = rpDto.list;
				    console.log("replyCnt: "+ replyCnt );
				    console.log("list: " + list);
				    
				    if(page == -1){
				      pageNum = Math.ceil(replyCnt/10.0);
				      showList(pageNum);
				      return;
				    }
				      
				     let str="";
				     
				     if(list == null || list.length == 0){
				    	 replyUL.html(""); 
				         return;
				     }
				     
				     for (let i = 0, len = list.length || 0; i < len; i++) {
							str += "<li class='list-group-item clearfix' data-rno='"+list[i].rno+"'>";
							str += "<strong class='text-primary'>" + list[i].replyer + "</strong>";
							//str += "<small class='float-right text-mute'>" + list[i].replyDate + "</small>";
							str += "<small class='float-right text-mute'>" + replyService.displayTime(list[i].replyDate) + "</small>";						
							str += "<p>" + list[i].reply + "</p>";
							str += "</li>";
					 }
				     
				     replyUL.html(str);
				     
				     showReplyPage(replyCnt);
			 
			   });//replyService.getList()
			     
			}//end showList()
			*/
			
			let pageNum = 1;
			let replyPageFooter = $("#replyPage");
			
			function showReplyPage(replyCnt) {
				
				let endNum = Math.ceil(pageNum / 10.0) * 10;
				let startNum = endNum - 9;
				
				let prev = startNum != 1;
			    let next = false;
			    
			    if(endNum * 10 >= replyCnt) {
			    	endNum = Math.ceil(replyCnt/10.0);
			    }
			    
			    if(endNum * 10 < replyCnt) {
			    	next = true;
			    }
			    
			    let str = "<ul class='pagination justify-content-center' style='margin: 20px 0'>";
			    if(prev) {
			    	str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
			    }
			    
			    for(let i = startNum ; i <= endNum; i++) {
			    	let active = pageNum == i ? "active": "";
			    	str+= "<li class='page-item " +active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			    }
			    
			    if(next) {
			    	str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
			    }
				
			    str += "</ul>";
			    
			    console.log(str);
			    
			    replyPageFooter.html(str);
			    
			} //showReplyPage(replyCnt)
			
			let modal = $("#replyModal_car");
		    let modalInputReply = modal.find("input[name='reply']"); //find는 후손중에서 선택
		    let modalInputReplyer = modal.find("input[name='replyer']");
		    let modalInputReplyDate = modal.find("input[name='replyDate']");
		    
		    let modalModBtn = $("#modalModBtn");
		    let modalRemoveBtn = $("#modalRemoveBtn");
		    let modalRegisterBtn = $("#modalRegisterBtn");
		    
			let replyer = null;
			
			/*
			<sec:authentication property="principal" var="pinfo"/>
		    <sec:authorize access="isAuthenticated()">		    
		    	replyer = '<sec:authentication property="principal.username"/>'; 
		    	//이메일 주소가 encode되어 나옴
		    	replyerS = "${pinfo.username}"; //정상 이메일 문자열		    	
			</sec:authorize>
		    
		    let csrfHeaderName ="${_csrf.headerName}"; 
		    let csrfTokenValue="${_csrf.token}";
		    
		    $(document).ajaxSend(function(e, xhr, options) { 
		        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
		    });
		    */
		    
		    //나가기 버튼 이벤트 처리
		    $("#modalCloseBtn").on("click", function(e){
    	
    			modal.modal('hide');
    		});
		    
		    //등록 모달창 이벤트
			$("#addReplyBtn").on("click", function(e){
				
				modal.find("input").val(""); //input의 값을 초기화
			    modal.find("input[name='replyer']").val(replyer); //로그인한 사용자로 작성자 고정
			    modalInputReplyDate.closest("div").hide(); //날짜 입력DOM은 감춤
			    modal.find("button[id !='modalCloseBtn']").hide(); //나가기만 보임
			      
			    modalRegisterBtn.show(); //등록버튼 다시 보이게
			      
			    $("#replyModal_car").modal("show");			   
			      
			 });
		    
		    //댓글 등록 이벤트
		    modalRegisterBtn.on("click",function(e){
      
		      let reply = {
		            reply: modalInputReply.val(),
		            replyer:modalInputReplyer.val(),
		            cno:cnoValue
		      };
		      replyService.add(reply, function(result){
		        
		        alert(result);
		        
		        modal.find("input").val("");
		        modal.modal("hide");
		        
		        showList(1); //등록후 댓글 목록 보이게 함
		        //showList(-1);
		        
		   	  });
		    });
		    
		    //댓글 조회 이벤트
		    $(".chat").on("click", "li", function(e){  //li는 .chat의 자식(후손)
		       
		        let rno = $(this).data("rno"); 
		    	//이벤트가 일어난 li는 this
		    	//data(data-의 값)은 data-값으로 되어있는 DOM선택
		    	
		    	console.log("rno");
		    	
		        replyService.get(rno, function(reply){
		        //reply는 서버에서 받은 ReplyVo의 JSON인데 바로 JS의 객체로 처리 		        
		        modalInputReply.val(reply.reply);		       
		        modalInputReplyer.val(reply.replyer);		        
		        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
		        .attr("readonly","readonly");
		        modal.data("rno", reply.rno);
		        //data-rno속성을 reply.rno로 추가
		          
		        modal.find("button[id !='modalCloseBtn']").hide();
		        modalModBtn.show();
		        modalRemoveBtn.show();
		          
		        $("#replyModal_car").modal("show");
		              
		      });
		    });
		    
		    //댓글 수정 이벤트
		    /*
		    modalModBtn.on("click", function(e){
		        
		        var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		        
		        replyService.update(reply, function(result){
		              
		          alert(result);
		          modal.modal("hide");
		          showList(1);
		          
		        });
		        
		    });
		    */
		    
		    //modal창에서 이메일 주소가 encode형식으로 되어 있음,remove와 modify에서 비교는 인코딩상태로 하고 reply.js로는 정상 형태로 보냄
		    modalModBtn.on("click", function(e){
		    	
		    	let originalReplyer = modalInputReplyer.val();
		    	
		      let reply = {
		    		      rno:modal.data("rno"), 
		    		      reply: modalInputReply.val(),
		    		      //replyer: originalReplyer}; 
		      			  replyer : replyerS};
		      
		    	if(!replyerS){
		    		 alert("로그인후 수정이 가능합니다.");
		    		 modal.modal("hide");
		    		 return;
		    	}

		    	console.log("Original Replyer: " + originalReplyer);
		    	
		    	if(replyerS  != originalReplyer){
		    	 
		    		 alert("자신이 작성한 댓글만 수정이 가능합니다.");
		    		 modal.modal("hide");
		    		 return;
		    	 
		    	}
		    	  
		    	replyService.update(reply, function(result){
		    	      
		    	  alert(result);
		    	  modal.modal("hide");
		    	  showList(pageNum);
		    	  
		    	});
		      
		    });
		    
		    //삭제 이벤트
		    modalRemoveBtn.on("click", function (e){
		    	  
		    	  let rno = modal.data("rno");
		    	  
		    	  console.log("RNO: " + rno);
		       	  console.log("REPLYER: " + replyer);
		       	 
		       	  
		       	  if(!replyer){
		     	 	  alert("로그인후 삭제가 가능합니다.");
		     		  modal.modal("hide");
		     		  return;
		     	  }
		       	  
		          let originalReplyer = modalInputReplyer.val();
		     	  
		     	  console.log("Original Replyer: " + originalReplyer);
		     	  
		     	 if(replyerS  != originalReplyer){
		     		  
		     		  alert("자신이 작성한 댓글만 삭제가 가능합니다.");
		     		  modal.modal("hide");
		     		  return;
		     		  
		     	  }
		    	
		     	  originalReplyer = replyerS;
		     	
		    	 // replyService.remove(rno, originalReplyer, function(result){
		    	 replyService.remove(rno, function(result){	
		    	        
		    	      alert(result);
		    	      modal.modal("hide");
		    	      //showList(1);		    	     
		    	      showList(pageNum);
		    	      
		    	  });
		    	  
		   });
		    
		    //페이지 번호 클릭 이벤트
		    replyPageFooter.on("click","li a", function(e){
		        e.preventDefault();
		        console.log("page click");
		        
		        var targetPageNum = $(this).attr("href");
		        
		        console.log("targetPageNum: " + targetPageNum);
		        
		        pageNum = targetPageNum;
		        
		        showList(pageNum);
		     });
		    
		});
	</script>

<%@ include file="../include/footer.jspf" %>
<%@ include file="../include/replyModal_car.jsp" %>
<%@ include file="../include/imageModal_car.jsp" %>

<!-- CarReply.js 외부 js 파일 import! -->
<script src="../js/CarReply.js"></script>

<!-- 카카오맵 api 라이브러리 추가  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>

<!-- 카카오맵 api - services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

<!-- 데이터를 잘 받아오는지 확인용으로 작성해본 테스트 코드  
<table style="margin-top:600px;">
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>내용</th>
  </tr>
  <tr>
    <td><c:out value="${car.cno}"/></td>
    <td><c:out value="${car.title}"/></td>
    <td><c:out value="${car.writer}"/></td>
    <td><c:out value="${car.content}"/></td>
  </tr>
</table>
-->

</body>
</html>
```
</details>

<details>
	<summary>modify_car.jsp</summary>

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 

<style>
.card img {
	width : 150px;
	height : 150px;
}
</style>

</head>
<body>

<%@ include file="../include/header.jspf" %>

<div class="container mt-5 mb-5" id="mainContent">
	<div class="row">
	<div class="col-md-30">
		<div class="col-md-20">
			<div id="submain">
				<br/><br/>
				<br/><br/>

					<!-- 첨부 파일 리스트 출력 창 -->
	  				<div class="attach mt-5">
	  					<h5 class="text-center multiEffect text-success mb-5">첨부파일 수정</h5>
	  					<div class="row">
	  						<div class="form-group uploadDiv col-md-12">
	  							<label for="upload">&nbsp;&nbsp;&nbsp;&nbsp;파일 수정 및 업로드 : </label>
	  							<input type="file" class="form-control" id="upload" name="uploadFile" multiple="multiple"/>
	  							<!-- submit 버튼없이 change JS 이벤트로 처리  -->
	  						</div>
	  					</div>
	  				</div>
	  				
	  				<!-- 첨부파일 리스트 창 출력 -->
	  				<div class="uploadResult mt-5">
	  					<div class="row" id="card">
	  					</div>	  				
	  				</div>
				
				<br/><br/>
				
				<h4 class="text-center text-success">게시글 수정</h4>
				
					<!-- 버튼 클릭을 처리하기 위해 form추가, 보이지 않게 설정해둠 -->
	  				<form id='operForm' action="modify_car" method="get">
	  					<input type="hidden" id="cno" name="cno"
	  						value='<c:out value="${car.cno}"/>'>
	  				</form>
				
  				<form id="mform" name="mform" action="modify_car" method="post">
  				
  				 	<br/><br/>
				
				 	<div class="form-group">
  				 		<label for="cno">번호 : </label>
  				 		<input type="text" class="form-control" id="cno" name="cno" readonly
  				 			value='<c:out value="${car.cno}"/>' />
  				 	</div>
  				 	
  				 	<div class="form-group">
  				 		<label for="writer">작성자 : </label>
  				 		<input type="text" class="form-control" id="writer" name="writer" readonly
  				 			value='<c:out value="${car.writer}"/>' />
  				 	</div>

  				 	<div class="form-group">
  				 		<label for="title">제목 : </label>
  				 		<input type="text" class="form-control" id="title" name="title" required="required"
  				 			value='<c:out value="${car.title}"/>' />
  				 	</div>
  				 	
  				 	<div class="form-group">
  				 		<label for="content">내용 : </label>
<textarea class="form-control" id="content" name="content" rows="10" required="required"><c:out value="${car.content}"/></textarea>
  				 	</div>

	  				<br/><br/>
	  					 
	  				<div class="form-group">
						<label for="carName">차량명 : </label>
						<input type="text" class="form-control" id="carName" name="carName" 
							required="required" value='<c:out value="${car.carName}"/>' />
					</div>

	  				<div class="form-group">
						<label for="carType">차종 : </label>
						<input type="text" class="form-control" id="carType" name="carType" 
							required="required" value='<c:out value="${car.carType}"/>' />
					</div>
	  				
	  				<div class="form-group">
						<label for="carYear">연식 : </label>
						<input type="text" class="form-control" id="carYear" name="carYear" 
							required="required" value='<c:out value="${car.carType}"/>' />
					</div>
	  				
	  				<div class="form-group">
						<label for="carPrice">금액 : </label>
						<input type="text" class="form-control" id="carPrice" name="carPrice" 
							required="required" value='<c:out value="${car.carPrice}"/>' />
					</div>

	  				<div class="form-group">
						<label for="carDate">차량 등록일 : </label>
						<input type="text" class="form-control" id="carDate" name="carDate" 
							required="required" value='<c:out value="${car.carDate}"/>' />
					</div>

	  				<div class="form-group">
						<label for="fuel">연료 : </label>
						<input type="text" class="form-control" id="fuel" name="fuel" 
							required="required" value='<c:out value="${car.fuel}"/>' />
					</div>
					
	  				<div class="form-group">
						<label for="disp">배기량 : </label>
						<input type="text" class="form-control" id="disp" name="disp" 
							required="required" value='<c:out value="${car.disp}"/>' />
					</div>

	  				<div class="form-group">
						<label for="kilos">키로수 : </label>
						<input type="text" class="form-control" id="kilos" name="kilos" 
							required="required" value='<c:out value="${car.kilos}"/>' />
					</div>

	  				<div class="form-group">
						<label for="mission">변속기 : </label>
						<input type="text" class="form-control" id="mission" name="mission" 
							required="required" value='<c:out value="${car.mission}"/>' />
					</div>
					
					<div class="form-group">
  				 		<label for="regDate">게시글 등록일 : </label>
  				 		<input type="text" class="form-control" id="regDate" name="regDate" readonly
  				 			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${car.regDate}"/>' />
  				 	</div>

  				 	<div class="form-group">
  				 		<label for="updateDate">게시글 수정일 : </label>
  				 		<input type="text" class="form-control" id="updateDate" name="updateDate" readonly
  				 			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${car.updateDate}"/>' />
  				 	</div>
  				
  				</form>
  				
  				<button type="button" data-oper='modify_car' class="btn btn-info">수정</button>&nbsp;&nbsp;
  				<button type="button" data-oper='remove_car' class="btn btn-danger">삭제</button>&nbsp;&nbsp;
  				<button type="button" data-oper='list_car' class="btn btn-primary">목록</button>
  				
  				<!-- data-oper 속성은 HTML 요소에 사용자 정의 데이터를 저장하기 위해 사용되는 속성으로, 
  					클라이언트 측 스크립트에서 해당 속성값을 활용하여 작업을 수행하거나 조건을 확인하는데 활용 한다. 
  				-->
  				
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jspf" %>

<script>
//첨부파일을 포함한 게시물 처리
$(function(){
	let formObj = $("#mform");
	
	$("button").on("click",function(e){
		e.preventDefault(); //이벤트가 일어난 버튼의 기본 동작을 제거
		
		let operation = $(this).data("oper");
		//data(data-의 뒷이름)메서드는 속성이 html5에 새롭게 추가된 data-속성값을 참조하여 값을 반환
		console.log("operation : "  + operation);
		
		if(operation == "remove_car") {
			
			if(confirm("정말 삭제 하시겠습니까? 삭제시 복구는 불가 합니다.")){
				alert("삭제 성공!");
			} else {
				alert("삭제 취소!");
				return false;
			}
			formObj.attr("action", "remove_car");
		}
		
		else if(operation == "list_car") {
			formObj.attr("action", "list_car").attr("method","get");
			//페이지 정보
			let pageNumTag = $("input[name='pageNum']").clone(); //복사를 해둔다.
			let amountTag = $("input[name='amount']").clone(); //복사를 해둔다.
			
			formObj.empty(); //formObj의 자식 엘리먼트를 모두 제거한다.
			
			//복사해둔 페이지 관련된 정보를 다시 추가한다.
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		else if(operation == 'modify_car'){
			console.log("submit clicked");
			
			let str = "";
			
			$(".uploadResult .card p").each(function(i, obj){
				let jobj = $(obj);
				
				console.dir(jobj);
				console.log("-------------------");
				console.log(jobj.data("filename"));
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='" + jobj.data("type") + "'>";
			});
			console.log(str);
			
			formObj.prepend(str).submit();
		}
		
		formObj.submit();
	});
});
</script>

<script>
//첨부물 list처리
$(document).ready(function(){
	//화면으로 이동하자 마자 리스트를 출력하므로 즉시 실행 함수로 처리
	(function(){
		let cno = '<c:out value="${car.cno}"/>';
		$.getJSON("getAttachList", {cno: cno}, function(arr){
		    
		      console.log(arr);	
		      
		      let str = "";
		      
		      $(arr).each(function(i, obj){
		    	  
		    	  if (!obj.fileType)  {					
						let fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
						str += "<div class='card col-md-4'>";
						str += "<div class='card-body'>";
						str += "<p class='mx-auto' style='width:90%;' title='"+ obj.fileName + "'" ;
						str +=  "data-path='"+obj.uploadPath +"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";						
						str += "<img class='mx-auto d-block' src='../images/attach.png' >";
						str += "</p>";
						str += "<h4><span class='d-block w-50 mx-auto badge badge-secondary badge-pill'	data-file='"+fileCallPath+"' data-type='file'> &times; </span></h4>";
						
						str += "</div></div>";
													
					}
					else {
						
						let fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName); //주소창의 URI인코딩 형식 문자열
						let originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
						originPath = originPath.replace(new RegExp(/\\/g),"/"); //\\를 /로 대체 
						//let originPath = obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName;  //위 2줄대신 바로 사용해도 됨
						
						str += "<div class='card col-md-4'>";
						str += "<div class='card-body'>";
						str += "<p class='mx-auto' style='width:90%;' title='"+ obj.fileName + "'" ;
						str +=  "data-path='"+obj.uploadPath +"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
						
						str += "<img class='mx-auto d-block' src='../car/display?fileName="+fileCallPath+"'>";
						str += "</p>";
						str += "<h4><span class='d-block w-50 mx-auto badge badge-secondary badge-pill' data-file='"+fileCallPath+"' data-type='image'> &times; </span></h4>";
						
						str += "</div></div>";							
					}		    	  
		      });
		      
		      $(".uploadResult #card").html(str);
		 });
	})();
	
	//삭제처리 span태그 클릭시 화면에서 제거 처리
	$(".uploadResult").on("click","span", function(e){
		   
		  let targetFile = $(this).data("file"); //파일 경로를 반환
		  let type = $(this).data("type");
		  console.log(targetFile);
		  
		  let targetLi = $(this).closest(".card"); //가장 가까운 엘리먼트
		  
		  targetLi.remove();
	});
});
</script>

<script>
//수정 첨부 파일 등록
$(document).ready(function(){
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	let maxSize = 5242880; //5MB
	let uploadUL = $(".uploadResult #card");
	
	$("input[type='file']").change(function(e){			
		let formData = new FormData(); //가상의 form엘리먼트 생성
		let inputFile = $("input[name='uploadFile']");
		let files = inputFile[0].files; 
		//첫번째 inputFile DOM의 files들 type이 file인경우 선택한 파일들(value값)
		console.log(files);
			
		for(let i = 0; i < files.length; i++)  {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}			
			formData.append("uploadFile", files[i]); 
			 //선택한 파일들을 input type="file" name="uploadFile" value="files[i]"로 만들어 붙이기
		}		
		
		$.ajax({			
			url: '../car/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',				    
		    dataType : 'json', //생략해도 무방		    
			success : function(result) {
				console.log(result);
				showUploadResult(result);
				$("#upload").val(""); //파일 입력창 초기화
			},
			error : function() {
				alert("ajax upload failed");
			}
		});
	});
	
	function checkExtension(fileName, fileSize) {
		
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
		    return false;
		}
		if(regex.test(fileName)) {
			 alert("해당 종류의 파일은 업로드할 수 없습니다.");
		     return false;
		}
		return true;
	}
	
	function showUploadResult(uploadResultArr) {
		
		if(!uploadResultArr || uploadResultArr.length == 0) {
			uploadUL.append("");
			return;
		}
				
		$(uploadResultArr).each(function(i, obj) {
			let str ="";
			if(obj.image) {
								
				let fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName); //주소창의 URI인코딩 형식 문자열
				let originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
				originPath = originPath.replace(new RegExp(/\\/g),"/"); //\\를 /로 대체 
				//let originPath = obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName;  //위 2줄대신 바로 사용해도 됨
				
				str += "<div class='card col-md-4'>";
				str += "<div class='card-body'>";
				str += "<p class='mx-auto' style='width:90%;' title='"+ obj.fileName + "'" ;
				str +=  "data-path='"+obj.uploadPath +"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";				
				str += "<img class='mx-auto d-block' src='../car/display?fileName="+fileCallPath+"'>";
				str += "</p>";
				str += "<h4><span class='d-block w-50 mx-auto badge badge-secondary badge-pill' data-file='"+fileCallPath+"' data-type='image'> &times; </span></h4>";
				str += "</div></div>";
			}
			else {
				let fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
					
				str += "<div class='card col-md-4'>";
				str += "<div class='card-body'>";
				str += "<p class='mx-auto' style='width:90%;' title='"+ obj.fileName + "'" ;
				str +=  "data-path='"+obj.uploadPath +"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
				str += "<img class='mx-auto d-block' src='../images/attach.png' >";
				str += "</p>";
				str += "<h4><span class='d-block w-50 mx-auto badge badge-secondary badge-pill' data-file='"+fileCallPath+"' data-type='file'> &times; </span></h4>";
				str += "</div></div>";
			}
			uploadUL.append(str);
		});		
	}
});

</script>
</body>
</html>	
```
</details>

<details>
	<summary>register_car.jsp</summary>

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 

<title>Insert title here</title>

<style>
.card img {
	width : 200px;
	height : 200px;
}
</style>

</head>
<body>

<%@ include file="../include/header.jspf" %>

<div class="container mt-5 mb-5 pl-0" id="content">
	<div class="row">
		<div class="col-md-30">
			<div class="col-md-20">
				<div id="submain">
					<br/><br/>
					<br/><br/>
				
					<!-- 파일 첨부 창 (추가) -->
					<div class="attach mt-5">
						<h1 class="text-center threeDEffect text-success mb-5">파일 업로드!</h1>
						<div class="row">
						
							<div class="form-group uploadDiv col-md-12">
								<label for="upload">&nbsp;&nbsp;&nbsp;&nbsp;FileUpload</label>
								<!-- 라벨의 for는 html 요소와 라벨 요소를 연결하는데 사용되는 속성,
								 -->
								<input type="file" class="form-control" id="upload" name="uploadFile" multiple="multiple"/>
							</div>
						</div>
					
					<!-- 업로드 된 파일의 결과를 보여 줄 창 (추가) -->
					<div class="uploadResult mt-5">
						
						<div class="row" id="card">
						</div>
					</div>
					
					<h3 class="text-center multiEffect text-success">게시글 (매물) 등록</h3>
		
				<form action="register_car" method="post" id="freg" name="freg" role="form" enctype="multipart/form-data">
					
					<div class="form-group">
						<label for="writer">작성자 : </label>
						<input type="text" class="form-control" id="writer" name="writer" placeholder="Writer" required="required">
					</div>
				
					<div class="form-group">
						<label for="title">제목 : </label>
						<input type="text" class="form-control" id="title" name="title" placeholder="Title" required="required">
					</div>
				
					<div class="form-group">
						<label for="content">내용 : </label>
						<textarea class="form-control" id="content" rows="10" name="content" required="required"></textarea>
					</div>
					
					<br/><br/>
					
					<div class="form-group">
						<label for="carName">차량명 : </label>
						<input type="text" class="form-control" id="carName" name="carName" placeholder="carname" required="required">
					</div>
				
					<div class="form-group">
						<label for="carType">차종 : </label>
						<input type="text" class="form-control" id="carType" name="carType" placeholder="cartype" required="required">
					</div>
					
					<div class="form-group">
						<label for="carYear">연식 : </label>
						<input type="text" class="form-control" id="carYear" name="carYear" placeholder="caryear" required="required">
					</div>
				
					<div class="form-group">
						<label for="carPrice">금액 : </label>
						<input type="text" class="form-control" id="carPrice" name="carPrice" placeholder="carprice" required="required">
					</div>
					
					<div class="form-group">
						<label for="carDate">등록일 : </label>
						<input type="text" class="form-control" id="carDate" name="carDate" placeholder="cardate" required="required">
					</div>
				
					<div class="form-group">
						<label for="fuel">연료 : </label>
						<input type="text" class="form-control" id="fuel" name="fuel" placeholder="fuel" required="required">
					</div>
				
					<div class="form-group">
						<label for="disp">배기량 : </label>
						<input type="text" class="form-control" id="disp" name="disp" placeholder="disp" required="required">
					</div>
				
					<div class="form-group">
						<label for="kilos">키로수 : </label>
						<input type="text" class="form-control" id="kilos" name="kilos" placeholder="kilos" required="required">
					</div>
					
					<div class="form-group">
						<label for="mission">변속기 : </label>
						<input type="text" class="form-control" id="mission" name="mission" placeholder="mission" required="required">
					</div>
				
					<button type="submit" class="btn btn-success">작성</button>&nbsp;&nbsp;
					<button type="reset" class="btn btn-danger">취소</button>&nbsp;&nbsp;
					<a id="listLink" href="list_car" class="btn btn-primary">목록보기</a>
				
				</form>
				
					<!-- 테스트용 첨부파일 창 -->
					<!--  
					<form action="uploadFormAction" method="post" enctype="multipart/form-data">
						<input type="file" name="uploadFile" multiple="multiple">
					</form>
					-->

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	let formObj = $("form[role='form']"); //게시글 등록
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //확장자를 지정 해둔것은 업로드를 제한 한다. 
	let maxSize = 5242880; //5MB, 파일의 최대 크기를 지정
	
	let uploadUL = $(".uploadResult #card");
	
	$("button[type='submit']").on("click", function(e){ //게시글 작성시 submit 버튼
		e.preventDefault();
	
		if(confirm("작성하시겠어요?")){
			alert("게시글 작성을 완료 하였습니다.");
		} else {
			alert("작성을 취소 합니다.");
		}
		
		console.log("submit clicked");
		
		let str = "";
		
		$(".uploadResult .card p").each(function(i, obj){
			
			let jobj = $(obj);
			
			console.dir(jobj);
			console.log("-----------");
			console.log(jobj.data("filename"));
			
			//List<BoardAttachVO> attachList;멤버변수로 수집됨
		      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
			
		      console.log(str);
		});
		formObj.prepend(str).submit();
	});
	
	$("input[type='file']").change(function(e){			
		let formData = new FormData(); //가상의 form엘리먼트 생성
		let inputFile = $("input[name='uploadFile']");
		let files = inputFile[0].files; 
		//첫번째 inputFile DOM의 files들 type이 file인경우 선택한 파일들(value값)
		console.log(files);
			
		for(var i = 0; i < files.length; i++)  {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}			
			formData.append("uploadFile", files[i]); 
			 //선택한 파일들을 input type="file" name="uploadFile" value="files[i]"로 만들어 붙이기
		}		
		
		$.ajax({
			url: '../car/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',				    
		    dataType : 'json', //생략해도 무방	
		  //beforeSend: function(xhr) { 
		    //      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    //},	
			success : function(result) {
				console.log(result);
				//List<AttachFileDTO>가 결과로 옴
				showUploadResult(result);
				$("#upload").val(""); //파일 입력창 초기화
			},
			error : function() {
				alert("ajax upload failed");
			}
		});
	});
	
	$(".uploadResult").on("click", "span", function(e) { // 삭제 x클릭
		console.log("delete file");
		      
	    let targetFile = $(this).data("file"); //삭제 파일 경로
		let type = $(this).data("type");
		
		let targetLi = $(this).closest(".card");
		
		$.ajax({
			//url: '../upload/deleteFile?${_csrf.parameterName}=${_csrf.token}',
			url : '../car/deleteFile',
		    data: {fileName: targetFile, type:type},
		    dataType:'text',
		    type: 'POST',		    
		    //beforeSend: function(xhr) {
		    //      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    //},		    
		    success: function(result){		             
		           targetLi.remove();
		    }
		}); 
	});
	
	function checkExtension(fileName, fileSize) {
		
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
		    return false;
		}
		if(regex.test(fileName)) {
			 alert("해당 종류의 파일은 업로드할 수 없습니다.");
		     return false;
		}
		return true;
	}
	
	function showUploadResult(uploadResultArr) {
		
		if(!uploadResultArr || uploadResultArr.length == 0)
			return;		
				
		$(uploadResultArr).each(function(i, obj) {
			let str ="";
			if(obj.image) {
				
				let fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);				
				str += "<div class='card col-md-4'>";
				str += "<div class='card-body'>";
				str += "<p class='mx-auto' style='width:90%;' title='"+ obj.fileName + "'" ;
				str +=  "data-path='"+obj.uploadPath +"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";						
				str += "<img class='mx-auto d-block' src='../car/display?fileName="+fileCallPath+"'>";						
				str += "</p>";
				str += "<h4><span class='d-block w-50 mx-auto badge badge-secondary badge-pill' data-file='"+fileCallPath+"' data-type='image'> &times; </span></h4>";				
				str += "</div></div>";				
			}
			else {
				
				let fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
				let fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");				
				str += "<div class='card col-md-4'>";
				str += "<div class='card-body'>";	
				str += "<p class='mx-auto' style='width:90%;' title='"+ obj.fileName + "'" ;
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' >";
				str += "<img class='mx-auto d-block' src='../images/attach.png' >";				
				str += "</p>";
				str += "<h4><span class='d-block w-50 mx-auto badge badge-secondary badge-pill' data-file='"+fileCallPath+"' data-type='file'> &times; </span></h4>";
				str += "</div></div>";		
			}
			uploadUL.append(str);
		});		
	}
});
</script>

</body>
</html>
```
</details>


## CarrotMarket - 중고차 직거래 - 실행 화면
<details>
  <summary>접기 & 상세보기</summary><br><br>
  
  <summary>메인</summary><br>

  - CarrotMarket 메인 화면 입니다.
  
  ![carrotmarket_메인](https://github.com/itrecipe/carrotmarket_project/assets/40875025/0459cb81-e3bb-44f4-81bc-2209f6e12ddc)

  <summary>로그인</summary><br>

  ![carrotmarket_로그인](https://github.com/itrecipe/carrotmarket_project/assets/40875025/8915a1f1-ae69-45a8-8c2a-f48b08a2c27e)

  <summary>회원가입</summary><br>
  
  ![carrotmarket_회원가입](https://github.com/itrecipe/carrotmarket_project/assets/40875025/6409ab06-9c6e-4c82-a8ef-abff16012c26)

  <summary>중고차 직거래_메인</summary><br>
  - 메인 화면 상단은 BS4의 케러셀을 이용하였으며, 상품이 노출될 아래 페이지에는 이미지 리스트 형식으로 구현하였습니다.<br>
  - 케러셀 기능 하단에 "게시글 등록" 창으로 이동하여 매물 등록을 할 수 있도록 구현 하였습니다.<br><br>
  
  ![carrotmarket_중고차직거래_메인](https://github.com/itrecipe/carrotmarket_project/assets/40875025/b3a0177b-b698-461f-abd3-e2a2cfae7114)

  <summary>중고차 직거래_게시글 등록 & 파일 업로드</summary><br>
  - 게시글 등록을 할 수 있는 페이지이며, 파일(사진) 업로드와 함께 수행 할 수 있도록 구현 되었습니다.<br><br>

  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/90b9a6be-1d6f-4858-bc18-3eb2a192e69d)

  <summary>중고차 직거래_상세보기(1)</summary><br>
  - 게시글 상세보기 페이지 입니다.<br>
  - 차량 등록에 필요한 정보들을 모두 입력하도록 구현 되었습니다.<br>
  - 아래쪽에 현재 매물의 위치를 알 수 있도록 카카오맵 api를 사용하여 구현 하였습니다.<br>
  - 댓글 기능이 구현 되어 있으나, 현재 미완성 입니다. (현재 작업 중)<br><br>
  
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/67d84119-9246-4d6f-b327-abf305f63231)
  
  <summary>중고차 직거래_상세보기(2)</summary><br>
  
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/6da0c9ce-45bb-416a-a7a5-6b5446fc0e05)
  
  <summary>중고차 직거래_상세보기(3)</summary><br>
  
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/ed88f0c5-8859-4eff-bf58-74b2d3f9b5e0)

  
  <summary>중고차 직거래_수정</summary><br>
  - 수정 버튼을 누르면 alert창이 뜨며 확인을 누를시 수정 페이지로<br>
  이동하게 되고, 취소를 누르면 종료가 되도록 구현하였습니다.<br><br>

  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/be801a1b-b0f6-4c2e-abc7-3e8ea0d5e484)
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/0ace3eda-8c50-453b-92fb-db0e30200cf5)
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/b30eb2ac-ec6f-45eb-904d-f5d3042f9904)
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/f2d234e4-ab08-47a0-8a3a-081d4b9c139c)

  <summary>중고차 직거래_삭제</summary><br>
  - 삭제 버튼도 수정 버튼과 동일하게 누르면 alert창이 뜨면서 삭제<br>
  처리가 수행되고, 취소를 누르면 해당 작업이 종료 되도록 구현 되어 있습니다.<br><br>  
  
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/d6e6eb03-5d32-49ab-aaf2-4758b28f7870)

</details>

## 프로젝트 종료 후 (느낀점 & 아쉬운점)
<details>
<summary>느낀점</summary>
학습을 통해 많은 웹 개발에 필요한<br>
기술을 습득하였지만, 아직 한참 배울게 많고 멀었다는 생각과 부족함을<br>
동시에 느끼게 되는 프로젝트였습니다.<br>
더 학습에 매진하고 정진하며 꾸준히 깃허브와 학습 블로그에 기록을 남기며<br>
갈고 닦도록 해야겠습니다.<br>
</details>

<details>
<summary>아쉬운점</summary>
Spring Security와 댓글, 대댓글 기능을 구현 해보려고 계획 헀으나,<br>
시간안에 못해낸것이 많은 아쉬움이 남습니다.<br>
공부를 게을리 하지 않기 위해, 향후 추가 구현 계획 중입니다.<br><br>
</details>

- 처음으로 작업해본 프로젝트이며 처음으로 만들어본 ReadMe 파일이라<br>
  많이 초라하고 부족하지만 읽어봐 주신 분들께 감사 드립니다.<br> -itrecipe-
