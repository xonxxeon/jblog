<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>
	
<!-- Date Format taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
	prefix="fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<style>

	main.contents{
		margin: 0;
		padding: 0;
		width: calc(100vw - 218px);
	}

	#lb{
		border: 0;
	}
	
	.blog{
		margin:0 auto;
	}
	
	#postul{
		width: 70%;
		margin: 1px auto;
	}
	
	
	#comments{
		width: 70%;
		margin: 5px auto;
	}
	
	#combt, #comnm {
		color: black;
	}
	
	#combt{
	float: right;
		text-align: right;
	}
	
	#comnm {
		font-weight: bold;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/blogHeader.jsp" />
	<jsp:include page="/WEB-INF/views/includes/blogNav.jsp" />
	
	<main class="contents">
	
	<section id="mainposts">
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h3 class="display-4">
			<c:if test="${ empty mainPost }">
				<h6>등록된 글이 없습니다.</h6>
			</c:if>
			<h3>${mainPost.postTitle}</h3>
		</h3>
	    <p class="lead">
			<c:if test="${ empty mainPost }">
			</c:if>
			<h6>${mainPost.postContent}</h6>
		</p>
	  </div>
	</div>
	</section>
	
	<c:if test="${ not empty mainPost }">
	<section id="comments">
	
	<c:if test="${ empty authUser }">
		<div class="input-group mb-3">
		  <input type="text" class="form-control" placeholder="로그인 후 코멘트 작성이 가능합니다." aria-label="Recipient's username" aria-describedby="basic-addon2">
		  <div class="input-group-append">
		    <span class="input-group-text" id="basic-addon2">X</span>
		  </div>
		</div>
	</c:if>
	<c:if test="${ not empty authUser }">
	<form id="addcmt" 
					class="addcmt"
					name="addcmt" 
					method="POST" 
					action="<c:url value="/addcmt" />" >
		<input type="hidden" name="userNo" value="${ authUser.getUserNo() }">
		<input type="hidden" name="id" value="${ authUser.getId() }">
		<input type="hidden" name="cateNo" value="${ mainPost.cateNo }">
		<input type="hidden" name="postNo" value="${ mainPost.postNo }">
		<input type="hidden" name="blogId" value="${ id }">
		
		<div class="input-group mb-3">
		  <input type="text" class="form-control" name="cmtContent" placeholder="댓글을 입력해 주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
		  <div class="input-group-append">
		    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">댓글작성</button>
		  </div>
		</div>
	</form>
	</c:if>
	
	<c:if test="${ empty cmt }">
	</c:if>
	<table class="table">
	  <tbody>
	  	<c:forEach items="${ cmt }" var="cmt">
		    <tr>
		      <th scope="row">${ cmt.userName }</th>
		      <td>${ cmt.cmtContent }</td>
		      <td><fmt:formatDate value="${ cmt.regDate }" pattern="yyyy-MM-dd"/></td>
		      <td>
		      	<c:if test="${ authUser.getUserNo() == cmt.userNo }">
				<form id="delComment" class="delComment"
						name="delComment" method="POST" action = "<c:url value="/delcmt"/>" >
					<input type="hidden" name="userNo" value="${ authUser.getUserNo() }">
					<input type="hidden" name="id" value="${ authUser.getId() }">
					<input type="hidden" name="cateNo" value="${ mainPost.cateNo }">
					<input type="hidden" name="postNo" value="${ mainPost.postNo }">
					<input type="hidden" name="blogId" value="${ id }">
					<input type = "hidden" name = "cmtNo" value = ${ cmt.cmtNo } />
					<input type = "submit" value = "삭제" />
				</form>
				</c:if>
			  </td>
		    </tr>
		 </c:forEach>
	  </tbody>
	</table>
	
	</section>
	</c:if>
	
	
	<br><br>
	
	<section id="mainlists">
	<c:forEach items="${ mainList }" var="vo">
		<c:if test="${ not empty vo.postTitle }">
			<ul class="list-group" id="postul">
			  <li class="list-group-item d-flex justify-content-between align-items-center">
			    <form method="POST" action="${ pageContext.request.contextPath }/${id}" >
					<input type = "hidden" type="number" name = "postNo" value = ${ vo.postNo } />
					<input type = "hidden" type="number" name = "cateNo" value = ${ vo.cateNo } />
			  		<input type="submit" id="lb" class="list-group-item" value="${vo.postTitle }">
			  	</form>
			    <span class="badge badge-primary badge-pill"><fmt:formatDate value="${ vo.regDate }" pattern="yyyy-MM-dd"/></span>
			  </li>
			</ul>
		</c:if>
	</c:forEach>
	</section>
		
	</main>
	
	<jsp:include page="/WEB-INF/views/includes/blogFooter.jsp" />
	
</body>
</html>