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
					<li><a href="#">其它</a></li>
					<li><a href="#">设置</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">登陆</a></li>
					<li><a href="#">其它</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<div class="clear"></div>
	<!-- BEGIN PAGE CONTAINER -->
	<div class="page-container">

		<!-- BEGIN CONTAINER -->
		<div class="container min-hight">
			<!-- BEGIN BLOG -->
			<div class="row">
				<!-- BEGIN LEFT SIDEBAR -->
				<div class="col-md-9 col-sm-9 blog-posts margin-bottom-40">
					<div class="row">
						<div class="col-md-8 col-sm-8">
							<h2>
								<a href="#">这是什么一个情况</a>
							</h2>
							<ul class="blog-info">
								<li><i class="icon-calendar"></i>2014-08-13</li>
								<li><i class="icon-user"></i> 17</li>
								<li><i class="icon-tags"></i>设计，开发，创作</li>
							</ul>
							<p>认真做好一件事，一件一件地往前做!.</p>
							<a class="more" href="blog_item.html">更多<i
								class="icon-angle-right"></i></a>
						</div>
					</div>
					<hr class="blog-post-sep">

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
				<!-- END LEFT SIDEBAR -->

				<!-- BEGIN RIGHT SIDEBAR -->
				<div class="col-md-3 col-sm-3 blog-sidebar">
					<!-- CATEGORIES START -->
					<h2>年份浏览</h2>
					<ul class="nav sidebar-categories margin-bottom-40">
						<li><a href="#">2014年8月(18)</a></li>
						<li><a href="#">2014年7月 (5)</a></li>
						<li class="active"><a href="#">2014年6月 (12)</a></li>
						<li><a href="#">2013年(7)</a></li>
					</ul>
					<!-- CATEGORIES END -->

					<!-- BEGIN BLOG TAGS -->
					<div class="blog-tags margin-bottom-20">
						<h2>标签</h2>
						<ul>
							<li><a href="#"><i class="icon-tags"></i>工作</a></li>
							<li><a href="#"><i class="icon-tags"></i>生活</a></li>
							<li><a href="#"><i class="icon-tags"></i>小敏</a></li>
							<li><a href="#"><i class="icon-tags"></i>家庭</a></li>
							<li><a href="#"><i class="icon-tags"></i>人际</a></li>
							<li><a href="#"><i class="icon-tags"></i>财务</a></li>
							<li><a href="#"><i class="icon-tags"></i>健康</a></li>
							<li><a href="#"><i class="icon-tags"></i>旅游</a></li>
						</ul>
					</div>
					<!-- END BLOG TAGS -->
				</div>
				<!-- END RIGHT SIDEBAR -->
			</div>
			<!-- END BEGIN BLOG -->
		</div>
		<!-- END CONTAINER -->

	</div>

	<footer class="footer">
		<div class="container container-narrow">
			<p>CopyRight @ Ken</p>
		</div>
	</footer>

	<%-- <script
		src="${pageContext.request.contextPath}/resource/jquery/2.0.2/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/bootstrap/bootstrap.min.js"></script> --%>
</body>
</html>