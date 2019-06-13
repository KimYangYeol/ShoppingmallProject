<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>회원가입</h1>
<form id="writeForm" method="post" action="/springproject/member/write.do">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
	   <td width="70" align="center">이름</td>
	   <td>
	   	<input type="text" name="name" id="name" size="20" placeholder="이름 입력">
	   	<div id="nameDiv"></div>
	   </td>
	</tr>
	<tr>
	   <td align="center">아이디</td>
	   <td>
	      <input type="text" name="id" id="id" size="25" placeholder="아이디 입력">
	      <input type="hidden" id="check" value="">
	      <div id="idDiv"></div>
  	   </td>	    
	</tr>
	<tr>
	   <td align="center">비밀번호</td>
	   <td>
	   	<input type="password" name="pwd" id="pwd" size="30">
	   	<div id="pwdDiv"></div>
	   </td>
	</tr>
	<tr>
	   <td align="center">재확인</td>
	   <td>
	   	<input type="password" name="repwd" id="repwd" size="30">
	   	<div id="repwdDiv"></div>
	   </td>
	</tr>
	<tr>
	   <td align="center">성별</td>
	   <td>
	   	  <input type="radio" name="gender" value="0" checked>남자
	      <input type="radio" name="gender" value="1">여자
	   </td>
	</tr>
	<tr>
	   <td align="center">이메일</td>
	   <td>
	      <input type="text" name="email1" size="10">
	      @ 
	      <input type="text" name="email2" list="email2" placeholder="직접입력">
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
	   	  <select name="tel1">
	         <option value="010">010</option>
	         <option value="011">011</option>
	         <option value="016">016</option>
	      </select> 
	      - <input type="text" name="tel2" size="5"> 
	      - <input type="text" name="tel3" size="5">
	   </td>
	</tr>
	<tr>
	   <td align="center">주소</td>
	   <td>
	      <input type="text" name="zipcode" id="daum_zipcode" size="5"> 
	      <input type="button" value="우편번호검색" id="checkPostBtn"><br> 
	      <input type="text" name="addr1" id="daum_addr1" size="50" placeholder="주소"><br> 
	      <input type="text" name="addr2" id="daum_addr2" size="50" placeholder="상세 주소">
	   </td>
	</tr>
	<tr>
	   <td colspan="2" align="center">
	      <input type="button" value="회원가입" id="checkWriteBtn">
	      <input type="reset" value="다시작성">
	   </td>
	</tr>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>













