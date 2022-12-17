<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="container">
	<div class="d-flex justify-content-center">

		<form action="/login" method="post" id="frm">
			<br /> <br />
			<div class="d-flex justify-content-center">
				<img src="../img/logo2.jpg" height="200" width="200" alt="My Image">
			</div>
			<br /> <br />
			<div class="form-group">
				<label for="username"></label> <input type="text" id="username"
					name="username" class="form-control" placeholder="Enter ID" />
			</div>
			<br />
			<div class="form-group">
				<label for="pass"></label> <input type="password"
					class="form-control" id="password" placeholder="Enter pass"
					name="password">
			</div>
			<br />
			<div class="d-grid gap-2">
				<button type="button" class="btn btn-outline-warning btn-block"
					id="btnlogin">로그인</button>
			</div>
		</form>
	</div>
</div>
<script>
	$("#btnlogin").click(function() {
		if ($("#username").val() == "") {
			alert("아이디를 입력하세요")
			$("#username").focus();
		}
		if ($("#password").val() == "") {
			alert("비밀번호 입력하세요")
			$("#password").focus();
			return false;
		}
		$("#frm").submit()
	})//btnjoin
</script>

<%@ include file="../includes/footer.jsp"%>