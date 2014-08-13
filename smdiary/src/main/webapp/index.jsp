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
<style type="text/css">
body {
	color: #000;
	direction: ltr;
	font-family: 'Open Sans' !important;
	font-size: 13px;
}

.margin-bottom-40 {
	margin-bottom: 40px !important;
}

.blog-info {
	list-style: none outside none;
}

.blog-info li {
	color: #555;
	display: inline-block;
	font-size: 13px;
	margin-right: 10px;
	padding: 0;
}

div, input, select, textarea, span, img, table, td, th, p, a, button, ul,
	code, pre, li {
	border-radius: 0 !important;
}

.sidebar-categories li a:before {
	content: "";
	font-family: FontAwesome !important;
	font-size: 8px;
	padding-right: 10px;
	position: relative;
	top: -1px;
}

.sidebar-categories li a {
	border-bottom: 1px solid #e0dede;
	color: #333;
	padding: 10px 0;
}

.nav>li>a {
	display: block;
	padding: 10px 15px;
	position: relative;
}

a, a:focus, a:hover, a:active {
	outline: 0 none;
}

div, input, select, textarea, span, img, table, td, th, p, a, button, ul,
	code, pre, li {
	border-radius: 0 !important;
}

a {
	background: none repeat scroll 0 0 transparent;
	text-decoration: none;
}

.footer {
	background-color: #f5f5f5;
	border-top: 1px solid #e5e5e5;
	margin-top: 70px;
	padding: 30px 0;
	text-align: center;
} 
</style>
<link href="resource/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.fa {
	display: inline-block;
	font-style: normal;
	font-weight: normal;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>

</head>
<body>
	<div class="navbar navbar-default">
		<div class="container">
			<a class="navbar-brand" href="#">SMDiary...</a>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">首页</a></li>
				<li><a href="#">日记</a></li>
				<li><a href="#">分类</a></li>
				<li><a href="#">分享</a></li>
				<li><a href="#">其它</a></li>
				<li><a href="#">设置</a></li>
			</ul>
		</div>
	</div>

 
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
								<li><i class="fa fa-calendar"></i>2014-08-13</li>
								<li><i class="fa fa-comments"></i> 17</li>
								<li><i class="fa fa-tags"></i>设计，开发，创作</li>
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
							<li><a href="#"><i class="fa fa-tags"></i>工作</a></li>
							<li><a href="#"><i class="fa fa-tags"></i>生活</a></li>
							<li><a href="#"><i class="fa fa-tags"></i>小敏</a></li>
							<li><a href="#"><i class="fa fa-tags"></i>家庭</a></li>
							<li><a href="#"><i class="fa fa-tags"></i>人际</a></li>
							<li><a href="#"><i class="fa fa-tags"></i>财务</a></li>
							<li><a href="#"><i class="fa fa-tags"></i>健康</a></li>
							<li><a href="#"><i class="fa fa-tags"></i>旅游</a></li>
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
			<p>
				CopyRight @ Ken 
			</p>
		</div>
	</footer>


	<%-- <script
		src="${pageContext.request.contextPath}/resource/jquery/2.0.2/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/bootstrap/bootstrap.min.js"></script> --%>
</body>
</html>