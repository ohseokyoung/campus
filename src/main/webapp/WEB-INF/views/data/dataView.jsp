<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function dataDel(){
		if(confirm("자료실 글을 삭제하시겠습니까?")){
			location.href="/data/del/${vo.no}";
		}
	}
</script>
<style>
	#cnt{height:60vh; border:1px solid #ddd;}
	#files, a:hover{color:orange; margin-top:200px;}
</style>
<main>
	<h1>자료실 글 내용 보기</h1>
	<ul>
		<li>번호 : ${vo.no }</li></br>
		<li>작성자 : ${vo.userid }</li></br>
		<li>조회수 : ${vo.hit }</li>
		<li>등록일 : ${vo.writedate }</li></br>
		<li>제목 : ${vo.subject }</li>
		<div id="cnt">
		<li>글내용 <br/>  ${vo.content }</li>
		<li id="files">첨부파일:
			<c:forEach var="f" items="${fileList }">
				<a href="$/uploadfile/${f.filename}" download>${f.filename}</a></br>
			</c:forEach>
		</li>
		</div>
	</ul>
	<div>
		<c:if test="${logStatus=='Y' && logId==vo.userid }">
			<a href="/data/edit/${vo.no}">수정</a>
			<a href="javascript:dataDel()">삭제</a>
		</c:if>
	</div>
</main>