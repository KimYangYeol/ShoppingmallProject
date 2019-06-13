<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>
<img src="../image/lion.PNG" width="50" height="50" style="cursor: pointer;" 
onclick="location.href='/springproject/main/index.do'">
MVC를 이용한 미니 프로젝트
</h1>

<a href="/springproject/board/boardList.do">목록</a>&emsp;

<c:if test="${memId != null}">
	<a href="/springproject/board/boardWriteForm.do">글쓰기</a>&emsp;
	<a href="/springproject/imageboard/imageboardWriteForm.do">이미지등록</a>&emsp;
	<a href="/springproject/imageboard/imageboardList.do?pg=1">이미지목록</a>&emsp;
</c:if>





















