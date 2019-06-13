$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/springproject/board/getBoardList.do',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align : 'center',
					text : items.seq
				})).append($('<td/>',{
					
					}).append($('<a/>',{
						href : 'javascript:void(0)',
						id : 'subjectA',
						text : items.subject,
						class : items.seq+""
						
				}))).append($('<td/>',{
					align : 'center',
					text : items.id
				})).append($('<td/>',{
					align : 'center',
					text : items.hit
				})).append($('<td/>',{
					align : 'center',
					text : items.logtime					
				})).appendTo($('#boardTable'));
				
				//답글
				for(i=0; i<items.lev; i++){
					$('.'+items.seq).before('&emsp;');
				}
				if(items.pseq!=0){
					$('.'+items.seq).before($('<img/>',{
						src : '../image/reply.gif'
					}));
				}
				
			});
			
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			//로그인 여부
			$('#boardTable').on('click','#subjectA',function(){
				if(data.memId==null)
					alert('먼저 로그인하세요');
				else
					location.href='/springproject/board/boardView.do?seq='+$(this).attr('class')+'&pg='+$('#pg').val();     
			});
		}
	});
	
	//검색
	$('#boardSearchBtn').click(function(event, str){
		if(str!='trigger') $('input[name=pg]').val(1);
		
		if($('#keyword').val()=='')
			alert('검색어를 입력하세요');
		else
			$.ajax({
				type: 'post',
				url: '/springproject/board/boardSearch.do',
				data: {'pg':$('input[name=pg]').val(), 
					   'searchOption':$('#searchOption').val(),
					   'keyword':$('#keyword').val()},
				dataType: 'json',
				success: function(data){
					//alert(JSON.stringify(data));
					
					$('#boardTable tr:gt(0)').remove();
					
					$.each(data.list, function(index, items){
						$('<tr/>').append($('<td/>',{
							align : 'center',
							text : items.seq
						})).append($('<td/>',{
							
							}).append($('<a/>',{
								href : 'javascript:void(0)',
								id : 'subjectA',
								text : items.subject,
								class : items.seq+""
								
						}))).append($('<td/>',{
							align : 'center',
							text : items.id
						})).append($('<td/>',{
							align : 'center',
							text : items.hit
						})).append($('<td/>',{
							align : 'center',
							text : items.logtime					
						})).appendTo($('#boardTable'));
						
						//답글
						for(i=0; i<items.lev; i++){
							$('.'+items.seq).before('&emsp;');
						}
						if(items.pseq!=0){
							$('.'+items.seq).before($('<img/>',{
								src : '../image/reply.gif'
							}));
						}
						
					});
					
					$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
				}
			});
	});
	
});














