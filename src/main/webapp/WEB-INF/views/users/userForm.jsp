<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	main{width: 600px}
	form>ul{
		 overflow: auto;
	}
	form li{
		float: left;height: 40px; line-height: 40px; border-bottom: 1px solid #ddd; width: 20%; margin: 5px 0;
	}
	form>ul>li:nth-child(2n){
		width: 80%;
	}
	form>ul>li:last-of-type{
		width: 100%; text-align: center;
	}
	input, select{
		height:50%;
	}
</style>

<!-- 우편번호 찾기(다음 우편번호 api) -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script>
	$(function(){
		//아이디 중복검사
		$("input[value='아이디중복검사']").click(function(){
			if($("#userid").val()==""){
				alert("아이디를 입력후 중복검사 하세요.");
				return false;
			}
			
			window.open("/users/idCheck?userid="+$("#userid").val(),"idCheck","width=500px,height=300px")
		});
		$("#userid").keyup(function(){
			$("#chk").val("N");
		});
		
		//우편번호 찾기
		$("input[value=우편번호찾기]").click(function(){
			 new daum.Postcode({
		            oncomplete: function(data) {
		            	console.log(data);

		                var addr = ''; 
		                var extraAddr = ''; 

		               
		                if (data.userSelectedType === 'R') { 
		                    addr = data.roadAddress;
		                } else { 
		                    addr = data.jibunAddress;
		                }
		                document.getElementById('zipcode').value = data.zonecode;
		                document.getElementById("addr").value = addr;
		                
		                document.getElementById("addrdetail").focus();
		            }
		        }).open();
		});
		
		//유효성검사 - 아이디,비번,이름,연락처
		$("#userFrm").submit(function(){
			var reg=/^\w{8,14}$/
			if(!reg.test($("#userid").val())){
				alert("아이디는 영어 대소문자, 숫자, _만 허용, 길이는 8~14글자 사이여야 합니다.");
				return false;
			}
			if($("#chk").val()==="N"){
				alert("아이디 중복검사 하세요..");
				return false;
			}
			if($("#userpwd")==""||$("#userpwd2").val()==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			if($("#userpwd").val()!=$("#userpwd2").val()){
				alert("비밀번호가 다릅니다.");
				return false;
			}
			reg=/^[가-힣]{2,10}$/
			if(!reg.test($("#username").val())){
				alert("이름을 잘못입력하였습니다.");
				return false;
			}
			reg=/^[0-9]{3,4}-[0-9]{4}$/
			var tel=$("#tel2").val()+"-"+$("#tel3").val();
			if(!reg.test(tel)){
				alert("전화번호를 잘못입력하였습니다.");
				return false;
			}
			return true;
		});
		
	});
</script>

<main>
	<h1 style="text-align: center">회원가입</h1>
	<form method="post" action="/users/userFormOk" id="userFrm">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid"/>
				<input type="button" value="아이디중복검사"/>
				<input type="hidden" name="chk" id="chk" value="N"/>
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd"/></li>
			<li>비밀번호확인</li>
			<li><input type="password" name="userpwd2" id="userpwd2"/></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username"/></li>
			<li>연락처</li>
			<li><select name="tel1" id="tel1">
					<option>010</option>
					<option>02</option>
				</select> -
				<input type="number" name="tel2" id="tel2"/> -
				<input type="number" name="tel3" id="tel3"/>
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email"></li>
			<li>우편번호</li>
			<li><input type="text" name="zipcode" id="zipcode"/>
				<input type="button" value="우편번호찾기"/>
			</li>
			<li>주소</li>
			<li><input type="text" name="addr" id="addr" style="width:80%" /></li>
			<li>상세주소</li>
			<li><input type="text" name="addrdetail" id="addrdetail"/></li>
			
			
			<li><input type="submit" value="회원가입하기"/></li>
		</ul>
	
	</form>
</main>