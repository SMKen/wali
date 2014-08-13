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

[class^="icon-"], [class*=" icon-"] {
	display: inline-block;
	width: 14px;
	height: 14px;
	line-height: 14px;
	vertical-align: text-top;
	background-image: url("resource/bootstrap/img/glyphicons-halflings.png");
	background-position: 14px 14px;
	background-repeat: no-repeat;
	*margin-right: .3em;
}

[class^="icon-"]:last-child, [class*=" icon-"]:last-child {
	*margin-left: 0;
}

.icon-white {
	background-image:
		url("resource/bootstrap/img/glyphicons-halflings-white.png");
}

.icon-glass {
	background-position: 0 0;
}

.icon-music {
	background-position: -24px 0;
}

.icon-search {
	background-position: -48px 0;
}

.icon-envelope {
	background-position: -72px 0;
}

.icon-heart {
	background-position: -96px 0;
}

.icon-star {
	background-position: -120px 0;
}

.icon-star-empty {
	background-position: -144px 0;
}

.icon-user {
	background-position: -168px 0;
}

.icon-film {
	background-position: -192px 0;
}

.icon-th-large {
	background-position: -216px 0;
}

.icon-th {
	background-position: -240px 0;
}

.icon-th-list {
	background-position: -264px 0;
}

.icon-ok {
	background-position: -288px 0;
}

.icon-remove {
	background-position: -312px 0;
}

.icon-zoom-in {
	background-position: -336px 0;
}

.icon-zoom-out {
	background-position: -360px 0;
}

.icon-off {
	background-position: -384px 0;
}

.icon-signal {
	background-position: -408px 0;
}

.icon-cog {
	background-position: -432px 0;
}

.icon-trash {
	background-position: -456px 0;
}

.icon-home {
	background-position: 0 -24px;
}

.icon-file {
	background-position: -24px -24px;
}

.icon-time {
	background-position: -48px -24px;
}

.icon-road {
	background-position: -72px -24px;
}

.icon-download-alt {
	background-position: -96px -24px;
}

.icon-download {
	background-position: -120px -24px;
}

.icon-upload {
	background-position: -144px -24px;
}

.icon-inbox {
	background-position: -168px -24px;
}

.icon-play-circle {
	background-position: -192px -24px;
}

.icon-repeat {
	background-position: -216px -24px;
}

.icon-refresh {
	background-position: -240px -24px;
}

.icon-list-alt {
	background-position: -264px -24px;
}

.icon-lock {
	background-position: -287px -24px;
}

.icon-flag {
	background-position: -312px -24px;
}

.icon-headphones {
	background-position: -336px -24px;
}

.icon-volume-off {
	background-position: -360px -24px;
}

.icon-volume-down {
	background-position: -384px -24px;
}

.icon-volume-up {
	background-position: -408px -24px;
}

.icon-qrcode {
	background-position: -432px -24px;
}

.icon-barcode {
	background-position: -456px -24px;
}

.icon-tag {
	background-position: 0 -48px;
}

.icon-tags {
	background-position: -25px -48px;
}

.icon-book {
	background-position: -48px -48px;
}

.icon-bookmark {
	background-position: -72px -48px;
}

.icon-print {
	background-position: -96px -48px;
}

.icon-camera {
	background-position: -120px -48px;
}

.icon-font {
	background-position: -144px -48px;
}

.icon-bold {
	background-position: -167px -48px;
}

.icon-italic {
	background-position: -192px -48px;
}

.icon-text-height {
	background-position: -216px -48px;
}

.icon-text-width {
	background-position: -240px -48px;
}

.icon-align-left {
	background-position: -264px -48px;
}

.icon-align-center {
	background-position: -288px -48px;
}

.icon-align-right {
	background-position: -312px -48px;
}

.icon-align-justify {
	background-position: -336px -48px;
}

.icon-list {
	background-position: -360px -48px;
}

.icon-indent-left {
	background-position: -384px -48px;
}

.icon-indent-right {
	background-position: -408px -48px;
}

.icon-facetime-video {
	background-position: -432px -48px;
}

.icon-picture {
	background-position: -456px -48px;
}

.icon-pencil {
	background-position: 0 -72px;
}

.icon-map-marker {
	background-position: -24px -72px;
}

.icon-adjust {
	background-position: -48px -72px;
}

.icon-tint {
	background-position: -72px -72px;
}

.icon-edit {
	background-position: -96px -72px;
}

