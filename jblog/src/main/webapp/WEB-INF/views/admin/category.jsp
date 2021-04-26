<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- jQuery -->
<script src="<c:url value="/assets/javascript/jquery/jquery-3.6.0.js" /> "></script>

<!-- 스크립트 삽입 -->
<script src="<c:url value="/assets/javascript/users.js" /> "></script>


<style>
	td{
		color: black;
	}
	
	.cate-cont{
		margin: 10px;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/blogHeader.jsp" />
	<jsp:include page="/WEB-INF/views/includes/adminNav.jsp" />
	
	<br>
	<div class="cate-cont">
	
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">카테고리명</th>
		      <th scope="col">포스트 수</th>
		      <th scope="col">설명</th>
		      <th scope="col">삭제</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${ list }" var="vo">
			<tr>
				<td scope="row">${ vo.cateNo }</td>
				<td>${ vo.cateName }</td>
				<td>
					<c:if test="${ vo.postCount == null }">
						0
					</c:if>
					${ vo.postCount }
				</td>
				<td>${ vo.description }</td>
				<td><form id="delCate" class="delCate"
						name="delCate" method="POST" action = "<c:url value="/delCate"/>" 
						onsubmit="return checkPost(this)">
							<input type="hidden" name="postCount" value="
							<c:if test="${ vo.postCount == null }">
								0
							</c:if>
							${ vo.postCount }
							" />
							<input type="hidden" name="userNo" value="${vo.userNo }" />
							<input type = "hidden" name = "cateNo" value = ${ vo.cateNo } />
							<input type = "submit" value = "삭제" />
						</form></td>
				</tr>
			</c:forEach>
			<!-- /Loop -->
		  </tbody>
		</table>
	
	<br>

	<h5>새로운 카테고리 추가</h5>
	<form id="addCate" 
					class="addCate"
					name="addCate" 
					method="POST" 
					onsubmit="return checkAddCate(this)"
					action="<c:url value="/addCate" />" >
		
		<input type="hidden" name="userNo" value="${ authUser.getUserNo() }">
		<input type="hidden" name="id" value="${ authUser.getId() }">
		
		
		<div class="form-group">
		    <label for="cateName">카테고리명</label>
		    <input type="text" class="form-control" name="cateName" id="cateName">
		 </div>
		<div class="form-group">
		    <label for="description">설명</label>
		    <input type="text" class="form-control" name="description" id="description">
	    </div>
		  <button type="submit" class="btn btn-secondary">카테고리 추가</button>
					
	</form>
	
	</div>
	
	<jsp:include page="/WEB-INF/views/includes/blogFooter.jsp" />
	
</body>
</html>