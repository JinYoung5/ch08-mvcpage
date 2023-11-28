<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-main">
		<h2>게시판 목록</h2>
		<div class="list-space align-right">
			<input type="button" value="글쓰기" onclick="location.href='writeForm.do'"
				<c:if test="${empty user_num}">disabled="disabled"</c:if>
			>
		</div>
	</div>
</div>
</body>
</html>