.icon-share {
	background-position: -120px -72px;
}

.icon-check {
	background-position: -144px -72px;
}

.icon-move {
	background-position: -168px -72px;
}

.icon-step-backward {
	background-position: -192px -72px;
}

.icon-fast-backward {
	background-position: -216px -72px;
}

.icon-backward {
	background-position: -240px -72px;
}

.icon-play {
	background-position: -264px -72px;
}

.icon-pause {
	background-position: -288px -72px;
}

.icon-stop {
	background-position: -312px -72px;
}

.icon-forward {
	background-position: -336px -72px;
}

.icon-fast-forward {
	background-position: -360px -72px;
}

.icon-step-forward {
	background-position: -384px -72px;
}

.icon-eject {
	background-position: -408px -72px;
}

.icon-chevron-left {
	background-position: -432px -72px;
}

.icon-chevron-right {
	background-position: -456px -72px;
}

.icon-plus-sign {
	background-position: 0 -96px;
}

.icon-minus-sign {
	background-position: -24px -96px;
}

.icon-remove-sign {
	background-position: -48px -96px;
}

.icon-ok-sign {
	background-position: -72px -96px;
}

.icon-question-sign {
	background-position: -96px -96px;
}

.icon-info-sign {
	background-position: -120px -96px;
}

.icon-screenshot {
	background-position: -144px -96px;
}

.icon-remove-circle {
	background-position: -168px -96px;
}

.icon-ok-circle {
	background-position: -192px -96px;
}

.icon-ban-circle {
	background-position: -216px -96px;
}

.icon-arrow-left {
	background-position: -240px -96px;
}

.icon-arrow-right {
	background-position: -264px -96px;
}

.icon-arrow-up {
	background-position: -289px -96px;
}

.icon-arrow-down {
	background-position: -312px -96px;
}

.icon-share-alt {
	background-position: -336px -96px;
}

.icon-resize-full {
	background-position: -360px -96px;
}

.icon-resize-small {
	background-position: -384px -96px;
}

.icon-plus {
	background-position: -408px -96px;
}

.icon-minus {
	background-position: -433px -96px;
}

.icon-asterisk {
	background-position: -456px -96px;
}

.icon-exclamation-sign {
	background-position: 0 -120px;
}

.icon-gift {
	background-position: -24px -120px;
}

.icon-leaf {
	background-position: -48px -120px;
}

.icon-fire {
	background-position: -72px -120px;
}

.icon-eye-open {
	background-position: -96px -120px;
}

.icon-eye-close {
	background-position: -120px -120px;
}

.icon-warning-sign {
	background-position: -144px -120px;
}

.icon-plane {
	background-position: -168px -120px;
}

.icon-calendar {
	background-position: -192px -120px;
}

.icon-random {
	background-position: -216px -120px;
}

.icon-comment {
	background-position: -240px -120px;
}

.icon-magnet {
	background-position: -264px -120px;
}

.icon-chevron-up {
	background-position: -288px -120px;
}

.icon-chevron-down {
	background-position: -313px -119px;
}

.icon-retweet {
	background-position: -336px -120px;
}

.icon-shopping-cart {
	background-position: -360px -120px;
}

.icon-folder-close {
	background-position: -384px -120px;
}

.icon-folder-open {
	background-position: -408px -120px;
}

.icon-resize-vertical {
	background-position: -432px -119px;
}

.icon-resize-horizontal {
	background-position: -456px -118px;
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
<!-- <div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button data-target=".navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle collapsed">
        <span class="sr-only">折叠</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="#" class="navbar-brand hidden-sm">SMDiary</a>
    </div>
    <div role="navigation" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
 			<li class="active"><a href="#">首页</a></li>
			<li><a href="#">日记</a></li>
			<li><a href="#">分类</a></li>
			<li><a href="#">分享</a></li>
			<li><a href="#">其它</a></li>
			<li><a href="#">设置</a></li>
       </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">关于</a></li>
      </ul>
    </div>
  </div>
</div>

http://v3.bootcss.com/css/#type-headings
 -->
 <header role="banner" id="top" class="navbar navbar-static-top bs-docs-nav">
  <div class="container">
    <div class="navbar-header">
      <button data-target=".bs-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle collapsed">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">SMDiary</a>
    </div>
    <nav role="navigation" class="collapse navbar-collapse bs-navbar-collapse">
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
 
  
<!-- 	<div class="navbar navbar-default">
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
 -->
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