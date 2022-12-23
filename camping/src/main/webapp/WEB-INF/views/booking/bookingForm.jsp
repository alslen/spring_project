<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<div class="container mt-5">
<h3>캠핑장 예약하기</h3>
<form action="/booking/reserve" method="post">
	<div class="container mt-5 mb-5 bg-light">
	<input type="hidden" name="camping" id="camping" value="${bookList.camp_id}">
	<input type="hidden" name="member" id="member" value="${principal.member.id}">
	<h4>캠핑장 정보</h4>
		<div class="form-group">
		<label for="camp_title">캠핑장 이름 : </label>
		<input type="text" class="form-control" id="camp_title" name="camp_title" placeholder="Enter camp_title" value="${bookList.camp_title}">
		</div>
		<div class="form-group">
		<label for="camp_title">캠핑장 주소 : </label>
		<input type="text" class="form-control" id="address" name="address" placeholder="Enter address" value="${bookList.address}">
		</div>
		<div class="form-group">
		<label for="camp_title">캠핑장 전화번호 : </label>
		<input type="text" class="form-control" id="camp_tel" name="camp_tel" placeholder="Enter camp_tel" value="${bookList.camp_tel}">
		</div>
		<div class="form-group">
		<label for="checkin">체크인 :</label>
		<input type="text" class="form-control" id="check_in" name="check_in" placeholder="Enter checkin">
		</div>
		<div class="form-group">
		<label for="checkout">체크아웃 :</label>
		<input type="text" class="form-control" id="check_out" name="check_out" placeholder="Enter checkout">
		</div>
		<button type="button"  class="btn btn-secondary" id ="btnReserve" onclick="show();">예약확인</button>
	</div>
	<hr>
	<div class="container mt-5 mb-5 bg-light">
	<h4>예약자 정보</h4>
		<div class="form-group">
		<label for="username">예약자 성함 : </label>
		<input type="text" class="form-control" id="name" name="name" placeholder="Enter name" value="${principal.member.name}">
		</div>
		<div class="form-group">
		<label for="userTel" >예약자 연락처 :</label>
		<input type="text" class="form-control" id="userTel" name="phone" placeholder="Enter phone" value="${principal.member.phone}">
		</div>	
	</div>
	<%-- <hr>
	<div class="container mt-5 bg-light">
	<h4>결제 정보</h4>
		<div class="form-group">
		<label for="price">결제금액 : </label>
		<input type="text" class="form-control" id="price" name="price" placeholder="Enter price" value="${bookList.price}">
		</div>
		<div class="form-group">
		<label for="payment" >결제수단 :</label>
		<input type="text" class="form-control" id="payment" name="payment" placeholder="Enter payment">
		</div>	
	</div> --%>
	
	<div class="container" >
	<div class="form-group text-right pt-5">
	<button class="btn btn-secondary" id="reserveBtn">예약하기</button>
	</div>
	</div>
</form>
</div>
<script >

$("#check_in").datepicker({
	 dateFormat: 'yy-mm-dd',
});

$("#check_out").datepicker({
	 dateFormat: 'yy-mm-dd',
});

let openWin;
	function show(){
	 	window.open("/full-calendar/calendar/${camp_id}","calendar","width=700,height=600,top10,left=10")
	}
</script>
<%@ include file="../includes/footer.jsp"%>

