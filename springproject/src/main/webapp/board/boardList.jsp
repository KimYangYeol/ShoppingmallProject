<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="../css/board.css">

<input type="hidden" id="pg" value="${pg }">
<table id="boardTable" border="1" frame="hsides" rules="rows">
<tr>
	<th width="100">글번호</th>
	<th width="300">제목</th>
	<th width="100">작성자</th>
	<th width="100">조회수</th>
	<th width="100">작성일</th>
</tr>
</table>

<div id="boardPagingDiv" style="width: 700px; float: left; text-align: center;"></div>
<br><br><br><br><br>

<form name="" method="post" action="/springproject/board/boardSearch.do">
<input type="hidden" name="pg" value="1">
<div style="width: 670px; text-align: center;">
	<select name="searchOption" id="searchOption">
		<option value="id" selected>작성자</option>
        <option value="subject">제목</option>
    </select>
    <input type="text" name="keyword" id="keyword" value="${keyword }" size="20">
    <input type="button" id="boardSearchBtn" value="검색">
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/board.js"></script>
<script type="text/javascript">
function boardPaging(pg){
	location.href="/springproject/board/boardList.do?pg="+pg;
}

function boardSearchPaging(pg){
//	location.href="/springproject/board/boardSearch.do?pg="+pg
//			+"&searchOption=${searchOption}&keyword="+encodeURIComponent('${keyword}');

	$('input[name=pg]').val(pg);
	$('#boardSearchBtn').trigger('click','trigger');
}

/*
window.onload=function(){
	if('${searchOption}'=='id' || '${searchOption}'=='subject')
		document.getElementById('searchOption').value = '${searchOption}';
}
*/
</script>
































