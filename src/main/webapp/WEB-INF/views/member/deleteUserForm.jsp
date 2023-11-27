<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//이벤트 연결
	$('#delete_form').submit(function(){
		let items = document.querySelectorAll('input[type="text"],input[type="passwd"],input[type="email"]');
		for(let i=0; i<items.length; i++){
			if(items[i].value.trim()==''){				
			let label = document.querySelector('label[for="'+items[i].id+'"]');
			alert(label.textContent + '항목은 필수 입력');
			items[i].value='';
			items[i].focus();
			return false;
			}
		}
		
		if($('#passwd').val()!=$('#cpasswd').val()){
			alert('새비밀번호 확인이 불일치');
			$('#passwd').val('').focus();
			$('#cpasswd').val(''); //불일치하면 공간에 입력한 값 지우기
			return false;
		}
	});
});
</script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-main">
		<h2>회원탈퇴</h2>
		<form action="deleteUser.do" method="post" id="delete_form">
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" maxlength="12">
				</li>
				<li>
					<label for="email">이메일</label>
					<input type="email" name="email" id="email" maxlength="50">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" name="passwd" id="passwd" maxlength="12">
				</li>
				<li>
					<label for="cpasswd">비밀번호 확인</label>
					<input type="password" id="cpasswd" maxlength="12"> <%-- 전송하지 않으려면 name을 명시안하면 됨 --%>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="회원탈퇴">
				<input type="button" value="My페이지" onclick="location.href='myPage.do'">
			</div>
		</form>
	</div>
</div>
</body>
</html>