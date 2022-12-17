<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="container">
	<div class="content">
	<h3 align="center" style="color: #ffc107; margin-top:50px;">회원정보 수정</h3>
	<input type="hidden" name="id" id="id" value="${mlist.id }" />
	<div class="form-group mt-5 mb-3">
		<label for="username">아이디:</label> 
		<input type="text" id="username" name="username" class="form-control" placeholder="Enter ID" value="${mlist.username}"/>
	</div>
	<div class="form-group mb-3">
		<label for="pass">비밀번호:</label> 
		<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
	</div>
	<div class="form-group mb-3">
		<label for="pass">비밀번호 확인:</label> 
		<input type="password" class="form-control" id="passcheck" placeholder="Enter passcheck" name="passcheck">
	</div>
	<div class="form-group mb-3">
		<label for="pass">이름:</label> 
		<input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="${mlist.name }">
	</div>
	<div class="form-group mb-3">
		<label for="email">이메일:</label> 
		<input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="${mlist.email }">
	</div>
	<div class="form-group mb-3 col-3">
		<label for="birthday">생년월일:</label> 
		<div id="birth">
		<select name="year" id="year" class="form-control mr-sm-1"></select>년
		<select name="month" id="month" class="form-control mr-sm-1"></select>월
		<select name="day" id="day" class="form-control mr-sm-1"></select>일
		</div>
	</div>

	<div class="form-group mb-3">
		<label for="tel">전화번호:</label> 
		<input type="text" class="form-control" id="phone" placeholder="Enter tel" name="phone" value="${mlist.phone }">
	</div>
	<br />

	<div class="d-grid gap-2">
		<button type="button" class="btn btn-outline-warning btn-block" id="btnUpdate">수정</button>
		<button type="button" class="btn btn-outline-warning btn-block" id="btnDel">회원탈퇴</button>
	</div>
</div>
</div>

<script>
$(document).ready(function(){            
    var now = new Date();
    var year = now.getFullYear();
    var month = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    $("#year  > option[value="+year+"]").attr("selected", "true");        
    $("#month  > option[value="+month+"]").attr("selected", "true");    
    $("#day  > option[value="+day+"]").attr("selected", "true");       
})

$("#btnUpdate").click(function(){
	data = {
		"id" : $("#id").val(),
		"username":$("#username").val(),
		"password":$("#password").val(),
		"name":$("#name").val(),
		"email":$("#email").val(),
		"birth":$("#year").val()+$("#month").val()+$("#day").val(),
		"phone":$("#phone").val()	
	}
	$.ajax({
		type:"put",
		url:"/update",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp){
		if(resp=="success"){
			alert("회원 정보 수정을 완료하였습니다.")
			location.href="/list"
		}else if(resp=="fail"){
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요")
			$("#password").val("")
			$("#passcheck").val("")
		}
	})
	.fail(function(){
		alert("회원정보 수정에 실패하였습니다")
	})
})
$("#btnDel").click(function(){
	if(!confirm("정말 탈퇴할까요?")) return
	$.ajax({
		type:'delete',
		url:'/delete/${mlist.id}',
		success:function(resp){
			if(resp=="success"){
				alert("캠핑고 회원 탈퇴 완료. 그동안 이용해주셔서 감사합니다.")
				location.href="/list"
			}
		},
		error:function(){
			alert("회원 탈퇴 실패:"+e)
		}
	})
})
</script>
<%@ include file="../includes/footer.jsp"%>
