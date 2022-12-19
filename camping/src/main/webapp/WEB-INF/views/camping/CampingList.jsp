<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/camping/common.jsp"%>


<c:forEach items="${clist}" var="product" varStatus="i">       
<div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-3 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col-sm-3">
          <div class="card">
	          <c:forEach items="${product.picture}" var="pic" >
	           <a href="/detail/${product.camp_id}"><img class="card-img-top img" data-src="${i.count}" src="/image/${pic.pic_name}" alt="Card image" style="width:100%;height:300px"></a> 
	          </c:forEach>
  
	          <div class="card-body">
		          <h4>${product.camp_title}</h4>
		          <p class="card-text">${product.address}</p>
			          <div class="d-flex justify-content-between align-items-center">
				          <div class="btn-group">
				          <div id="likeDiv">
					          <button type="button" id="likeBtn" data-mid="${product.camp_id}" class="btn btn-sm btn-outline-secondary">Like</button>
					          <button type="button" class="btn btn-sm btn-outline-secondary" id="count">0</button>
					       </div>
				          </div>
			          </div>
	          </div>
          </div>
        </div>
      </div>
    </div>
 </div>
</c:forEach>

<script>
// 좋아요 버튼 클릭
	$("#likeDiv").on("click", "#likeBtn", function(){
		var count = 0;
		$.ajax({
			type:'get',
			url : '/like/insert',
			data:{"id" : ${principal.member.id},
				"camping" : $(this).data('mid')}
		})
		.done(function(resp){
			count++;
			count = document.getElementById("count").value;
		})
		.fail(function(e){
			
		})
	}) // likeDiv
</script>

<%@ include file="../includes/footer.jsp"%>