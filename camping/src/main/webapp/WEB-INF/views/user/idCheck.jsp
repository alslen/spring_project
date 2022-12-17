<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<h2>아이디 중복확인</h2>
아이디 <input type="text" name="username" id="username" />
<button type="button" id="idUseBtn">사용</button>

<script>

$("#idUseBtn").click(function(){
	if($("#username").val()==""){
		alert("아이디를 입력하세요")
		return;
	}
	$.ajax({
		type:'post',
		url:'/idCheckPro',
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify({"username":$("#username").val()}),
		success:function(resp){
			if(resp == "success") {
				alert('사용 가능한 아이디입니다.')
				$(opener.document).find("#username").val($("#username").val())
				self.close()
			}else if (resp =="fail"){ 
				alert("사용 불가능한 아이디입니다.")
				$("#username").val('')
				$("#username").focus()
			}
		}
	})  // ajax
})  // idUseBtn
</script>