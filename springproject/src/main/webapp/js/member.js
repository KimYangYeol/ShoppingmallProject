$('#checkWriteBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if($('#name').val()=='')
		$('#nameDiv').text('이름을 입력하세요').css('color', 'red').css('font-size','8pt');
	else if($('#id').val()=='')
		$('#idDiv').text('아이디를 입력하세요').css('color', 'red').css('font-size','8pt');
	else if($('#pwd').val()=='')
		$('#pwdDiv').text('비밀번호를 입력하세요').css('color', 'red').css('font-size','8pt');
	else if($('#pwd').val() != $('#repwd').val())
		$('#repwdDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','8pt');
	else if($('#id').val() != $('#check').val())
		$('#idDiv').text('중복체크 하세요').css('color','red').css('font-size','8pt');
	else
		$('#writeForm').submit();
	
});

$('#id').focusout(function(){
	if($('#id').val()=='')
		$('#idDiv').text('먼저 아이디를 입력하세요').css('color','magenta').css('font-size','8pt');
	else 
		$.ajax({
			type : 'post',
			url : '/springproject/member/checkId.do',
			data : "id="+$('#id').val(),
			dataType : 'text',
			success : function(data){
				if(data=='exist')
					$('#idDiv').text('사용 불가능').css('color','magenta').css('font-size','8pt');
				else if(data=='not_exist'){
					$('#idDiv').text('사용 가능').css('color','blue').css('font-size','8pt');
					$('#check').val($('#id').val());
				}
			}
		});
});

$('#checkPostBtn').click(function(){
	window.open("/springproject/member/checkPost.do","","width=500 height=500 scrollbars=yes");
});

$('#postSearchBtn').click(function(){
	if($('#sido').val()=='시도선택' || $('#roadname').val()=='') 
		alert("주소를 입력하세요");
	
	else
		$.ajax({
			type : 'POST',
			url : '/springproject/member/postSearch.do',
			data : {'sido' : $('#sido').val(),
				    'sigungu' : $('#sigungu').val(),
				    'roadname' : $('#roadname').val()},
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				$('table tr:gt(2)').remove();
				$.each(data.list, function(index, items){
					var address = items.sido + ' '
					            + items.sigungu + ' '
					            + items.yubmyundong + ' '
					            + items.ri + ' '
					            + items.roadname + ' '
					            + items.buildingname;
					
					address = address.replace(/null/g,'');
					
					$('<tr/>').append($('<td/>',{
						align : 'center',
						text : items.zipcode
					})).append($('<td/>',{
						colspan : '3',
						
						}).append($('<a/>',{
							href : 'javascript:void(0)',
							id : 'addressA',
							text : address
						}))
					).appendTo($('#postTable'));
				});
				
				$('a').click(function(){
					//alert($(this).prop('tagName'));
					
					$('#daum_zipcode', opener.document).val($(this).parent().prev().text());
					$('#daum_addr1', opener.document).val($(this).text());
					window.close();
				});
			}
		});
		
});

















