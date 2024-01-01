<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#replyArea{
		padding:10px 0px;		
	}
	#coment{
		width: 600px;
		height: 80px;
	}
	#replyList>li{
		border-bottom:1px solid #ddd;
	}
	#cnt{
		height:60vh;
		border:1px solid #ddd;
		overflow:scroll;
	}
	a:hover{color:orange;}
</style>
<script>
	function boardDel(){
		if(confirm("글을 정말로 삭제하시겠습니까?")){
			location.href="/board/delete?no=${vo.no}";
		}
	}
	//ajax를 이용한 댓글등록, 수정, 삭제, 목록
	$(function(){
	
		function replyList(){
			$.ajax({
				url:'/boardReply/list',
				data:{no:${vo.no}},
				type:'GET',
				success:function(result){
					console.log(result);
					
					var tag="";//댓글목록 태그(수정, 삭제)
					
					$(result).each(function(i,rVO){
						tag +="<li><div><b>"+rVO.userid+"</b>("+rVO.writedate+")";
						
					
						if('${logId}'==rVO.userid){
							tag+="<input type='button' value='Edit'/>";
							tag+="<input type='button' value='Del' title='"+rVO.replyno+"'/>";
							
							tag+="<p>"+rVO.coment+"</p></div>"//댓글내용
							
							tag+="<div style='display:none'><form method='post'>";
							tag+="<input type='hidden' name='replyno' value='"+rVO.replyno+"'>";
							tag+="<textarea name='coment' style='width:400px;height:80px;'>"+rVO.coment+"</textarea>";
							tag+="<input type='submit' value='댓글수정하기'/>"
							tag+="</form></div>";
						}	
						else{
							tag+="<p>"+rVO.coment+"</p></div>"
						}
						tag+="</li>";
						
					});
					console.log(tag);
					$("#replyList").html(tag);
					
				},error:function(e){
					console.log(e.responseText);
				}
			});
		}
		//등록
		$("#replyForm").submit(function(){

			event.preventDefault();
			
			if($("#coment").val()==""){
				alert("댓글을 입력후 등록하세요..");
				return false;
			}
			
			var params=$(this).serialize();
			      
			$.ajax({
				url:"/campus/boardReply/write",
				data:params,
				type:"POST",
				success:function(result){
					console.log(result);
					$("#coment").val("");
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
			
		});
		
		//수정폼 보여주기
		$(document).on('click','#replyList input[value=Edit]',function(){ 
			$(this).parent().css('display','none');
			$(this).parent().next().css('display','block');
		});
		//수정(DB)
		$(document).on('submit','#replyList form',function(){
			event.preventDefault();
			var params=$(this).serialize();
			var url="/boardReply/editOk";
		
			$.ajax({
				url: url,
				data:params,
				type:"POST",
				success:function(result){
					console.log('댓글수정',result);
					if(result=='0'){
						alert("댓글이 수정 실패되었습니다.");
					}else{
						replyList();
					}
				},error:function(error){
					console.log(error.responseText);
				}
				
			});
			
		});
		//댓글삭제
		$(document).on('click','#replyList input[value=Del]',function(){
			if(confirm("삭제하시겠습니까?")){
				
				var replyno=$(this).attr("title");
				$.ajax({
					url:"/boardReply/delete",
					data:{
						replyno:replyno
					},
					type:"GET",
					success:function(result){
						replyList();
					},
					error:function(e){
						console.log(e.responseText)
					}
				
				});
			}
		
		});
		
		
		replyList();
	});
	
	
</script>
<main>
	<h1>글내용 보기</h1>
	<ul>
		<li>번호 : ${vo.no}, 글쓴이 : ${vo.userid },조회수 : ${vo.hit}, 등록일 : ${vo.writedate }</li><br/>
		<li>제목 : ${vo.subject }</li>
		<div id="cnt"><li>${vo.content }</li></div>
	</ul>
	
	<div>
		<a href="/board/list?nowPage=${pVO.nowPage }<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">목록</a>
		<!-- 현재 글쓴이와 로그인 아이디가 같을때만 수정,삭제 가능 -->
		<c:if test="${vo.userid==logId }">
			<a href="/board/edit?no=${vo.no }">수정</a>
			<a href="javascript:boardDel()">삭제</a>
		</c:if>		
	</div>
	<!-- 댓글 -->
	<div id="replyArea">
		
		<c:if test="${logStatus=='Y' }">
			
			<form method="post" id="replyForm" >
				
				<input type="hidden" name="no" value="${vo.no }"/>
				<textarea name="coment" id="coment"></textarea>
				<button>댓글등록</button>
			</form>
		</c:if>
		<!-- 댓글목록 -->
		<div style="background-color:#FFF3FE">댓글 목록</div>
		<ul id="replyList">
			<li>
				<div>
					<b>dig03208</b>(2023-10-10 12:12:23)
					<input type="button" value="Edit"/>
					<input type="button" value="Del"/>
					<p>댓글 테스트중....</p>
				</div>
			</li>
			<li>
				<div>
					<b>dig03208</b>(2023-10-10 12:12:23)
					<input type="button" value="Edit"/>
					<input type="button" value="Del"/>
					<p>댓글 공부중....33333333</p>
				</div>
			</li>
			
		</ul>
	</div>

	
	
</main>