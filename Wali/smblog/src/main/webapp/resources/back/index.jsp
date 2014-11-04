<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${sessionScope.user != null}">
		<jsp:forward page="index/login"></jsp:forward>
	</c:when>
	<c:otherwise>
		<jsp:forward page="db"></jsp:forward>
	</c:otherwise>
</c:choose>
