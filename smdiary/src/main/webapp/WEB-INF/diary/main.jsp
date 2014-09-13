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
<link href="${pageContext.request.contextPath}/resource/ui/index.css" rel="stylesheet">
</head>
<body>
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
	
	<div class="maincontainer">
		<div class="maincontent">
			<h2 class="hdnamd hdtitle">
				<span class="icon-th-list"></span>日记列表
			</h2>
			<div class="itemlist">
			<c:choose>
				<c:when test="${diarys != null}">
					<c:forEach var="d" items="${diarys}">
						<h3><c:out value="${d.outline }"></c:out></h3>
						<div class='itemcontent'><c:out value="${d.diary }"></c:out>
						<br />
						<c:out value="${d.categorys }"></c:out>
						<a title="/" href="/" target="_blank" class="readmore">阅读>></a>&nbsp;&nbsp;&nbsp;&nbsp;<a  class="readmore">修改</a></div>				<div class="dateview">
							<span class="icon-heart"></span><span class="icon-star"></span>
							<span  class="icon-calendar"></span>2014-09-12  周一
							<span class="icon-tags"></span>加油,Do it
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
						NO Diary
				</c:otherwise>
			</c:choose>
				 
			</div>
		</div>
		<div class="subitems">
			<div class="subitemlist">
				<h3>
						最新日记<span></span>
				</h3>
				<ul class="items">
					<li><a href="/" title="123" target="_blank">123</a></li>
					<li><a href="/" title="123" target="_blank">123</a></li>
				</ul>
				<h3>
						日记归档<span></span>
				</h3>
				<ul class="items">
					<li><a href="/" title="123" target="_blank">123</a></li>
				</ul>
				<h3>
						标签<span></span>
				</h3>
				<ul class="items">
					<li><a href="/" title="123" target="_blank">123</a></li>
				</ul>
				<!-- <a href="/" class="ewicon"><img src="images/xxx.jpg"></a> -->
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<footer>
		<div>Copyright © 2014 <a href="mailto:zh_chao@126.com">Ken</a>, All Rights Reserved.</div>
	</footer>
</body>
</html>

<%-- 
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
</html> --%>