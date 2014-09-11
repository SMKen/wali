<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Message : ${message}</h1>
	msgs:${msgs }
	<br /> msg:${msg }
	<br /> diarys:${diarys }
	<br />
	<hr />
	<h2>日记列表</h2>
	<c:choose>
		<c:when test="${diarys != null}">
			<c:forEach var="d" items="${diarys}">
				<c:out value="${d.outline }"></c:out>&nbsp;&nbsp;
				<c:out value="${d.categorys }"></c:out>
				<c:out value="${d.diary }"></c:out>
				<br />
			</c:forEach>
		</c:when>
		<c:otherwise>
				NO Diary
		</c:otherwise>
	</c:choose>
	<br />
	<hr>
	<h3>添加新日记</h3>
<form action="${pageContext.request.contextPath}/diary/add" name="diary" method="POST">
	<input type="text" name="outline"></input>
	<input type="text" name="diary"></input>
	<button type="submit">发布</button>
	<button type="reset">重置</button>
</form>
</body>
</html>