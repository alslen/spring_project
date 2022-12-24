<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<style>
    body {
        margin: auto;
        padding: 0;
        font-family:"맑은 고딕";
        font-size:0.8em;
	}

    ul#navi {
        width: 150px;
}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
}
    li.group {
        margin-bottom: 3px;
}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        background:#9ab92e;
        cursor:pointer;
}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
        background:#f4f4f4;
        cursor:pointer;
}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
}
    ul.sub li:hover {
        background:#cf0;
}
#navi {
    position: sticky;
    top: 100px;
    left: 100px;
    transition: margin-top 0.5s ease-in-out 0s;
    text-align:center;
    display: inline-block;
    width:200px;
    float:left;
}

/* 스크롤따라 움직임 */
</style>
<script>
    $(document).ready(function(){
 
        $(".sub").hide(); //모든 서브 메뉴 감추기
  init(0); //첫번째 메뉴 활성화
 
        $(".title").click(function(){
 
  //서브메뉴가 보이지않을겨우에만 동작실행(서브메뉴가 보이는 상태에서 동작되지 않게)
  if( $(this).next().css("display") == "none" ) {
//열린 서브메뉴에 대해서만 가립니다.
$(".sub").each(function(){
if($(this).css("display")=="block") {         
$(this).slideUp("fast");
}
});
 
$(this).next("ul").slideDown("fast");
//현재 클릭된 <div> 태그 다음의 <ul> 태그가 slideDown 으로 보여지게 된다.
} else {
return false;
}
        });    
 
});
 
//특정 서브메뉴를 활성화 시키는 함수
function init(n) {
$("li.group").eq(n).find("ul").show();
}
 
 
</script>

<sec:authorize access="isAuthenticated()">
<ul id="navi">
		<li class="group">
			<div class="title">마이페이지</div>
				<ul class="sub">
					<li><a href="/update/${principal.member.id }">회원정보 수정</a></li>
					<li><a href="/like/list/${principal.member.id }">찜한 캠핑장</a></li> 
					<li><a href="/booking/bookList/${principal.member.id }">내 예약보기</a></li>
				</ul>
		</li>
	<!-- 관리자만 볼수 있는 navi -->
	<c:if test="${principal.member.role == 'ROLE_ADMIN' }">
        <li class="group">
            <div class="title">관리자메뉴</div>
            <ul class="sub">
            	<li><a href="/insert">캠핑장 등록 폼</a></li>   
                <li><a href="/memberList">전체 회원리스트</a></li>
                <li><a href="/booking/adminList">전체 예약리스트</a></li>       
            </ul>
        </li>     
	</c:if>
</ul>
</sec:authorize>
