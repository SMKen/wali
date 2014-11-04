<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose> 
<c:when  test="${sessionScope.lg == null}">
	<fmt:setBundle basename="messages_zh_CN" />
</c:when> 
<c:when  test="${sessionScope.lg ==  'us'}">
	<fmt:setBundle basename="messages_en_US" />
</c:when>
<c:otherwise>
	<fmt:setBundle basename="messages_zh_CN" />
</c:otherwise>
</c:choose>
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
<title>
<fmt:message key="title" />
</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Ken.Zheng 郑超  个人展示网页">
<meta name="viewport" content="width=device-width">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ken/images/kenicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ken/css/normalize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ken/css/main.css">

<script
	src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js "></script>
<script>
	window.jQuery
			|| document
					.write('<script src="${pageContext.request.contextPath}/resources/jquery/jquery-1.10.2.min.js"><\/script>')
</script>
<script src="${pageContext.request.contextPath}/resources/ken/js/vendor/jquery.hashchange.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ken/js/vendor/jquery.easytabs.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/ken/js/main.js"></script>
<!--[if lt IE 9]>
  	  <script src="http://cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
      <script>window.html5 || document.write('<script src="js/vendor/html5shiv.js"><\/script>')</script>
      <![endif]-->
</head>
<body class="bg-fixed bg-1">
	<!--[if lt IE 7]>
    You are using an <strong>outdated</strong> browser. Please upgrade your browser.
    <![endif]-->
	<div class="main-container">
		<div class="main wrapper clearfix">
			<!-- Header Start -->
			<header id="header">
				<div id="logo">
					<h2>
						<fmt:message key="name" />
					</h2>
					<h4>
						<fmt:message key="job" />
					</h4>
				</div>
			</header>
			<!-- Header End -->
			<!-- Main Tab Container -->
			<div id="tab-container" class="tab-container">
				<!-- Tab List -->
				<ul class='etabs'>
					<li class='tab' id="tab-about"><a href="#about"><i
							class="icon-user"></i><span><fmt:message key="about" /></span></a></li>
					<li class='tab'><a href="#resume"><i
							class="icon-file-text"></i><span><fmt:message key="rs" /></span></a></li>
					<li class='tab'><a href="#contact"><i
							class="icon-envelope"></i><span><fmt:message key="contact" /></span></a></li>
				</ul>
				<!-- End Tab List -->
				<div id="tab-data-wrap">
					<!-- About Tab Data -->
					<div id="about">
						<section class="clearfix">
							<div class="g2">
								<div class="photo">
									<img src="${pageContext.request.contextPath}/resources/ken/images/ken.jpg" alt="Ken">
								</div>
								<div class="info">
									<h2>
										<fmt:message key="name" />
									</h2>
									<h4>
										<fmt:message key="job" />
									</h4>
									<p>
										<fmt:message key="introduction" />
									</p>
								</div>
							</div>
							<div class="g1">
								<div class="main-links sidebar">
									<ul>
										<li><a href="#resume"><fmt:message key="vrs" /></a></li>
										<li><a href="#contact"><fmt:message key="contactm" /></a></li>
										<li><a href="${pageContext.request.contextPath}/db">Blog</a></li>
										<li><a href="#features"><fmt:message key="more" /></a></li>
									</ul>
								</div>
							</div>
							<div class="break"></div>
						</section>
						<!-- content -->
					</div>
					<!-- End About Tab Data -->
					<!-- Resume Tab Data -->
					<div id="resume">
						<section class="clearfix">
							<div class="g2">
								<h3>
									<fmt:message key="we" />
								</h3>
								<ul class="no-list work">
									<li>
										<h5>
											<fmt:message key="cp3" />
										</h5> <span class="label label-success">2013 ~ Now</span>
										<p>
											<fmt:message key="cp31" />
										</p>
									</li>
									<li>
										<h5>
											<fmt:message key="cp2" />
										</h5> <span class="label label-default">2011 ~ 2013</span>
										<p>
											<fmt:message key="cp21" />
										</p>
									</li>
									<li>
										<h5>
											<fmt:message key="cp1" />
										</h5> <span class="label label-warning">2010 ~ 2011</span>
										<p>
											<fmt:message key="cp11" />
										</p>
									</li>
								</ul>
								<h3>
									<fmt:message key="ed" />
								</h3>
								<ul class="no-list work">
									<li>
										<h5>
											<fmt:message key="ep1" />
										</h5> <span class="label label-success">2006 ~ 2010</span>
										<p>
											<fmt:message key="ep11" />
										</p>
									</li>
								</ul>
							</div>
							<div class="g1">
								<div class="sidebar">
									<h3>
										<fmt:message key="skill" />
									</h3>
									<h5>
										<fmt:message key="soft" />
									</h5>
									<div class="meter emerald">
										<span style="width: 90%"><span>Eclipse</span></span>
									</div>
									<div class="meter emerald">
										<span style="width: 65%"><span>Linux</span></span>
									</div>
									<div class="meter emerald">
										<span style="width: 65%"><span>SVN/CVS</span></span>
									</div>
									<div class="meter emerald">
										<span style="width: 80%"><span>Tomcat/Jboss</span></span>
									</div>
									<div class="meter asbestos">
										<span style="width: 50%"><span>Photoshop/Dreamweaver</span></span>
									</div>
									<div class="meter pomengrate">
										<span style="width: 65%"><span>Office/Visio/Project/MindManager</span></span>
									</div>
									<div class="break"></div>
									<h5>
										<fmt:message key="lag" />
									</h5>
									<div class="meter emerald">
										<span style="width: 82%"><span>J2SE</span></span>
									</div>
									<div class="meter emerald">
										<span style="width: 82%"><span>SSH</span></span>
									</div>
									<div class="meter emerald">
										<span style="width: 60%"><span>Groovy</span></span>
									</div>
									<div class="meter asbestos">
										<span style="width: 60%"><span>Python</span></span>
									</div>
									<div class="meter emerald">
										<span style="width: 90%"><span>SQL</span></span>
									</div>
									<div class="meter carrot">
										<span style="width: 80%"><span>MySql</span></span>
									</div>
									<div class="meter carrot">
										<span style="width: 70%"><span>Mssql/Oracle</span></span>
									</div>
									<div class="meter wisteria">
										<span style="width: 85%"><span>JS/ajax/jQuery</span></span>
									</div>
									<div class="meter emerald">
										<span style="width: 70%"><span>HTML/CSS</span></span>
									</div>
								</div>
							</div>
						</section>
					</div>
					<!-- Contact Tab Data -->
					<div id="contact">
						<section class="clearfix">
							<div class="g1">
								<div class="sny-icon-box">
									<div class="sny-icon">
										<i class="icon-globe"></i>
									</div>
									<div class="sny-icon-content">
										<h4>
											<fmt:message key="ad" />
										</h4>
										<p>
											<fmt:message key="add" />
										</p>
									</div>
								</div>
							</div>
							<div class="g1">
								<div class="sny-icon-box">
									<div class="sny-icon">
										<i class="icon-phone"></i>
									</div>
									<div class="sny-icon-content">
										<h4>
											<fmt:message key="tel" />
										</h4>
										<p>
											<fmt:message key="teld" />
										</p>
									</div>
								</div>
							</div>
							<div class="g1">
								<div class="sny-icon-box">
									<div class="sny-icon">
										<i class="icon-user"></i>
									</div>
									<div class="sny-icon-content">
										<h4>
											<fmt:message key="me" />
										</h4>
										<p>
											<fmt:message key="med" />
										</p>
									</div>
								</div>
							</div>
							<div class="break"></div>

						</section>
					</div>
					<!-- End Contact Data -->
				</div>
			</div>
			<!-- End Tab Container -->
			<footer>
				<p>
					Copyright &copy; <a href="http://www.zhengchao.net.cn/" target="_blank"
						title="<fmt:message key='name' />"><fmt:message key="name" /></a> 2012-2014 V4
					<%-- @Copyright <a href="http://www.zhengchao.net.cn/" target="_blank"
						title="<fmt:message key='name' />"><fmt:message key="name" /></a> --%>
					<a href="mailto:zh_chao@126.com">zh_chao@126.com</a>&nbsp;
					<%-- <a href="${pageContext.request.contextPath}" >中文</a>
					<a href="${pageContext.request.contextPath}/Ken.jsp?l=us" >English</a> --%>
					<a href="${pageContext.request.contextPath}/lang/cn/" >中文</a>
					<a href="${pageContext.request.contextPath}/lang/us/" >English</a>
					<a href="${pageContext.request.contextPath}/db"><fmt:message key="Blog" /></a>
					<a href="${pageContext.request.contextPath}/index/login"><fmt:message key="manage" /></a>
					&nbsp;<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253519983'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/stat.php%3Fid%3D1253519983' type='text/javascript'%3E%3C/script%3E"));</script>					
					<span style="vertical-align:bottom;float: left" >
						<img src="${pageContext.request.contextPath}/resources/img/poweredby-120-33px.png" alt="Ken" ><!-- style="vertical-align:middle;display:tablecell;" -->
					</span>
				</p>
			</footer>
		</div>
		<!-- #main -->
	</div>
	<!-- #main-container -->
</body>
</html>