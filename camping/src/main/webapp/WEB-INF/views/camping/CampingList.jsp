<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/camping/common.jsp"%>

<style>
h2 {
    border-bottom: 1px solid gray;
    padding-bottom: 10px;
    margin:0 auto;
    padding:0 auto;
}
</style>

<!-- 일반 리스트 -->
<div class="container">
<c:forEach items="${clist}" var="product" varStatus="i">       
      <div class="row" style="width:350px; margin:10px; float:left; ">
        <div class="col-sm-3">
          <div class="card" style="border:1px solid grey; width:300px; height:410px;">
          	<div style="width:300px;height:300px;">
	          <c:forEach items="${product.picture}" var="pic" begin="0" end="0">
	           <a href="/detail/${product.camp_id}"><img class="card-img-top img" data-src="${i.count}" src="/image/${pic.pic_name}" alt="Card image" style="width:298px; height:298px;"></a> 
	          </c:forEach>
  			</div>
	        <div class="card-body">
		          <h4>${product.camp_title}</h4>
		          <p class="card-text">${product.address}</p>
	        </div>
          </div>
        </div>
      </div>
</c:forEach>
</div>


<!--  좋아요가 많은 순(3개출력) -->
<div class="container" style="magin:0px;padding:0px;">
<h2>Hot</h2>
<br>
<c:forEach items="${likeList}" var="product" begin="0" end="2">       
      <div class="row" style="width:350px; margin:10px; float:left; ">
        <div class="col-sm-3">
          <div class="card" style="border:1px solid grey; width:300px; height:410px;">
          	<div style="width:300px;height:300px;">
	          <c:forEach items="${product.picture}" var="pic" begin="0" end="0">
	           <a href="/detail/${product.camp_id}"><img class="card-img-top img" data-src="${i.count}" src="/image/${pic.pic_name}" alt="Card image" style="width:298px; height:298px;"></a> 
	          </c:forEach>
  			</div>
	        <div class="card-body">
		          <h4>${product.camp_title}</h4>
		          <p class="card-text">${product.address}</p>
	        </div>
          </div>
        </div>
      </div>
</c:forEach>
</div>


<!-- 새로 등록한 캠핑장(3개출력) -->
<div class="container">
<h2>New</h2>
<br>
<c:forEach items="${campNew}" var="product" begin="0" end="2">       
      <div class="row" style="width:350px; margin:10px; float:left; ">
        <div class="col-sm-3">
          <div class="card" style="border:1px solid grey; width:300px; height:410px;">
          	<div style="width:300px;height:300px;">
	          <c:forEach items="${product.picture}" var="pic" begin="0" end="0">
	           <a href="/detail/${product.camp_id}"><img class="card-img-top img" data-src="${i.count}" src="/image/${pic.pic_name}" alt="Card image" style="width:298px; height:298px;"></a> 
	          </c:forEach>
  			</div>
	        <div class="card-body">
		          <h4>${product.camp_title}</h4>
		          <p class="card-text">${product.address}</p>
	        </div>
          </div>
        </div>
      </div>
</c:forEach>
</div>


<div style="clear:both;"></div>
<%@ include file="../includes/footer.jsp"%>