<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>shop</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Ken.Zheng 郑超  个人展示网页">
<meta name="viewport" content="width=device-width">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/ken/images/xgsmall.ico" />
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/mall/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/mall/css/prettyPhoto.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/mall/css/price-range.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/mall/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/mall/css/main.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/mall/css/responsive.css"
	rel="stylesheet">
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style type="text/css">
.social-icons  { 
    font-size: 10px;
}
.shop-menu ul li {
    display: inline-block;
    padding-left: 20px;
    padding-right: 20px; 
} 
.shop-menu ul li a { 
    font-size: 20px; 
}

</style>
</head>
<!--/head-->
<body>
	<header id="header">
		<!--header-->
		<div class="header_top">
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6 ">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href=""><i class="fa fa-phone"></i> +86
										13367******</a></li>
								<li><a href=""><i class="fa fa-envelope"></i>
										zh_chao@126.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-star"></i>收藏</a></li>
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i>
										已购</a></li>
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>
										购物车</a></li>
								<li><a href=""><i class="fa fa-star"></i>帮助 </a></li>
								<li><a href=""><i class="fa fa-star"></i>站点地图</a></li>
								<!-- <li><a href=""><i class="fa fa-user"></i>帐户</a></li> -->
								<li><a href="mall.jsp"><i class="fa fa-lock"></i> 登陆</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header_top-->

		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.html"> <img
								src="${pageContext.request.contextPath}/resources/mall/images/home/xglogo.png"
								alt="" />
							</a>
						</div>
						<div class="btn-group pull-right"></div>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="${pageContext.request.contextPath}/mall.jsp">首页</a></li> 
								<li><a href="${pageContext.request.contextPath}/mall.jsp" class="active">香菇</a></li>
								<!-- <li><a href="product-details.html">龙虾</a></li>
								<li><a href="checkout.html">中药药材</a></li> -->
								<!-- <li><a href="cart.html">农副产品</a></li> -->
								<li><a href="${pageContext.request.contextPath}/mall-build.jsp">投资建厂</a></li>
								<li><a href="${pageContext.request.contextPath}/mall-build.jsp">联系我</a></li>
							</ul>
						</div> 
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->
	</header>

	<section id="advertisement">
		<div class="container">
			<img
				src="${pageContext.request.contextPath}/resources/mall/images/shop/banner.png"
				alt="" />
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>产品</h2>
						<div class="panel-group category-products" id="accordian"> 
							<!-- <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#">龙虾</a>
									</h4>
								</div>
							</div> -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="${pageContext.request.contextPath}/mall.jsp">香菇</a>
									</h4>
								</div>
							</div>
							<!-- <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#">中等香菇</a>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#">花菇 </a>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#">爆款</a>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#">农副产品</a>
									</h4>
								</div>
							</div>  -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="${pageContext.request.contextPath}/mall-build.jsp">投资建厂</a>
									</h4>
								</div>
							</div>
						</div>
						<!--/category-productsr-->
					</div>
				</div>

				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">香菇 产品列表</h2>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img
											src="${pageContext.request.contextPath}/resources/mall/images/xg/xg-goog.png"
											alt="" />
										<h2>￥?/500g</h2>
										<p>普通</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>添加到购物车</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href=""><i class="fa fa-plus-square"></i>添加收藏</a></li>
										<li>分享 <i class="fa fa-facebook"></i>&nbsp;&nbsp;<i
											class="fa fa-twitter"></i>&nbsp;&nbsp;<i
											class="fa fa-google-plus"></i>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img
											src="${pageContext.request.contextPath}/resources/mall/images/xg/xg-better.png"
											alt="" />
										<h2>￥?/500g</h2>
										<p>高级</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>添加到购物车</a>
									</div>
									<img
										src="${pageContext.request.contextPath}/resources/mall/images/home/new.png"
										class="new" alt="" />
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href=""><i class="fa fa-plus-square"></i>添加收藏</a></li>
										<li>分享 <i class="fa fa-facebook"></i>&nbsp;&nbsp;<i
											class="fa fa-twitter"></i>&nbsp;&nbsp;<i
											class="fa fa-google-plus"></i>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img
											src="${pageContext.request.contextPath}/resources/mall/images/xg/xg-best.png"
											alt="" />
										<h2>￥?/500g</h2>
										<p>暴款</p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>添加到购物车</a>
									</div>
									<img
										src="${pageContext.request.contextPath}/resources/mall/images/home/sale.png"
										class="new" alt="" />
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href=""><i class="fa fa-plus-square"></i>添加收藏</a></li>
										<li>分享 <i class="fa fa-facebook"></i>&nbsp;&nbsp;<i
											class="fa fa-twitter"></i>&nbsp;&nbsp;<i
											class="fa fa-google-plus"></i>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div align="center">
							<ul class="pagination">
								<li class="active"><a href="">1</a></li>
								<!-- <li><a href="">2</a></li>
								<li><a href="">3</a></li> -->
								<!-- <li><a href="">&raquo;</a></li> -->
							</ul>
						</div>
					</div>
					<!--features_items-->
				</div>
			</div>
		</div>
	</section>

	<footer id="footer">
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2014 Ken. All rights reserved.</p>
					<p class="pull-right">
						<span> <a href="#">到Taobao上查看</a></span>
					</p>
				</div>
			</div>
		</div>

	</footer>
	<!--/Footer-->

	<script
		src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js "></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/jquery/jquery-1.10.2.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mall/js/price-range.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mall/js/jquery.scrollUp.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mall/js/jquery.prettyPhoto.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mall/js/main.js"></script>
</body>
</html>
