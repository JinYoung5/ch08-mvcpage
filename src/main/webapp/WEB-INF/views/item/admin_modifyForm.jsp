<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#modify_form').submit(function(){
		let items = document.querySelectorAll('.input-check');
		for(let i=0; i<items.length; i++){
			if(items[i].value.trim()==''){
				
			let label = document.querySelector('label[for="'+ items[i].id +'"]');
			alert(label.textContent + ' 항목은 필수 입력');
			items[i].value = '';
			items[i].focus();
			return false;
			}
		}
	});
	//이미지 미리보기
	$('#photo1,#photo2').change(function(){
		let my_photo = this.files[0];
		let $item_photo = $(this).parent().find('.my-photo');
		if(!my_photo){
			$item_photo.attr('src','../upload/'+$item_photo.attr('data-img'));
			
			return;
		}
		if(my_photo.size > 1024*1024){
			alert(Math.round(my_photo.size/1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
			$item_photo.attr('src','../load/'+$item_photo.attr('data-img'));
			$(this).val(''); //선택한 파일의 경우 정보 삭제
			return;
		}
		let reader = new FileReader();
		reader.readAsDataURL(my_photo);
		
		reader.onload=function(){
			$item_photo.attr('src',reader.result);
		};
	});
});
</script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-main">
		<h2>상품 수정</h2>
		<form action="adminModify.do" method="post" enctype="multipart/form-data" id="modify_form">
			<input type="hidden" name="item_num" value="${item.item_num}">
			<ul>
				<li>
					<label>상품표시여부</label>
					<input type="radio" name="status" value="1" id="status1" <c:if test="${item.status ==1}">checked</c:if>>미표시
					<input type="radio" name="status" value="2" id="status2" <c:if test="${item.status ==2}">checked</c:if>>표시
				</li>
				<li>
					<label for="name">상품명</label>
					<input type="text" name="name" id="name" value="${item.name}" class="input-check" maxlength="10">
				</li>
				<li>
					<label for="price">가격</label>
					<input type="number" name="price" id="price" value="${item.price}" min="1" class="input-check" max="99999999">
				</li>
				<li>
					<label for="quantity">수량</label>
					<input type="number" name="quantity" id="quantity" value="${item.quantity}" class="input-check" min="0" max="99999">
				</li>
				<li>
					<label for="photo1">상품사진1</label>
					<img src="${pageContext.request.contextPath}/upload/${item.photo1}" data-img="${item.photo1}" width="50" class="my-photo">
					<br>
					<input type="file" name="photo1" id="photo1" class="form-notice" accept="image/gif,image/png,image/jpeg">
				</li>
				<li>
					<label for="photo2">상품사진2</label>
					<img src="${pageContext.request.contextPath}/upload/${item.photo2}" data-img="${item.photo2}" width="50" class="my-photo">
					<br>
					<input type="file" name="photo2" id="photo2" class="form-notice" accept="image/gif,image/png,image/jpeg">
				</li>
				<li>
					<label for="detail">상품설명</label>
					<textarea name="detail" id="detail" class="input-check" rows="5" cols="30">${item.detail}</textarea>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="수정">
				<input type="button" value="삭제" onclick="location.href='adminDelete.do?item_num=${item.item_num}'">
				<input type="button" value="목록" onclick="location.href='admin.do'">
			</div>
		</form>
	</div>
</div>
</body>
</html>