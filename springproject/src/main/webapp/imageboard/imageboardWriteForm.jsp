<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form id="imageboardWriteForm" method="post" enctype="multipart/form-data"
action="/springproject/imageboard/imageboardWrite.do">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<td align="center">상품코드</td>
		<td>
			<input type="text" name="imageId" id="imageId" size="40" value="img_">
			<div id="imageIdDiv"></div>
		</td>
	</tr>
	
	<tr>
		<td align="center">상품명</td>
		<td>
			<input type="text" name="imageName" id="imageName" size="40" placeholder="상품명 입력">
			<div id="imageNameDiv"></div>
		</td>
	</tr>
	
	<tr>
		<td align="center">단가</td>
		<td>
			<input type="text" name="imagePrice" id="imagePrice" size="30" placeholder="단가 입력">
			<div id="imagePriceDiv"></div>
		</td>
	</tr>
	
	<tr>
	<td align="center">개수</td>
	<td>
		<input type="text" name="imageQty" id="imageQty" size="30" placeholder="개수 입력">
		<div id="imageQtyDiv"></div>
	</td>
	</tr>
	
	<tr>
		<td align="center">내용</td>
		<td>
			<textarea cols="50" rows="10" name="imageContent" id="imageContent" placeholder="내용 입력"></textarea>
			<div id="imageContentDiv"></div>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="file" name="img" id="img1" size="60">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="file" name="img" id="img2" size="60">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="file" name="img[]" id="img3" size="60" multiple>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="이미지등록" id="imageboardWriteBtn">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$('#imageboardWriteBtn').click(function(){
	$('#imageIdDiv').empty();
	$('#imageNameDiv').empty();
	$('#imagePriceDiv').empty();
	$('#imageQtyDiv').empty();
	$('#imageContentDiv').empty();
	//$('#image1Div').empty();
	
	if($('#imageId').val()=='img_') {
		$('#imageIdDiv').text("상품코드를 입력하세요.").css('color', 'red').css('font-size', '8pt');
		$('#imageId').focus();
	} else if($('#imageName').val()=='') {
		$('#imageNameDiv').text("상품명을 입력하세요.").css('color', 'red').css('font-size', '8pt');
		$('#imageName').focus();
	} else if($('#imagePrice').val()=='') {
		$('#imagePriceDiv').text("단가를 입력하세요.").css('color', 'red').css('font-size', '8pt');
		$('#imagePrice').focus();
	} else if($('#imageQty').val()=='') {
		$('#imageQtyDiv').text("개수를 입력하세요.").css('color', 'red').css('font-size', '8pt');
		$('#imageQty').focus();
	} else if($('#imageContent').val()=='') {
		$('#imageContentDiv').text("내용을 입력하세요.").css('color', 'red').css('font-size', '8pt');
		$('#imageContent').focus();
//	} else if($('#img1').val()=='') {
//		$('#image1Div').text("이미지를 입력하세요.").css('color', 'red').css('font-size', '8pt');
	} else{
		/*
		$.ajax({
			type: 'post',
			url: '/springproject/imageboard/imageboardWrite.do',
			data: {imageId: $('#imageId').val(),
				   imageName: $('#imageName').val(),
				   imagePrice: $('#imagePrice').val(),
				   imageQty: $('#imageQty').val(),
				   imageContent: $('#imageContent').val(),
				   img1: $('#img1').val()},
			success: function(){
				alert('이미지 등록 완료');
				location.href='/springproject/imageboard/imageboardList.do';
			}
		});
		*/
		
		$('#imageboardWriteForm').submit();
	}
		
});
</script>




















