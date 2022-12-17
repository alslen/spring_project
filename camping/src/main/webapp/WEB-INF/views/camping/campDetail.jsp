<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ include file="../includes/header.jsp"%>
<style>

ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}

ul.tabs li.current{
  background: #ededed;
  color: #222;
}

.tab-content{
  display: none;
  padding: 15px;
  background-color:#ededed;
}

.tab-content.current{
  display: inherit;
}
textarea {
	border:1px solid gray;
}

</style>

<script>
$(document).ready(function(){
	  
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');

	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');

	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })

	})
</script>

<div class="container mt-5 mb-5">
<h2 style="font-weight:bold;">${camp.camp_title}</h2>
<hr>
	<div style="float:left; width:50%" >
	<div id="demo" class="carousel mt-3" data-bs-ride="carousel" style="">
	  	<!-- Indicators/dots -->
	  	<div class="carousel-indicators">
		<c:forEach var="pic" items="${camp.picture}" varStatus="i">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="${i.index}" <c:if test="${i.index == 0}"> class="active"</c:if> ></button>
		</c:forEach>
		</div>
	
	    <!-- The slideshow/carousel -->
		<div class="carousel-inner">
		    <c:forEach var="pic" items="${camp.picture}" varStatus="i">
				<div class="carousel-item  <c:if test="${i.index == 0}">active</c:if>">
		        	<img class="top-img rounded d-block w-100" src="/image/${pic.pic_name}" style="object-fit: cover;">
		        </div>
			</c:forEach>
		</div>
	
		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	</div>

	<div style="float:right; margin-right:10%; margin-bottom:300px;">
		<table class="table table-borderless medium_text" style="text-align: center;">
			<tr>
				<td><strong>주소</strong></td>
				<td>${camp.address}</td>
			</tr>
			<tr>
				<td><strong>전화번호</strong></td>
				<td>${camp.camp_tel}</td>
			</tr>
			<tr>
				<td><strong>체크인</strong></td>
				<td>15:00</td>
			</tr>
			<tr>
				<td><strong>체크아웃</strong></td>
				<td>11:00</td>
			</tr>
			<tr>
				<td><strong>가격</strong></td>
				<td>${camp.price}원</td>
			</tr>
		</table>
			
	</div>
</div>

<div class="container" >
  <ul class="tabs" style="margin-top:400px;">
    <li class="tab-link current" data-tab="tab-1">객실안내/예약</li>
    <li class="tab-link" data-tab="tab-2">숙소위치</li>
    <li class="tab-link" data-tab="tab-3">리뷰</li>
  </ul>
  <div id="tab-1" class="tab-content current">tab content1</div>
  <div id="tab-2" class="tab-content">tab content2</div>
  <div id="tab-3" class="tab-content">
  		<div class="container" style="vartical-align:top;">
  		<textarea rows="3" cols="20" id="msg"></textarea>
		<button type="button" class="btn btn-info" id="btnComment" style=" float:right; height:83px;">답글쓰기</button>
		</div>
  </div>
  
</div>




