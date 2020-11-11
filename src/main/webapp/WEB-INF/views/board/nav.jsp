<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<li><a href="${pageContext.request.contextPath}/board/list">목록</a></li>
	<li><a href="${pageContext.request.contextPath}/board/writeView">글 작성</a></li>
	<li>
		<c:if test="${member != null}"><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></c:if>
		<c:if test="${member == null}"><a href="${pageContext.request.contextPath}/">로그인</a></c:if>
	</li>
	<li>
		<c:if test="${member != null}">
			<p>${member.name}님 안녕하세요.</p>
		</c:if>
	</li>
</ul>