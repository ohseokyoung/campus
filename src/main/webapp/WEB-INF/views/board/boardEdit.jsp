<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/ckeditor.css"/>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
<script src="/js/ckeditor.js"></script>
<style>
	#subject{width: 1000px;}
</style>
<script>
	window.onload=function(){
		CKEDITOR.ClassicEditor.create(document.getElementById("content"),option);
	}
	
	var boardCheck=function(){
		if(document.getElementById("subject").value==""){
			alert("제목을 입력하세요..");
			return false;
		}
		console.log(document.getElementById("subject").value);
		//값이 있으면 true, 없으면 false
		/* if(!document.getElementById("content").value){
			alert("글 내용을 입력하세요...");
			return false;
		}  */
		return true;
	}
</script>

<main>
<h1>글쓰기 수정 폼</h1>
	<form method="post" action="/board/editOk" onsubmit="return boardCheck()">
		<input type="hidden" name="no" value="${vo.no }"/>
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject" value="${vo.subject }"></li>
			<li>글내용</li>
			<li><textarea name="content" id="content">${vo.content }</textarea></li>
			<li>
				<input type="submit" value="글수정"/>
				<input type="reset" value="다시쓰기"/>
			</li>
		</ul>
	</form>
</main>
