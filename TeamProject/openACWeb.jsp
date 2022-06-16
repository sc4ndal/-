<%
/*
	파일명 : 
	프로그램 설명 : changeAC2.html, createAC2.html 이동 참고

*/

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!------------------------------------------------------------------------->
<!-- 팝업창 생성 함수 : left랑 top을 조절로 화면 중간에서 팝업 생성 -->
<script>

function createPopupWin(pageURL, pageTitle
        ,popupWinWidth, popupWinHeight
        ) {
	
	var left = (screen.width - popupWinWidth) / 2;
    var top = (screen.height - popupWinHeight) / 4;
	var myWindow = window.open(pageURL, pageTitle,
        'resizable=no, location=no, width=' + popupWinWidth
        + ', height=' + popupWinHeight + ', top='
        + top + ', left=' + left).window;
}
</script>
<!-------------------------------------------------------------------------->


	 <input type="button" id="popup" value="회원가입 열기" onclick="createPopupWin('createAC2.html','회원가입',750,650)">
	 <input type="button" id="popup" value="회원수정 열기" onclick="createPopupWin('changeAC2.html','회원수정',750,660)">
	 
	 
</body>
</html>