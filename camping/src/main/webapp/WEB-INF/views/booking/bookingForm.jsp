<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="container mt-5">
<h3>캠핑장 예약하기</h3>
<form action="/reserve" method="get">
	<div class="container mt-5 mb-5 bg-light">
	<h4>캠핑장 정보</h4>
		<div class="form-group">
		<label for="camp_title">캠핑장 이름 : </label>
		<input type="text" class="form-control" id="camp_title" name="camp_title" placeholder="Enter camp_title">
		</div>
		<div class="form-group">
		<label for="camp_title">캠핑장 주소 : </label>
		<input type="text" class="form-control" id="address" name="address" placeholder="Enter address">
		</div>
		<div class="form-group">
		<label for="camp_title">캠핑장 전화번호 : </label>
		<input type="text" class="form-control" id="camp_tel" name="camp_tel" placeholder="Enter camp_tel">
		</div>
		<div class="form-group">
		<label for="checkin">체크인 :</label>
		<input type="date" class="form-control" id="checkin" name="checkin" placeholder="Enter checkin">
		</div>
		<div class="form-group">
		<label for="checkout">체크아웃 :</label>
		<input type="date" class="form-control" id="checkout" name="checkout" placeholder="Enter checkout">
		</div>
	</div>
	<hr>
	<div class="container mt-5 mb-5 bg-light">
	<h4>예약자 정보</h4>
		<div class="form-group">
		<label for="username">예약자 성함 : </label>
		<input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
		</div>
		<div class="form-group">
		<label for="userTel" >예약자 연락처 :</label>
		<input type="text" class="form-control" id="userTel" name="userTel" placeholder="Enter userTel">
		</div>	
	</div>
	<hr>
	<div class="container mt-5 bg-light">
	<h4>결제 정보</h4>
		<div class="form-group">
		<label for="price">결제금액 : </label>
		<input type="text" class="form-control" id="price" name="price" placeholder="Enter price">
		</div>
		<div class="form-group">
		<label for="payment" >결제수단 :</label>
		<input type="text" class="form-control" id="payment" name="payment" placeholder="Enter payment">
		</div>	
	</div>
	<div class="container" >
	<div class="form-group text-right pt-5">
	<button class="btn btn-secondary">예약하기</button>
	</div>
	</div>
</form>
</div>
<%@ include file="../includes/footer.jsp"%>

