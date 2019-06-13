<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" href="../css/member.css">

<form name="" method="post" action="">
<table id="postTable" border="1" cellpadding="5" cellspacing="0">
<tr>
	<td width="70" align="center">시도</td>
	<td width="150">
		<select name="sido" id="sido" style="width: 100px;">
		<option>시도선택</option>
		<option>서울</option>
		<option>인천</option>
        <option>대전</option>
        <option>대구</option>
        <option>울산</option>
        <option>세종</option>
        <option>광주</option>
        <option>경기</option>
        <option>강원</option>
        <option>전남</option>
        <option>전북</option>
        <option>경남</option>
        <option>경북</option>
        <option>충남</option>
        <option>충북</option>
        <option>부산</option>
        <option>제주</option>
		</select>
	</td>
	<td width="100" align="center">시.구.군</td>
	<td width="200"><input type="text" name="sigungu" id="sigungu" size="20"></td>
</tr>
<tr>
	<td align="center">도로명</td>
	<td colspan="3">
		<input type="text" name="roadname" id="roadname" size="30">
		<input type="button" id="postSearchBtn" value="검색">
	</td>
</tr>
<tr>
	<td align="center">우편번호</td>
	<td colspan="3" align="center">주소</td>
</tr>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>










