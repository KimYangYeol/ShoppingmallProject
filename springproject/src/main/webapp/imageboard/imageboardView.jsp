<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table border="1" width="400" frame="hsides" rules="rows">    
<tr>
	<td rowspan="4"><img src="../storage/${imageboardDTO.image1 }" width="200" height="200"></td>
  	<td width="200">이름 : ${imageboardDTO.imageName }</td>
</tr>
<tr>
  	<td>단가 :
	<fmt:formatNumber type="number" value="${imageboardDTO.imagePrice }" pattern="#,###"/>
	</td>
</tr>
<tr>
  	<td>개수 : 
	<fmt:formatNumber type="number" value="${imageboardDTO.imageQty }" pattern="#,###"/>
	</td>
</tr>
<tr>
  	<td>합계 : 
	<fmt:formatNumber type="number" value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }" pattern="#,###"/>
	</td>
</tr>
<tr>
	<td style="white-space: pre-wrap;" colspan="2" height="100" valign="top">${imageboardDTO.imageContent }</td>
</tr>
</table>
<input type="button" value="목록" onclick="location.href='imageboardList.do?pg=${pg}'">
    
    
    
    
    
    
    





    