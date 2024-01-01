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
	
	$(function(){


		$(document).on('click',"input[value=' + ']",function(){

			$(this).parent().parent().append('<div><input type="file" name="filename"/><input type="button" value=" + "/></div>'); //방금일어난 이벤트의 부모의 부모 즉  li안에 추가

			$(this).val(' - ');
		});

		$(document).on('click',"input[value=' - ']",function(){
			$(this).parent().remove();
		})
		
		$("#dataForm").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요.");
				return false;
			}

			let fileCount=0;
			$("input[name=filename]").each(function(){	
				if($(this).val()!=""){
					fileCount++;
				}
			});
			
			if(fileCount<1){
				alert("1개이상의 파일을 첨부하여야 합니다.");
				return false;
			}

			return true;
		});
	});
</script>

<main>
<h1>자료 올리기 폼</h1>
	<!-- file첨부가 있는 form태그는 시작태그에  enctype속성(enctype="multipart/form-data")이 반드시 있어야 함. -->
	<form method="post" id="dataForm"  action="/data/writeOk" enctype="multipart/form-data">
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject"></li>
			<li>글내용</li>
			<li><textarea name="content" id="content"></textarea></li>
			
			<!-- 첨부파일 -->
			<li>첨부파일</li>
			<li>
				<div><input type="file" name="filename"/><input type="button" value=" + "/></div>
			</li>
			
			
			<li style="padding-top:10px;">
				<input type="submit" value="자료올리기"/>
				<input type="reset" value="다시쓰기"/>
			</li>
		</ul>
	</form>
</main>
