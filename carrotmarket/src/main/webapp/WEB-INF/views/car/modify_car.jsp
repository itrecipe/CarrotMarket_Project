<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../include/header.jspf" %>

<div class="container mt-4 mb-4" id="mainContent">
	<div class="row">
	<div class="col-md-2">
		<div class="col-md-10">
			<div id="submain">
				<h4 class="text-center text-success">게시글 내용</h4>
  				<form>
  				 	<div class="form-group">
  				 		<label for="cno">번호 : </label>
  				 		<input type="text" class="form-control" id="cno" name="cno" readonly
  				 			value='<c:out value="${car.cno}"/>' />
  				 	</div>
  				 	<div class="form-group">
  				 		<label for="title">제목 : </label>
  				 		<input type="text" class="form-control" id="title" name="title" readonly
  				 			value='<c:out value="${car.title}"/>' />
  				 	</div>
  				 	<div class="form-group">
  				 		<label for="writer">작성자 : </label>
  				 		<input type="text" class="form-control" id="writer" name="writer" readonly
  				 			value='<c:out value="${car.writer}"/>' />
  				 	</div>
  				 	<div class="form-group">
  				 		<label for="content">내용 : </label>
  				 		<textarea class="form-control" id="content" name="content" rows="10" >
  				 			<c:out value="${car.content}"/>
  				 		</textarea>
  				 	</div>
  				</form>
  				<button type="button" data-oper='modify_car' class="btn btn-info">수정</button>
  				&nbsp;&nbsp;
  				<button data-oper='list_car' class="btn btn-danger">목록</button>
  				
	  				<!-- 버튼 클릭을 처리하기 위해 form추가, 보이지 않게 설정해둠 -->
	  				<form id='operForm' action="modify" method="get">
	  					<input type="hidden" id="cno" name="cno"
	  						value='<c:out value="${car.cno}"/>'>
	  				</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	let formObj = $("#mform");
	
	$("button").on("click",function(e){
		e.preventDefault(); //이벤트가 일어난 버튼의 기본 동작을 제거
		let operation = $(this).data("oper");
		//data(data-의 뒷이름)메서드는 속성이 html5에 새롭게 추가된 data-속성값을 참조하여 값을 반환
		console.log("operation : "  + operation);
		if(operation == "remove") {
			formObj.attr("action","remove");
		}
		else if(operation == "list") {
			formObj.attr("action", "list").attr("method","get");	    
		}
		formObj.submit();
	});
	
});
</script>

<%@ include file="../include/footer.jspf" %>
</body>
</html>