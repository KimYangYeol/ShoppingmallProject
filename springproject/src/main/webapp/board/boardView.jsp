<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form name="boardViewForm">
<input type="hidden" name="seq" value="${boardDTO.seq }">
<input type="hidden" name="pg" value="${pg}">
<input type="hidden" name="pseq" value="${boardDTO.seq }">

<table width="450" border="1" frame="hsides" rules="rows">
<tr>
	<td colspan="3"><h3>${boardDTO.subject }</h3></td>
</tr>
<tr>
	<td align="center" width="150">글번호 : ${boardDTO.seq }</td>
	<td align="center" width="150">작성자 : ${boardDTO.id }</td>
	<td align="center" width="150">조회수 : ${boardDTO.hit }</td>
</tr>
<tr>
	<td style="white-space: pre-wrap;" colspan="3" height="250" valign="top">${boardDTO.content }</td>
</tr>
</table>
</form>

<input type="button" value="목록" 
onclick="location.href='boardList.do?pg=${pg}'">
<input type="button" value="답글" onclick="mode(3)">

<c:if test="${boardDTO.id==memId }">
	<input type="button" value="글수정" onclick="mode(1)">
	<input type="button" value="글삭제" onclick="mode(2)">
</c:if>

<script>
function mode(num){
	if(num==1){
		document.boardViewForm.method='post';
		document.boardViewForm.action='/springproject/board/boardModifyForm.do';
		document.boardViewForm.submit();
		
	}else if(num==2){
		document.boardViewForm.method='post';
		document.boardViewForm.action='/springproject/board/boardDelete.do';
		document.boardViewForm.submit();
		
	}else if(num==3){
		document.boardViewForm.method='post';
		document.boardViewForm.action='/springproject/board/boardReplyForm.do';
		document.boardViewForm.submit();
	}
}
</script>























