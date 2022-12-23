<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
    body {
        margin:20px auto;
        padding: 0;
        font-family:"맑은 고딕";
        font-size:0.9em;
	}

    ul#navi {
        width: 200px;
        text-indent: 10px;
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
<ul id="navi">
        <li class="group">
            <div class="title">개인정보</div>
            <ul class="sub">
                <li><a href="/update/${principal.member.id }">회원정보 수정/탈퇴</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">찜목록</div>
            <ul class="sub">
                <li><a href="/like/list/${principal.member.id }">찜한 캠핑장</a></li>                
            </ul>
        </li>
        <li class="group">
            <div class="title">예약사이트</div>
            <ul class="sub">
                <li><a href="/booking/bookList/${principal.member.id}">예약정보</a></li>                
            </ul>
        </li>        
    </ul>