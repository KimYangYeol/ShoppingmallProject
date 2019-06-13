<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="../css/board.css">

<form name="imageboardListForm" method="" action="/miniproject/imageboard/imageboardDelete.do">
<table border="1" frame="hsides" rules="rows">
<tr>
	<th width="70"><input type="checkbox" id="all" onclick="checkAll()">번호</th>
	<th width="200">이미지</th>
	<th width="100">상품명</th>
	<th width="100">단가</th>
	<th width="100">개수</th>
	<th width="100">합계</th>
</tr>
<c:if test="${list!=null }">	
	<c:forEach var="imageboardDTO" items="${list }">
		<tr>
			<td align="center">
			<input type="checkbox" name="check" value="${imageboardDTO.seq }">${imageboardDTO.seq }
			</td>
			
			<td align="center">
				<img src="../storage/${imageboardDTO.image1 }" width="70" height="70"
				onclick="location.href='/miniproject/imageboard/imageboardView.do?seq=${imageboardDTO.seq }&pg=${pg }'"
				style="cursor: pointer;">
			</td>
			<td align="center">${imageboardDTO.imageName }</td>
			<td align="center">
			<fmt:formatNumber type="number" value="${imageboardDTO.imagePrice }"/>
			</td>
			<td align="center">
			<fmt:formatNumber type="number" value="${imageboardDTO.imageQty }"/>
			</td>
			<td align="center">
			<fmt:formatNumber type="number" value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }">
			</fmt:formatNumber></td>
		</tr>
	</c:forEach>
</c:if>	
</table>
<div style="float : left;">
	<input type="button" value="선택삭제" onclick="choiceDelete()">
</div>
<div style="width: 650px; float: left; text-align: center;">${imageboardPaging.pagingHTML }</div>
</form>

<script>
function checkAll(){
	//alert(document.imageboardListForm.check.length);
	//alert(document.getElementById("all").checked)
	
	var check = document.getElementsByName("check");
	if(document.getElementById("all").checked){
		for(i=0; i<check.length; i++){
			check[i].checked = true;
		}
	}else{
		for(i=0; i<check.length; i++){
			check[i].checked = false;
		}
	}
}

function choiceDelete(){
	var check = document.getElementsByName("check");
	var count=0;
	for(i=0; i<check.length; i++){
		if(check[i].checked) count++;
	}
	
	if(count==0)
		alert("항목을 선택해주세요");
	else
		document.imageboardListForm.submit();
}

function imageboardPaging(pg){
	location.href="/miniproject/imageboard/imageboardList.do?pg="+pg;
}
</script>













