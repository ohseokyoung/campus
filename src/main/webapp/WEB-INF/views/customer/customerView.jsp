<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>

    <style>
        main {
            display: flex; 
        }

        body {
            background-color: #FFFAFD;         
        }

        li {
            list-style: none;
        }

        .side {
            background-color: #ddd;
            width: 300px;
            height: 500px;
            text-align: center;
            margin-left: 50px;
            margin-top: 100px;
            margin-right: 100px;
        }

        .side>li {
            padding: 20px;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .board>div>li {
            margin-left: 20px;
            margin-right: 20px;
            text-align: center;
            min-width: 100px;
        }

        #subject {
            min-width: 220px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .board {
            border: none;                 
        }

        .board>div {
            display: flex;
            justify-content: space-between;
            border-bottom: 2px solid #ddd;
            padding: 10px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input,
        select,
        textarea {
            display: block;
            width: 100%; 
            padding: 10px;
            box-sizing: border-box;
            resize: none;
        }
		/*button {
            display: block;
            width: 10%;
            padding: 10px;
            background-color: #004E6d;
            color: white;
            border: none;
            cursor: pointer;
        }*/

        article {
            flex: 1;
            margin-right: 100px;
        }

        .q{
            margin-top:0px;
            max-width:1000px;
            min-width:500px;
            border : 3px solid darkgray;
            min-height:300px;
        }
        .q>li{
            padding:10px;
        }
        .a{
            max-width:1000px;
            min-width:500px;
            min-height:200px;
            border:3px solid darkgray;
            margin-top:50px;
        }
        .a>li{
            padding:10px;
        }
		.ed{display:flex; justify-content:right;}
		.ed>a:first-of-type{margin-right:30px;}
		.ed>a:hover{color:orange;}
		button{width:100px; background:orange;cursor:pointer;}
    </style> 

</head>

<body>
    
    <main>
        <aside class="side">   
            <img style="margin-top:30px;" src="https://cdn.discordapp.com/attachments/1173898314333311017/1174511819189145642/image.png?ex=6567dc5f&is=6555675f&hm=55b79a73f8198c84355bb144fa909f46166d47932ab6aca6ca1e83196d1a92d3&">
            <li><a href="/customer/customerWrite"><b>문의글 쓰기</b></a></li>
            <li><a href="/customer/customerMain">문의사항 메인</a></li>
            <li><a href="/customer/myquestion">나의 문의사항</a></li>
        </aside>
        
        <article>
        	<h2 style="margin-top:50px;"> 문의 글 보기</h2>
            <div class="q">
                <li>문의유형 : ${vo.type }</li>
                <li>제목 : ${vo.subject }</li>
                <li>작성자 :${vo.userid }</li>              
                <hr>
                <li>${vo.content }</li>
            </div>
            <div class="ed">
            	<c:if test="${vo.userid==logId }">
					<a href="/customer/customerEdit?no= ${vo.no }">수정</a>
					<a href="javascript:customerDel('${vo.no }')">삭제</a>
				</c:if>
            </div>
            
            <c:if test="${manager=='Y'}">
            	<div><button onclick="javascript:answer('${vo.no}')">문의 답변하기</button></div>
            </c:if>
            
            <div class="a">
                <li>${vo.reply}</li>
                <!--  <li>고객님 안녕하세요, stn인포텍 담당자 입니다. 먼저 이용에 불편을 드려 죄송합니다.<br/><br/>
                고객님께서 문의주신 문의 생성을 눌러도 생성이 되지 않고 페이지가 넘어가는 문제를 현재 확인중에 있습니다.<br/><br/>
                빠르게 검토 후 수정하여 차후 이용에 불편함이 없도록 노력하겠습니다. 감사합니다.</li>-->
            </div>
        </article>
    </main>
</body>

<script>
   function customerDel(data){
	if(confirm("글을 정말로 삭제하시겠습니까?")){
		location.href="/customer/delete?no="+ data;
	}else{
		return false;
	}
}
   function answer(data){
	   if(confirm("문의 답변 작성하시겠습니까?")){
		   	var replyWindow = window.open("/customer/replyForm", "replyForm", "width=500, height=400, resizable=yes, scrollbars=yes");
			var replyForm = '<div id="replyForm" style="width:100%; height:100%;">문의답변 폼';
			replyForm += '<form method="post" action="/campus/customer/replyOk" id="replyForm">'
		   	replyForm += '<textarea name="reply" style="width:100vh; height:60vh;"></textarea>'
		   	replyForm += '</br><input type="submit" value="답변하기"/>'
		   	replyForm += '<input type="hidden" name="no" value="' + data + '"/></form></div>'
		   	
		   	replyWindow.document.write(replyForm);
		   	
			// submit 처리하고 창닫기
	        $(replyWindow.document).ready(function () {
	            $(replyWindow.document).find("#replyForm").submit(function (event) {
	                
	                event.preventDefault();
	               
	                $(this).unbind('submit').submit();
	               
	                replyWindow.close();
	            });
	        });

	    } else {
	        return false;
	    }
	}

</script>
</html>