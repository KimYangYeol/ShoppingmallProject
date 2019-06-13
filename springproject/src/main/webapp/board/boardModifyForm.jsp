<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="boardModifyForm" method="post">

<input type="hidden" name="seq" value="${seq}">
<input type="hidden" name="pg" value="${pg}">

<h3>글수정</h3>
<table border="1" cellpadding="5" cellspacing="0">
<tr>
	<td align="center">제목</td>
	<td>
	 <input type="text" name="subject" id="subject" value="${boardDTO.subject}" size="50">
	 <div id="subjectDiv"></div>
	</td>
</tr>
<tr>
	<td align="center">내용</td>
	<td>
	 <textarea cols="40" rows="15" name="content" id="content">${boardDTO.content}</textarea>
	 <div id="contentDiv"></div>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
	 <input type="button" value="글수정" id="boardModifyBtn">
	 <input type="reset" value="다시작성">
	</td>
</tr>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$('#boardModifyBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val()=='')
		$('#subjectDiv').text('제목을 입력하세요').css('color', 'red').css('font-size','8pt');
	else if($('#content').val()=='')
		$('#contentDiv').text('내용을 입력하세요').css('color', 'red').css('font-size','8pt');
	else
		$.ajax({
			type : 'post',
			url : '/springproject/board/boardModify.do',
			data : {'seq': '${seq}',
				    'subject': $('#subject').val(),
				    'content': $('#content').val()},
			success : function(){
				alert("글수정 성공");
				location.href='/springproject/board/boardView.do?seq=${seq}&pg=${pg}';
			}
		});
});
</script>











