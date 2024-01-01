<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <head>
    <title>고객지원</title>
    <style>
    
        body{
            background-color:#FFFAFD;
                 
        }
       
        li{
            list-style:none;
        }
        .side{
            background-color: #ddd;
            width:300px;
            height:500px;
            text-align: center;
            margin-left: 50px;
            margin-top:200px;
            margin-right: 100px;
        }
        .side>li{
            padding:20px;
        }
        a{
            text-decoration: none;
            color:black;
        }
        .board>div>li{
            margin-left:20px;
            margin-right:20px;
            text-align:center;
            min-width:100px;
        }
        #subject{
            min-width:220px;
            margin-left:20px;
            margin-right:20px;
            white-space: nowrap;
			overflow:hidden;
            text-overflow:ellipsis;
        }
        .board{
            border:2px solid gray;               
        }
        .board>div{
            display: flex;
            justify-content:space-between;
            
            border-bottom:2px solid #ddd;
            padding:10px;
            margin-left:20px;
            margin-right:20px;
        }
        .most-question{
            border:2px solid gray;
            margin-bottom:50px;
        }
        .most-question>li{
            border-bottom:2px solid #ddd; 
            padding:10px;
            padding-left:70px;
            margin-left:20px;
            margin-right:20px;
        }
        article{
            flex:1;
            margin-right:100px;	
        }
        .paging{
            margin-top:30px;
            text-align:center;
        }
        main{
            display:flex;
           	flex-direction:row;
           	justify-content:center;
        }
        a:hover{transform:scale(1.2);}
        
        .page{height:50px;}
	 
		.page li{
			float:left;height:40px;line-height: 40px;padding:10px;
		}
		#cs{font-size:1.2em;}
    </style> 
</head>

<body>
    <main>
        <aside class="side">   
            <img style="margin-top:30px;"src="https://cdn.discordapp.com/attachments/1173898314333311017/1174511819189145642/image.png?ex=6567dc5f&is=6555675f&hm=55b79a73f8198c84355bb144fa909f46166d47932ab6aca6ca1e83196d1a92d3&">
            <li><a href="/customer/customerWrite" id="cs"><b>문의글 쓰기</b></a></li>
            <li><a href="/customer/myquestion" id="cs">나의 문의사항</a></li>
        </aside>
        <article>
            <h2 style="margin-top:100px; margin-bottom:70px;"> 문의사항</h2> 
            <div>총문의수 : ${pVO.totalRecord }개</div>
                <div class="board">
                    <div>
                        <li><b>문의유형</b></li>
                        <li id="subject"><b>제목</b></li>
                        <li><b>작성자</b></li>
                        <li><b>등록일</b></li>
                    </div>

                  	
                        <c:forEach var="customerVO" items="${list}">
                            <div>
                            <li>${customerVO.type}</li>
                            <li id="subject"><a href="/customer/customerView?no=${customerVO.no}&nowPage=${pVO.nowPage}">${customerVO.subject}</a></li>
                            <li>${customerVO.userid}</li>
                            <li>${customerVO.writedate}</li>
                        	</div>
                        </c:forEach>
                   	
              
	      <div class="page">
			<ul>
				<c:if test="${pVO.nowPage==1}">
					<li>prev</li>
				</c:if>
				<c:if test="${pVO.nowPage>1 }">
					<li><a href="/customer/customerMain??nowPage=${pVO.nowPage-1 }">prev</a></li>
				</c:if>
				
				
				
				<c:forEach var="p" begin="${pVO.startPage }" end="${pVO.startPage+pVO.onePageCount-1 }">
					<c:if test="${p<=pVO.totalPage }">
						<c:if test="${p==pVO.nowPage }">
							<li style="background-color: #ddd">
						</c:if>
						
						<c:if test="${p!=pVO.nowPage }">
							<li>
						</c:if>
							<a href="/customer/customerMain?nowPage=${p }">${p }</a></li>
					</c:if>
				</c:forEach>
				
				<!-- next page -->
				<c:if test="${pVO.nowPage<pVO.totalPage }">
					<li><a href="/customer/customerMain?nowPage=${pVO.nowPage+1 }">next</a></li>
				</c:if>
				<c:if test="${pVO.nowPage>=pVO.totalPage }">
					<li>next</li>
				</c:if>
			</ul>
		</div>
	   </article>
    </main>
 </body>   
