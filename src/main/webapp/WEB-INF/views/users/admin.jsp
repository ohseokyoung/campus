<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body{
            background:darkgray;
        }
        main{
            display:flex; 
            margin:0;
        }
        aside{
        	display: flex;
  			flex-direction: column;
            width:200px;
            height:85vh;
            text-align:left;
            align-items:left;
            border-right:1px solid gray;
        }
        aside>li{
         	display: inline-block;
            padding:10px;
            margin-top:20px;
        }
        
        .title{
            margin-top:50px; 
            margin-left:30px;
            font-size:1.5em;
            
        }
        .stats{
            display:flex;
            text-align:center;
            padding:50px;

        }
        .stats_1{
            background-color:white;
            text-align:center;
            padding:50px;
            width:400px; 
            height:220px;
        }
        .stats_1>li{
            padding:20px;
        }
        .stats_graph{
            background-color:white;
            padding:50px;
            width:400px; 
            height:220px;
            margin-left:100px;
        }
        .userlist{
            margin-left:50px;
        }
        .usermenu{
            display:flex;
            border-bottom:1px solid black;
            padding:5px;
            text-align:center;
        }
        .usermenu>li{
            margin:0 auto;
            width:200px;
        }
        #user{
            display:flex;
            border-bottom:1px solid black;
            padding:5px;
            text-align:center;
        }
        #user>li{
            margin:0 auto;
          	width:200px;
        }
        .searchbox{
            margin-left:50px;
            margin-bottom:20px;
        }
        footer{display:none;
        }
        #M>a:first-of-type{
        	color:red;
        	border:1px solid orangered;
        }
   
    </style>
</head>
<body>
 
    <main>
        <aside>
        	<img src="https://cdn.discordapp.com/attachments/1186957771447488542/1189449729176780861/admin.png?ex=659e3462&is=658bbf62&hm=8787aa30a61ffbde353d915807de337e2998f47476c87c8b63eb5698f7194116&"/>
            <li style="padding-top:20px;"><a href="">회원관리 상세</a></li>
            <li><a href="/customer/customerMain">문의사항 관리</a></li>
        </aside>
        <article>
            <li class="title">회원 관리 상세</li>
            <div class="stats">
                <div class="stats_1">
                    <li>오늘 가입자 수 : ${todaySignup}</li>
                    <li>이번달 가입자 수 : ${monthSignup}</li>
                    <li>저번달 가입자 수 : ${monthSignupPrevious}</li>
                </div>
                
                <div class="stats_graph">
                    <canvas id="myChart" width="900" height="500">
        			</canvas>
                </div>
            </div>
            
            <div class="searchbox">
                <select id="search">
                    <option value="nickname">닉네임</option>
                    <option value="userid">아이디</option>
                </select>
                <input type="text" id="searchInput" placeholder="검색어를 입력하세요">
                <button>검색</button>
            </div>
            <div class="userlist">
                <div class="usermenu">
                    <li>이메일</li>
                    <li>아이디</li>
                    <li style="min-width:200px;">주소</li>
                    <li>가입일자</li>
                    
                    <li>회원관리</li>
                </div>
              
				<c:forEach var="UsersVO" items="${list}">
                    <div id="user">
                        <li>${UsersVO.email}</li>
                        <li>${UsersVO.userid}</li>
                        <li style="min-width:200px;">${UsersVO.addr}</li>
                        <li>${UsersVO.writedate}</li>
                        
                        <c:if test ="${UsersVO.userid != 'dig03208' || UsersVO.manager == 'Y'}">
                        	<li id="M">
	                        	<a href="javascript:confirmDelete('${UsersVO.userid}')">삭제</a></br> 
	                        	<a href="javascript:manager('${UsersVO.userid}')" style="color:blue;border:1px solid blue">매니저임명</a>
                        	</li> 
                        	 
                        	 <!-- '' 를 붙여야 넘어감  ㅠㅠ -->
             
                    	</c:if>
                    	
                    	<c:if test ="${UsersVO.userid == 'dig03208'}">
                        	<li>페이지 관리자</li>
                    	</c:if>
                    </div>    
                </c:forEach>
                
            </div>
        </article>   
    </main>
    
    <script>
    	// 유저 정보 삭제
    	
    	function confirmDelete(data) {
        	if (confirm("정말 삭제하시겠습니까?")) {
            	location.href = "/users/userDelete?userid="+data;

        	} else {
            
            return false;
        }
    }
    	//매니저 권한 부여
    	function manager(userid){
    		if(confirm("매니저 권한을 부여하시겠습니까?")){
    			location.href = "users/userManager?userid=" + userid;
    		}else{
    			return false;
    		}
    	}
    	
        // 캔버스
        var ctx = document.getElementById('myChart').getContext('2d');
        
        
        // 차트를 생성
        var myChart = new Chart(ctx, {
            type: 'bar', 
            data: {
                labels: ['오늘 가입자 수', '저번달 가입자 수', '이번달 가입자 수'],
                datasets: [{
                    label: '가입자수 그래프',
                    data: [${todaySignup}, ${monthSignupPrevious}, ${monthSignup}], 
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)'],
                        
                    borderColor: 'rgb(114 , 0, 0)',
                    borderWidth: 1
                }]
            },
            options: {
               
            }
        });
    </script>
</body>
</html>

