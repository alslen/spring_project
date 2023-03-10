<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ include file="../includes/header.jsp"%>
<%@ include file="/WEB-INF/views/user/menuBar.jsp"%>
<link href="/css/score.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4eeebc573cb6c8b6d05d232c6bf107d1&libraries=services"></script>

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
<input type="hidden" name="camp_id" id="camp_id" value="${camp.camp_id}">

	<div style="line-height:55px;">
		<div style="float:left; vertical-align:middle; margin-top:10px;">
			<h2 style="font-weight:bold;">${camp.camp_title}</h2>
	</div>
	
	<div style="text-align:right; float:right; vertical-align:middle;">
		<c:if test="${principal.username==null }">
			<a class="text-dark" style="text-decoration-line: none;" id="like_check">
				<img id="likeImg" src="/img/heart-fill.png">
			</a>
		</c:if>
		<c:if test="${like==0}">
			<a class="text-dark" style="text-decoration-line: none;" id="like_check">
				<img id="likeImg" src="/img/heart-fill.png">
			</a>
		</c:if>
		<c:if test="${like==1}">
			<a class="text-dark" style="text-decoration-line: none;" id="like_check">
				<img id="likeImg" src="/img/heart.png">
			</a>
		</c:if>
		<span id="likeCnt">${camp.likeCnt }</span>
	</div>
</div>
<div style="clear:both;"></div>

<hr>
<div class="container">
	<div style="float:left;" >
	<div id="demo" class="carousel mt-3" data-bs-ride="carousel">
	  	<!-- Indicators/dots -->
	  	<div class="carousel-indicators">
		<c:forEach var="pic" items="${camp.picture}" varStatus="i">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="${i.index}" <c:if test="${i.index == 0}"> class="active"</c:if> ></button>
		</c:forEach>
		</div>
	
	    <!-- The slideshow/carousel -->
		<div class="carousel-inner">
		    <c:forEach var="pic" items="${camp.picture}" varStatus="i">
				<div class="carousel-item  <c:if test="${i.index == 0}">active</c:if>" style="width:500px; height:370px;">
		        	<img class="top-img rounded d-block w-100" src="/image/${pic.pic_name}" style="object-fit: cover; width:500px; height:100%;">
		        </div>
			</c:forEach>
		</div>
	
		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev" style="float:left">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next" style="float:right">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	</div>

	<div style="float:right; width:500px; position: relative; top:40px;padding:20px; border: 1px solid gray;">
		<table class="table table-borderless medium_text" style="text-align: center; font-size:14px;">
			<tr>
				<td><strong>??????</strong></td>
				<td>${camp.address}</td>
			</tr>
			<tr>
				<td><strong>????????????</strong></td>
				<td>${camp.camp_tel}</td>
			</tr>
			<tr>
				<td><strong>?????????</strong></td>
				<td>15:00</td>
			</tr>
			<tr>
				<td><strong>????????????</strong></td>
				<td>11:00</td>
			</tr>
			<tr>
				<td><strong>??????</strong></td>
				<td>${camp.price}???</td>
			</tr>
		</table>
		<button  type="button" class="btn btn-outline-warning btn-block" id ="btnReserve">????????????</button>	
	</div>
</div>
</div>

<div class="container" >
  <ul class="tabs" style="margin-top:430px;">
    <li class="tab-link current" data-tab="tab-1">????????????</li>
    <li class="tab-link" data-tab="tab-2">??????</li>
    <li class="tab-link" data-tab="tab-3">??????</li>
  </ul>
  	<div id="tab-1" class="tab-content current">
  		?????? : ${camp.address}
		<div id="map" style="width:100%;height:350px;"></div>
  	</div>
  	<div id="tab-2" class="tab-content">${camp.room_info }</div>
  
  <div id="tab-3" class="tab-content">
  		<div class="container" >
  		<sec:authorize access="isAuthenticated()">
  		<form class="mb-3" name="myform" id="myform" method="post">
	<fieldset>
		<span class="text-bold">????????? ??????????????????</span>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">???</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">???</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">???</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">???</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">???</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" type="text" id="msg" placeholder="????????? ???????????????."></textarea>
	</div>
	<br>
	<div style="float:right">
	<button style=" display: inline-block;" type="button" class="btn btn-outline-warning btn-block" id="btnComment">????????????</button>
	</div>
</form>		
</sec:authorize>
<br>
		<h3>??????(<span id="reviewCnt"></span>)</h3><br>
		<div id="reviewResult"></div>
		<br>
		</div>
  </div>
  <br>
  <c:if test="${principal.member.role == 'ROLE_ADMIN' }">
  <div>
  	<button type="button" class="btn btnCamp" id="btnUpdate">??????</button>
  	<button type="button" class="btn btnCamp" id="btnDelete">??????</button>
  </div>
  </c:if>
</div>

<script>
$("#btnReserve").click(function(){
	if("${principal.member.id}" == null){
		alert('???????????? ????????????.')
	}
	
	location.href="/booking/book/${camp.camp_id}";
})

 
 
