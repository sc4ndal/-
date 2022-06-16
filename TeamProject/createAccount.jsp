<%@page import="team.LoginDto"%>
<%@page import="team.LoginDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
/*
	파일명 : 
	프로그램 설명 : 

*/

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./cssfolder/AC.css">
<script type="text/javascript" src="./jsfolder/member.js"></script>
<script type="text/javascript" src="./jsfolder/AC.js"></script>

<title>회원가입</title>
</head>
<body>
<div class="register">
        <h3>회원가입</h3>
        <form name="form" action="CApro.jsp" method="post">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        이름 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="text" class="name" name="name" id="name" onkeypress="javascript:return onlyKorean('name');" placeholder="이름을 입력해주세요" required autofocus>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        닉네임 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="text" class="name" name="nick" id="nick" placeholder="닉네임을 입력하세요" required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        아이디 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="text" name="id" id="id" pattern="[A-Za-z0-9]+" placeholder="영소문자 4자~16자" minlength="4" maxlength="16" required>
                    </li>
                    <li class="item">
                        <input type="button" class="idcheck" name="idcheck" id="idcheck" onclick="checkId()"value="중복확인">
                    </li>
                </ul>
                
                <ul class="container">
                    <li class="item center">
                        비밀번호 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="password" name="pass" id="pass" onchange="same()" pattern="[A-Za-z0-9]+" placeholder="영소문자 4자~16자" minlength="4" maxlength="16" required="required">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        비밀번호 확인 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="password" name="pass2" id="pass2" onchange="same()" pattern="[A-Za-z0-9]+" placeholder="영소문자  4자~16자" minlength="4" maxlength="16" required="required">
                    </li>
                    <li class="item">
                        <span id="same"></span>
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        생년월일 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="date" name="birth" id="birth" min="1950-06-25" required="required">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>

                  <ul class="container">
                    <li class="item center">

                </ul>
                <ul class="container">
                    <li class="item center">
                        전화번호 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="tel" name="tel" id="tel" placeholder="-빼고 입력해주세요." minlength="11" maxlength="11" pattern="[0-9]+" required="required">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        이메일 
                    </li>
                    <li class="item">
                        <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <input type="button" class="submit" onclick="ACsubmit()" value="가입하기">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <input type="button" class="submit" onclick="window.close()" value="취소하기">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
        </form>
    </div>

    
</body>
<script>

//----------------------------------------------------------------------
// 생일 입력 부분의 날짜 지정 최대를 현재 날짜로 
    var today = new Date();
    var day = today.getDate();
    var month = today.getMonth() + 1; //January is 0!
    var year = today.getFullYear();
    
    if (day < 10) {
       day = '0' + day;
    }
    
    if (month < 10) {
       month = '0' + month;
    } 
        
    today = year + '-' + month + '-' + day;
    document.getElementById("birth").setAttribute("max",today);
//---------------------------------------------------------------------
// 이름칸 한글 체크 한글 이외에 문자 들어가면 이름 칸 초기화
    function onlyKorean(inputId) {
        var str=document.getElementById(inputId).value;
        for (i = -1; i < str.length; i++) {
            if (!((str.charCodeAt(i) > 0x3130 && str.charCodeAt(i) < 0x318F) || (str.charCodeAt(i) >= 0xAC00 && str.charCodeAt(i) <= 0xD7A3))) {
    
                alert("한글만 입력해 주세요");
                document.getElementById('name').value="";
                
                } 
            }
    
    
        }
//---------------------------------------------------------------------
// 필수정보입력체크
    function ACsubmit(){
        var namec = document.getElementById('name');
        var nickc = document.getElementById('nick');
        var idc = document.getElementById('id');
        var passc = document.getElementById('pass');
        var pass2c = document.getElementById('pass2');
        var birthc = document.getElementById('birth');
        var telc = document.getElementById('tel');
        
        if(namec.value==""){
            alert("이름을 입력해주세요");
            namec.focus();
        }
        else if(nickc.value==""){
            alert("닉네임을 입력해주세요");
            nickc.focus();
        }
        else if(idc.value==""){
            alert("아이디를 입력해주세요");
            idc.focus();
        }
        else if(passc.value==""){
            alert("비밀번호를 입력해주세요");
            passc.focus();
        }
        else if(pass2c.value==""){
            alert("비밀번호확인을 입력해주세요");
            pass2c.focus();
        }
        else if(birthc.value==""){
            alert("생년월일을 선택해주세요");
            birthc.focus();
        }
        else if(telc.value==""){
            alert("전화번호를 입력해주세요");
            telc.focus();
        }else if(namec.value != ""){
        	if(nickc.value != ""){
        		if(idc.value != ""){
        			if(passc.value != ""){
        				if(pass2c.value != ""){
        					if(passc.value == pass2c.value){
        						if(birthc.value != ""){
        							if(telc.value != ""){
        								//부모창을 페이지 이동시킴
	                                    opener.location.href="login.html";
        							}
        						}
        					}
        				}
        			}
        		}
        	}
        }    
    }
    
//------------------------------------------------------------ 
    // ↓ 비밀번호확인과 일치여부로 표시 나타내기
    function same(){
        var same = document.getElementById('same');
        if(pass.value!="" && pass2.value!=""){
                if(pass.value==pass2.value){
                    same.innerHTML='비밀번호가 일치합니다.'
                    same.style.color='blue';
                    same.style.fontSize='7pt';
                    
                }
                else{
                    same.innerHTML='비밀번호가 다릅니다.';
                    same.style.color='red';
                    same.style.fontSize='7pt';
                }
            }
        }
//-------------------------------------------------------------

    //필수정보입력 안돼있으면 가입버튼 disabled 만들기 
//------------------------------------------------------------
function checkId(){
	
	opener.location.href="checkId.jsp?id="+idc.value;
}
</script>
</html>
