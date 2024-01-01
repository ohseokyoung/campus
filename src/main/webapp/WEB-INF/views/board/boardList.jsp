<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	#boardTop>div{
		float: left; width: 50%;
	}
	#boardTop{height:50px;}
	#boardTop>div:last-of-type {
	 text-align: right;
	}
	#boardList{overflow: auto; height:50vh;}
	#boardList>li{
		float: left;height:40px;line-height: 40px; border-bottom: 1px solid #ddd;width: 10%;
	}
	#boardList>li:nth-child(5n+2) {
		width:60%;
		white-space: nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.page{height:40px;}
	 
	.page li{
		float:left;height:40px;line-height: 40px;padding:10px;
	}
	.search{
		text-align: center;
	}
}
</style>

<script>
	function searchCheck(){
		if(document.getElementById("searchWord").value==""){
			alert("검색어를 입력후 검색하세요..");
			return false;
		}
	}
</script>

<main>
	<h1>게시판 목록</h1>
	<c:if test="${logStatus!=''&&logStatus=='Y' }">
		<div><a href="/board/write" style="color:orange; font-size:1.5em;">글쓰기</a></div>
	</c:if>
	<div id="boardTop">
		<div>총레코드수 : ${pVO.totalRecord }개</div>
		<div>현재 페이지: ${pVO.nowPage }/${pVO.totalPage }</div>
	</div>
	<ul id="boardList">
		<li>번호</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>조회수</li>
		<li>등록일</li>
		
		<c:forEach var="bVO" items="${list}">
			<li>${bVO.no}</li>
			<li><a href="/board/view?no=${bVO.no }&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">${bVO.subject}</a></li>
			<li>${bVO.userid}</li>
			<li>${bVO.hit}</li>
			<li>${bVO.writedate}</li>
		
		</c:forEach>
		
	</ul>
	
	<div class="page">
		<ul>
			<!-- 현재 보는 페이지를 기준으로 이전페이지 표시 -->
			
			<c:if test="${pVO.nowPage==1}">
				<li>prev</li>
			</c:if>
			<c:if test="${pVO.nowPage>1 }">
				<li><a href="/board/list?nowPage=${pVO.nowPage-1 }<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">prev</a></li>
			</c:if>
			
			
			<c:forEach var="p" begin="${pVO.startPage }" end="${pVO.startPage+pVO.onePageCount-1 }">
				<c:if test="${p<=pVO.totalPage }">
					<c:if test="${p==pVO.nowPage }">
						<li style="background-color: #ddd">
					</c:if>
					<c:if test="${p!=pVO.nowPage }">
						<li>
					</c:if>
					<a href="/board/list?nowPage=${p }<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">${p }</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${pVO.nowPage<pVO.totalPage }">
				<li><a href="/board/list?nowPage=${pVO.nowPage+1 }<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">next</a></li>
			</c:if>
			<c:if test="${pVO.nowPage>=pVO.totalPage }">
				<li>next</li>
			</c:if>
		</ul>
	</div>
	<div class="search">
		<form method="get" action="/board/list" onsubmit="return searchCheck()">
			<select name="searchKey" style="height:20px;">
				<option value="subject">제목</option>
				<option value="content">글내용</option>
				<option value="userid">글쓴이</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" />
			<input type="submit" value="search" />
		</form>
	</div>
	
	
	
	
</main>