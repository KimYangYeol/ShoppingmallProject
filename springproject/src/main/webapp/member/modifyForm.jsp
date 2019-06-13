<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="modifyForm" method="post" action="/miniproject/member/modify.do">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
	   <td width="70" align="center">이름</td>
	   <td><input type="text" name="name" size="20" value="${memberDTO.name }"></td>
	</tr>
	<tr>
	   <td align="center">아이디</td>
	   <td>
	      <input type="text" name="id" value="${memberDTO.id }" size="25" readonly>
	      
  	   </td>	    
	</tr>
	<tr>
	   <td align="center">비밀번호</td>
	   <td><input type="password" name="pwd" size="30"></td>
	</tr>
	<tr>
	   <td align="center">재확인</td>
	   <td><input type="password" name="repwd" size="30"></td>
	</tr>
	<tr>
	   <td align="center">성별</td>
	   <td>
	   	  <input type="radio" name="gender" value="0">남자
	      <input type="radio" name="gender" value="1">여자
	   </td>
	</tr>
	<tr>
	   <td align="center">이메일</td>
	   <td>
	      <input type="text" name="email1" value="${memberDTO.email1 }" size="10">
	      @ 
	      <input type="text" name="email2" id="email22" list="email2" style="width:120px;" placeholder="직접입력">
	      <datalist id="email2">
	      	 <option value="gmail.com">
	         <option value="hanmail.net">
	         <option value="naver.com">
	      </datalist>
	   </td>    
	</tr>
	<tr>
	   <td width="70" align="center">핸드폰</td>
	   <td>
	   	  <select name="tel1" id="tel1">
	         <option value="010">010</option>
	         <option value="011">011</option>
	         <option value="016">016</option>
	      </select> 
	      - <input type="text" name="tel2" value="${memberDTO.tel2 }" size="5"> 
	      - <input type="text" name="tel3" value="${memberDTO.tel3 }" size="5">
	   </td>
	</tr>
	<tr>
	   <td align="center">주소</td>
	   <td>
	      <input type="text" name="zipcode" id="daum_zipcode" value="${memberDTO.zipcode }" size="5"> 
	      <input type="button" value="우편번호검색" onclick="checkPost()"><br> 
	      <input type="text" name="addr1" id="daum_addr1" value="${memberDTO.addr1 }" size="50"><br> 
	      <input type="text" name="addr2" id="daum_addr2" value="${memberDTO.addr2 }" size="50">
	   </td>
	</tr>
	<tr>
	   <td colspan="2" align="center">
	      <input type="button" value="회원정보수정" onclick="javascript:checkModify()">
	      <input type="reset" value="다시작성">
	   </td>
	</tr>
</table>
</form>

<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
window.onload=function(){
	document.modifyForm.gender['${memberDTO.gender}'].checked = true;
	//document.modifyForm.email2.value = '${memberDTO.email2}';
	//document.modifyForm.tel1.value = '${memberDTO.tel1}';
	
	document.getElementById("email22").value = '${memberDTO.email2}';
	document.getElementById("tel1").value = '${memberDTO.tel1}';
}
</script>



























