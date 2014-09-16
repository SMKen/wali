<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary</title>
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<link href="${pageContext.request.contextPath}/resource/ui/index.css"
	rel="stylesheet">
</head>
<body>
	<!-- head begin -->
	<div class="topmenu">
		<header>
			<h1 id="sitename">Diary</h1>
			<nav>
				<ul>
					<li id="active"><a href="#"><span class="icon-home"></span>首页</a></li>
					<li><a href="#"><span class="icon-cog"></span>设置</a></li>
					<li><a href="#"><span class="icon-list-alt"></span>关于</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<!-- head end -->

	<div class="maincontainer">
		<div class="maincontent">
			<!-- check MD choose begin -->
			<c:choose>
				<c:when test="${MD not eq 'add'}">
				</c:when>
				<h2 class="hdnamd hdtitle">
					<span class="icon-th-list"></span>日记列表&nbsp;&nbsp; <a
						href="${pageContext.request.contextPath}/diary/add">新增</a>
				</h2>
				<c:otherwise>
					<h2 class="hdnamd hdtitle">
						<span class="icon-th-list"></span>日记列表&nbsp;&nbsp; <a href="#">管理</a>
					</h2>

					<!-- itemlist begin -->
					<div class="itemlist">
						<c:choose>
							<c:when test="${diarys != null}">
								<c:forEach var="d" items="${diarys}">
									<h3>
										<c:out value="${d.outline }"></c:out>
									</h3>
									<div class='itemcontent'>
										<c:out value="${d.diary }"></c:out>
										<br />
										<c:out value="${d.categorys }"></c:out>
										<a title="/" href="/" target="_blank" class="readmore">阅读>></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											class="readmore">修改</a>
									</div>
									<div class="dateview">
										<span class="icon-heart"></span><span class="icon-star"></span>
										<span class="icon-calendar"></span>2014-09-12 周一 <span
											class="icon-tags"></span>加油,Do it
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								NO Diary
							</c:otherwise>
						</c:choose>
					</div>
					<!-- itemlist end -->
				</c:otherwise>
			</c:choose>
			<!-- check MD choose end -->
		</div>

		<!-- time and category begin -->
		<div class="subitems">
			<div class="subitemlist">
				<h3>
					日记归档<span></span>
				</h3>
				<ul class="items">
					<c:choose>
						<c:when test="${timemap != null}">
							<c:forEach var="d" items="${timemap}">
								<li><a href="/" title="123" target="_blank"><c:out
											value="${d.key }"></c:out>(<c:out value="${d.value }"></c:out>)</a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
								NO Data
						</c:otherwise>
					</c:choose>
				</ul>
				<h3>
					标签<span></span>
				</h3>
				<ul class="items">
					<c:choose>
						<c:when test="${catemap != null}">
							<c:forEach var="d" items="${catemap}">
								<li><a href="/" title="123" target="_blank"><c:out
											value="${d.key }"></c:out>(<c:out value="${d.value }"></c:out>)</a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
								NO Data
						</c:otherwise>
					</c:choose>
				</ul>
				<!-- <a href="/" class="ewicon"><img src="images/xxx.jpg"></a> -->
			</div>
		</div>
		<!-- time and category end -->

		<div class="clear"></div>
	</div>
	<footer>
		<div>
			Copyright © 2014 <a href="mailto:zh_chao@126.com">Ken</a>, All Rights
			Reserved.
		</div>
	</footer>
</body>
</html>