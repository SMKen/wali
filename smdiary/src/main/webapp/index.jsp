<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="zh_CN" />
<%@ include file="resource/jsp/diarydb.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>SMDairy</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Blog,Simple,smKen,ken">
<meta name="author" content="Ken">
<link
	href="${pageContext.request.contextPath}/resource/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link href="resource/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header role="banner" id="top"
		class="navbar navbar-static-top bs-docs-nav">
		<div class="container">
			<div class="navbar-header">
				<button data-target=".bs-navbar-collapse" data-toggle="collapse"
					type="button" class="navbar-toggle collapsed">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">SMDiary</a>
			</div>
			<nav role="navigation"
				class="collapse navbar-collapse bs-navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">首页</a></li>
					<li><a href="#">日记</a></li>
					<li><a href="#">分类</a></li>
					<li><a href="#">分享</a></li>
					<li><a href="#">设置</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><c:choose>
							<c:when test="${sessionScope.user == null}">
								<a href="login.jsp">登陆</a>
							</c:when>
							<c:otherwise>
							${sessionScope.user}
						</c:otherwise>
						</c:choose></li>
				</ul>
			</nav>
		</div>
	</header>

	<div class="clear"></div>
	<div class="page-container">

		<div class="container min-hight">
			<div class="row">
				<div class="col-md-9 col-sm-9 blog-posts margin-bottom-40">
					<div class="row">
						<c:catch var="sqle">
							<sql:query dataSource="${db}" var="diaryList"
								sql="select * from smdiary_diary" scope="page" startRow="0"
								maxRows="10"></sql:query>
							<c:forEach var="d" items="${diaryList.rows}">
								<div class="col-md-8 col-sm-8">
									<h2>
										<a href="#"><c:out value="${d.outline}" /></a>
									</h2>
									<ul class="blog-info">
										<li><i class="icon-calendar"></i> <fmt:parseDate
												value="${d.create_time}" var="date"
												pattern="yyyy/MM/dd:HH:mm:ss"></fmt:parseDate></li>
										<li><i class="icon-user"></i> <c:out
												value="${d.viewtimes}" /></li>
										<li><i class="icon-tags"></i> <c:out
												value="${d.category}" /></li>
									</ul>
									<p>
										<c:out value="${d.diary}" />
									</p>
									<a class="more" href="#">更多<i class="icon-angle-right"></i></a>
								</div>
								<hr class="blog-post-sep">
							</c:forEach>
						</c:catch>
						<c:if test="${sqle != null}">
							<a href="#">Sorry , 后台出现异常 ！</a>
						</c:if>
					</div>

					<div class="text-center">
						<ul class="pagination pagination-centered">
							<li><a href="#">上一页</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li class="active"><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">最后一页</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-3">
					<h2>年份浏览</h2>
					<ul class="margin-bottom-40">
						<li><a href="#">2014年8月(18)</a></li>
						<li><a href="#">2014年7月 (5)</a></li>
						<li class="active"><a href="#">2014年6月 (5)</a></li>
						<li><a href="#">2014年5月 (5)</a></li>
					</ul>

					<div class="blog-tags margin-bottom-20">
						<h2>标签</h2>
						<ul>
							<c:catch var="sqle">
								<sql:query dataSource="${db}" var="users"
									sql="select * from SMDIARY_CATEGORY" scope="page" startRow="0"
									maxRows="10"></sql:query>
								<c:forEach var="row" items="${users.rows}">
									<li><a href="#"><i class="icon-tags"></i> <c:out
												value="${row.name}" /></a></li>
								</c:forEach>
							</c:catch>
							<c:if test="${sqle != null}">
								<li><a href="#"><i class="icon-tags"></i>未分类</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>

	<footer class="footer">
		<div class="container container-narrow">
			<p>CopyRight @ Ken</p>
		</div>
	</footer>
	<%-- 
	<script
		src="${pageContext.request.contextPath}/resource/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/bootstrap/bootstrap.min.js"></script> --%>
</body>
</html>