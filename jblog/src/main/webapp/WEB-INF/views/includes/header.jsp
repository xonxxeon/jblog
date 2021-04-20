<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
		prefix="c" %>
		
	<div id="logo">
			<img src="/WEB-INF/views/images/jblog.png" />
		</div>
		
		<div id="nav">
			<ul>
				<c:choose>
					<c:when test="${ empty authUser }">   <!-- authUser == null : 로그인 안함 -->
						<li><a href="<c:url value="/users/login" /> ">로그인</a></li>
						<li><a href="<c:url value="/users/join" /> ">회원가입</a></li>
					</c:when>
					<c:otherwise>	<!-- 로그인 한 상태 -->
						<li><a href="<c:url value="/users/logout" /> ">로그아웃</a></li>
						<li><a href="<c:url value="/users/join" /> ">내블로그</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<br>
		</div>