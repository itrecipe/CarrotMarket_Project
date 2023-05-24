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

<!-- 캐러셀 영역 -->
<div id="carouselExampleCaptions" class="carousel slide carousel-dark w-75 m-auto" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active w-70 m-auto">
      <img src="../images/qm6.jpg" class="d-block w-80 m-auto" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1>최근 인기 매물 중형 SUV - TOP1</h1>
        <p>Renault Korea - THE NEW QM6</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="../images/스포티지.png" class="d-block w-80 m-auto" alt="...">
      <div class="carousel-caption d-none d-md-block">
     	<h1>최근 인기 매물 준중형 SUV - TOP2</h1>
        <p>KIA - Sportage</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="../images/xc90.jpg" class="d-block w-80 m-auto" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h1>최근 인기 매물 준중형 SUV - TOP3</h1>
        <p>안전함에 끝판왕! Volvo - xc90</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- 리스트 영역 -->
<main>
  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <img alt="qm6" width="300" height="300" src="../images/qm6.jpg">
            <title>Placeholder</title>
            <!-- <rect width="100%" height="50%" fill="#55595c">
             <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail
            </text>
            </rect> -->
            </svg>

            <div class="card-body">
              <p class="card-text">qm6</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Album example</h1>
        <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
        <p>
          <a href="#" class="btn btn-primary my-2">Main call to action</a>
          <a href="#" class="btn btn-secondary my-2">Secondary action</a>
        </p>
      </div>
    </div>
  </section>
</main>

<!-- 게시글  -->
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
											<!-- jquery로 페이지 이벤트 처리 전 -->
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
						<div>
							<button type="button" class="btn btn-primary float-right mb-3"
								id="regBtn">게시물 등록</button>
						</div>
					</div>
				</div>
			</div>
			
			<script>
			$(document).ready(function(){
				let result = '<c:out value="${result}"></c:out>';
				console.log("result : " + result);
				
				history.replaceState({}, null, null);
				//현재 히스토리를 전부 비운다
				
				$("#regBtn").on("click", function(){
					self.location = "register_car";
				});
			});
			</script>
<%@ include file="../include/footer.jspf"%>
</body>
</html>