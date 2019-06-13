<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name="loginForm" method="post" action="">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
	   <td align="center">아이디</td>
	   <td>
	   	<input type="text" name="id" id="loginId" size="25" placeholder="아이디 입력">
	   	<div id="loginIdDiv"></div>
	   </td>
	</tr>
	<tr>
	   <td align="center">비밀번호</td>
	   <td>
	   	<input type="password" name="pwd" id="loginPwd" size="30">
	   	<div id="loginPwdDiv"></div>
	   </td>
	</tr>
	<tr>
	   <td colspan="2" align="center">
	      <input type="button" value="로그인" id="loginBtn">
	      <input type="button" value="회원가입" id="writeBtn">
	   </td>
	</tr>	
</table>
<br><br>
<div id="loginResult" style="text-align: center;"></div>

</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$('#loginBtn').click(function(){
	$('#loginIdDiv').empty();
	$('#loginPwdDiv').empty();
	
	if($('#loginId').val()=='')
		$('#loginIdDiv').text('아이디를 입력하세요').css('color', 'red').css('font-size','8pt');
	else if($('#loginPwd').val()=='')
		$('#loginPwdDiv').text('비밀번호입력하세요').css('color', 'red').css('font-size','8pt');
	else {
		$.ajax({
			type : 'POST',
			url : '/springproject/member/login.do',
			data : {"id":$('#loginId').val(), "pwd":$('#loginPwd').val()},
			dataType : 'text',
			success : function(data){
				if(data=='login_fail'){
					$('#loginResult').text('아이디 또는 비밀번호 맞지 않습니다').css('color', 'red').css('font-size', '9pt');
					
				}
				else if(data=='login_success'){
					location.href="/springproject/main/index.do";
				}
			}
		});
	}	
});

$('#writeBtn').click(function(){
	location.href="/springproject/member/writeForm.do";
});
</script>











