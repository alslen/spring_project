<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/camping/common.jsp"%>

       
<c:forEach items="${clist}" var="product" varStatus="i">   
<c:if test="${product.camp_category == 3}"> <!-- 3:캠핑장 -->
<div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col">
          <div class="card shadow-sm">
          <c:forEach items="${product.picture }" var="pic" > 
          <div class="kind_wrap">
           <a href="/detail/${product.camp_id}"><img class="card-img-top" src="/image/${pic.pic_name}" alt="Card image" style="width:100%;height:300px"></a>
          </div> 
           </c:forEach>
           
            <div class="card-body">
              <h4>${product.camp_title }</h4>
              <p class="card-text">${product.address}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" onclick="" class="btn btn-sm btn-outline-secondary">Like</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">0</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
 </div>
 </c:if>
</c:forEach>


<%@ include file="../includes/footer.jsp"%>