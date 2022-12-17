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
					          <button type="button" class="btn btn-sm btn-outline-secondary">Like</button>
					          <button type="button" class="btn btn-sm btn-outline-secondary">0</button>
				          </div>
			          </div>
	          </div>
          </div>
        </div>
      </div>
    </div>
 </div>
</c:forEach>


<%@ include file="../includes/footer.jsp"%>