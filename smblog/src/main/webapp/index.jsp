<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"  %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %> --%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="zh_CN" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>SMBlog</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Blog,Simple,smKen,ken">
<meta name="author" content="Ken">
<link
	href="${pageContext.request.contextPath}/resource/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.container {
	margin: 0 auto;
	max-width: 960px;
}
</style>
</head>
<body>

	<div class="navbar navbar-default">
		<div class="container">
			<a class="navbar-brand" href="#">SMBlog...........</a>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">首页</a></li>
				<li><a href="#">博文</a></li>
				<li><a href="#">图片</a></li>
				<li class="divider-vertical"></li>
				<li><a href="#">更多</a></li>
				<li><a href="#">设置</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="jumbotron text-center">
			<h1>What`s here</h1>
			<p class="lead">Content</p>
			<p>
				<a class="btn btn-large btn-success" href="#" target="ext">More
					.... </a>
			</p>
		</div>
	</div>
	<!-- /container -->

	<div class="container-fluid container" id="main">
		<div class="row">
			<div class="col-xs-8" id="left">
				<h2>Article Demo</h2>

				<!-- item list -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="">Article Id</a>
					</div>
				</div>
				<p>Simple Index of the Article.</p>
				<hr>
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="">Article Id2 </a>
					</div>
				</div>
				<p>Simple Index of the Article 2.</p>
			</div>
		</div>

		<p>
			<a href="#">What</a> | <a href="#">Else</a>
		</p>

		<hr>

		<p>
			<a href="#" target="_ext" class="center-block btn btn-primary">More
				....</a>
		</p>

	</div>

	<script
		src="${pageContext.request.contextPath}/resource/jquery/2.0.2/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/bootstrap/bootstrap.min.js"></script>
</body>
</html>