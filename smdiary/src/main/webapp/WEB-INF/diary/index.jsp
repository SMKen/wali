<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	alert('${pageContext.request.contextPath}/index/login');
</script>
<c:choose>
	<c:when test="${sessionScope.user != null}">
		<script>
			alert('${pageContext.request.contextPath}/index/login');
		</script>
		<c:redirect url="diary"></c:redirect>
		<%-- <jsp:forward page="${pageContext.request.contextPath}/index/login"></jsp:forward> --%>
	</c:when>
	<c:otherwise>
		<script>
			alert('${pageContext.request.contextPath}/diary');
		</script>
		<c:redirect url="index/login"></c:redirect>
		<%-- <jsp:forward page="${pageContext.request.contextPath}/diary"></jsp:forward> --%>
	</c:otherwise>
</c:choose>
 