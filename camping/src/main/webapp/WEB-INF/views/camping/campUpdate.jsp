<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="../includes/header.jsp"%>

<div class="container">
	<div class="content">
	<h3 align = "center" style="color:#ffc107; margin-top:50px;">캠핑장 수정</h3>
	<form action="/insert" method="post" enctype="multipart/form-data" id="frm">
	<input type="hidden" name="camp_id" id="camp_id" value="${camp.camp_id }">
	<div class="form-group  mt-5 mb-3">
		<label for="campTitle">캠핑장 명칭:</label>
		<input type="text" class="form-control" id="camp_title" name="camp_title" placeholder="Enter campTitle" value="${camp.camp_title}"/>
	</div>
	<div class="form-group mb-3">
		<label for="campTel">캠핑장 전화번호:</label>
		<input type="text" class="form-control" id="camp_tel" name="camp_tel" placeholder="Enter camp_tel" value="${camp.camp_tel}"/>
	</div>
	<div class="form-group mb-3">
		<label for="address">캠핑장 주소:</label>
		<input type="text" class="form-control" id="address" name="address" placeholder="Enter address" value="${camp.address}"/>
	</div>
	<div>
		<label for="count">인원수:</label>
		<input type="number" min="0" max="100" class="form-control" id="count" name="count" placeholder="Enter count" value="${camp.count}"/>
	</div>
	<div class="form-group">
		<label for="price">가격:</label>
		<input type="text" class="form-control" id="price" name="price" placeholder="Enter price" value="${camp.price}"/>
	</div>
	<div class="form-group mb-3">
		<label for="campEmail">캠핑장 이메일:</label>
		<input type="text" class="form-control" id="camp_email" name="camp_email" placeholder="Enter campEmail" value="${camp.camp_email }"/>
	</div>
	<div class="form-group mb-3">
		<label for="master">대표자:</label>
		<input type="text" class="form-control" id="master" name="master" placeholder="Enter master" value="${camp.master}"/>
	</div>
	<div class="form-group">
		<label for="room_info">설명:</label>
		<textarea rows="3" cols="50" name="room_info" id="room_info" class="form-control">${camp.room_info}</textarea>
	</div>
	<div class="form-group mb-3">
		<label for="upload">캠핑장 사진:</label>
		<input multiple="multiple" type="file" class="form-control" id="upload" name="upload[]" placeholder="Enter File"/><br>
	</div>
	<div class="form-group mb-3">
		<label for="campId">종류:</label>
		<input type="radio" name="camp_category" value="1">카라반
		<input type="radio" name="camp_category" value="2">글램핑
		<input type="radio" name="camp_category" value="3">캠핑장
	</div>
	<div class="d-grid gap-2" >
		<button type="button" class="btn btn-outline-warning btn-block" id="updateBtn">수정하기</button>
	</div>
	</form>
	</div>
</div>

<script>
// 라디오 버튼 값 셋팅
$('input[name="camp_category"]').val(['${camp.camp_category}']);

$("#updateBtn").click(function(){
	if(!confirm('정말 수정하시겠습니까?')) return false;
	var data = {
			"camp_id" : $("#camp_id").val(),
			"camp_title" : $("#camp_title").val(),
			"camp_tel" : $("#camp_tel").val(),
			"address" : $("#address").val(),
			"count" : $("#count").val(),
			"price" : $("#price").val(),
			"camp_email" : $("#camp_email").val(),
			"master" : $("#master").val(),
			"room_info" : $("#room_info").val(),
			"camp_category" : $('input[name="camp_category"]:checked').val()
	}
	$.ajax({
		type:'put',
		url:'/camping/update',
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify(data),
		success:function(resp){
			alert("수정 되었습니다.")
			location.href="/list"
		},
		error:function(e){
			alert("수정을 실패하였습니다.")
		}
	})
})  // updateBtn
</script>

    
<%@ include file="../includes/footer.jsp"%>