//????????? ????????? ?????? ??? ???????????? ??????
$("#likeImg").on("click", function () {
    $.ajax({
        url: '/camping/like',
        type: 'post',
        data:{'camping': ${camp.camp_id}, 'id': ${principal.member.id}},
        success: function (resp) {
            if (resp == 1) {
                $("#likeImg").attr("src", "/img/heart.png");
            } else{
                $("#likeImg").attr("src", "/img/heart-fill.png");
            }
            like();
            //$("#likeCnt").html(${camp.likeCnt});
        }, error: function () {
            console.log('?????? ????????????')
        }

    });  // ajax
});  // likeImg

var like = function(){
	$.ajax({
		type:'get',
		url:"/camping/likeCnt/${camp_id}"
	})  // ajax
	.done(function(resp){
		$("#likeCnt").text(resp);
	})  // done
}

like();

// ?????? ??????
var mapContainer = document.getElementById('map'), // ????????? ????????? div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
        level: 3 // ????????? ?????? ??????
    };  

// ????????? ???????????????    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// ??????-?????? ?????? ????????? ???????????????
var geocoder = new kakao.maps.services.Geocoder();
// ????????? ????????? ???????????????
geocoder.addressSearch('${camp.address}', function(result, status) {
    // ??????????????? ????????? ??????????????? 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // ??????????????? ?????? ????????? ????????? ???????????????
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // ?????????????????? ????????? ?????? ????????? ???????????????
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">????????? ??????</div>'
        });
        infowindow.open(map, marker);
        // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
        map.setCenter(coords);
    } 
});    

// ????????? ??????
$("#btnUpdate").click(function(){
	location.href="/camping/update/${camp.camp_id}";
})

// ????????? ??????
$("#btnDelete").click(function(){
	if(!confirm('?????? ?????????????????????????')) return false;
	$.ajax({
		type:'delete',
		url:'/camping/delete/${camp.camp_id}',
		success:function(resp){
			alert("?????????????????????.")
			location.href="/list"
		},
		error:function(e){
			alert("?????? ??????")
		}
	})
})

//?????? ??????
$("#btnComment").click(function(){
	if($("#msg").val()==''){
		alert("??????????????????.")
		return
	}
	var data = {
			"camp":$("#camp_id").val(),
			"content":$("#msg").val(),
			"score":$("input[name=reviewStar]:checked").val()
	}
	$.ajax({
		type:'post',
		url:'/review/insert/'+$("#camp_id").val(),
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp){
		alert("????????? ??????????????????.")
		init();
	})
	.fail(function(){
		alert("?????? ?????? ??????")
	})
})  // btnComment


// ?????? ?????????
var init = function(){
	$.ajax({
		type:'get',
		url:'/review/list/'+$("#camp_id").val()
	}) // ajax
	.done(function(resp){
		var str = "";
		var innerHtml = "";
		$.each(resp.rlist, function(key,val){
			str += "<h4>"+val.member.username+"</h4>"
			if(val.score==5) {
				for(i=0; i<val.score; i++)
					str += "<img src='/img/y_star.png'/>"
			}
			else if(val.score == 4) {
				for(i=0; i<val.score; i++) str += "<img src='/img/y_star.png'/>"
				for(i=0; i<5-val.score; i++) str += "<img src='/img/star.png'/>"
			}
			else if(val.score == 3) {
				for(i=0; i<val.score; i++) str += "<img src='/img/y_star.png'/>"
				for(i=0; i<5-val.score; i++) str += "<img src='/img/star.png'/>"
			}
			else if(val.score == 2) {
				for(i=0; i<val.score; i++) str += "<img src='/img/y_star.png'/>"
				for(i=0; i<5-val.score; i++) str += "<img src='/img/star.png'/>"
			}
			else if(val.score == 1) {
				for(i=0; i<val.score; i++) str += "<img src='/img/y_star.png'/>"
				for(i=0; i<5-val.score; i++) str += "<img src='/img/star.png'/>"
			}
			else {
				for(i=0; i<5; i++) str += "<img src='/img/star.png'/>"
			}
			str += "<p>"+val.reviewDate+"</p>"
			str += val.content
			if("${principal.member.id}"== val.member.id) {
				str += "<br><div style='text-align:right'>"
				//str += "<button type='button' class='btn btn-info' onclick='commentUpdate("+val.reviewNum,val.content+")'>????????????</button> "
				str += "<button type='button' class='btn btnCamp' onclick='commentDelete("+val.reviewNum+")'>????????????</button>"
				str += "</div>"
			}
			
			str += "<br><hr><br>"
		})
		$("#reviewResult").html(str);
		$("#reviewCnt").text(resp.count);
	}) // done
}  // init

// ?????? ??????

function commentDelete(reviewNum){
	if(!confirm('?????? ?????????????????????????')) return false;
	
	$.ajax({
		type:'delete',
		url:'/review/delete/'+reviewNum
	})
	.done(function(resp){
		alert("????????? ?????????????????????.")
		init()
	})
	.fail(function(e){
		alert("?????? ?????? ??????")
	})
}
	
// ?????? ?????????
/* function commentUpdate(reviewNum,content){
	var str = "";
	str += "<div>"
	str += "<textarea class='col-auto form-control' type='text' id='msg'>content</textarea>"
	str += "</div>"
}
 */
init();
 
	//let openWin;
	//function show(){
	 		//window.open("/full-calendar/calendar/${camp_id}","calendar","width=700,height=600,top10,left=10")
		//}
</script>





