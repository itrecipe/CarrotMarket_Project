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

</head>
<body>

<%@ include file="../include/header.jspf" %>

<div class="container mt-4 mb-4 pl-0" id="content">
	<div class="row">
	<div class="col-md-10">
		<form action="register_car" method="post" enctype="multipart/form-data" style="margin-top: 100px">
			
			<br/><br/>
			
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
				<label for="kilos">배기량 : </label>
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
			<!-- 첨부파일 창 -->
			<form action="uploadFormAction" method="post" enctype="multipart/form-data">
				<input type="file" name="uploadFile" multiple="multiple">
			</form>
			
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$("input[name='file']").on("change", function(){
		console.log("a");
		
		let formData = new FormData();
		let inputFile = $("input[name='file']");
		let files = inputFile[0].files;
		
		console.log("files");
		
		for(var i=0; i < files.length; i++) {
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '../upload/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				console.log(resut);
				
				showUploadResult(result);
				$("#upload").val("");
			},
			error : function() {
				alert("ajax upload failed");
			}
			
		});
	});
});	
</script>

</body>
</html>