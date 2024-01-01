<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.dataList{overflow:auto; height:50vh;}
	.dataList>li{
		width:10%; height:40px;line-height: 40px;border-bottom: 1px solid #ddd; float: left;
	}
	.dataList>li:nth-child(5n+2) {
		width:60%;	
	}
</style>

<main>
	<h1>자료실 글목록</h1>
	<!-- 로그인 상태일때 -->
	<c:if test="${logStatus=='Y' }">
	<div>
		<a href="/data/write" style="color:orange; font-size:1.5em;">자료올리기</a>
	</div>
	</c:if>
	
	<!-- 글목록 -->
	<ul class="dataList">
		<li>번호</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>조회수</li>
		<li>등록일</li>
		
		<c:forEach var="dVO" items="${list }">
			<li>${dVO.no}</li>
			<li><a href="/data/view/${dVO.no }">${dVO.subject }</a></li>
			<li>${dVO.userid}</li>
			<li>${dVO.hit}</li>
			<li>${dVO.writedate}</li>
		</c:forEach>
	</ul>
	
</main>