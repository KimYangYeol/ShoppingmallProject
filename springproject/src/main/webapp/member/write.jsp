<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${su==1 }">
	회원가입을 축하합니다!!
</c:if>
<c:if test="${su==0 }">
	회원가입 실패!!
</c:if>








