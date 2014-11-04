<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><fmt:message key="blog_title" /></title>
<meta name="description" content="Ken.Zheng 郑超  个人博客网页">
<meta name="viewport" content="width=device-width">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/ken/images/kenicon.ico" />
<link href="${pageContext.request.contextPath}/resources/blog/index.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/blog/css/blog-home.css"
	rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script
		src="${pageContext.request.contextPath}/resources/blog/sm.js"></script>
<script type="text/javascript">
	function deleteDiary(id) {
		sm.ajax.request({
			url : "${pageContext.request.contextPath}/db/delete/" + id,
			method : 'POST',
			data : {
				datatype : ''
			},
			success : function(xhr) {
				data = JSON.parse(xhr.responseText)
				if (data.flag) {
					sm.pop('删除成功');
					sm.go("${pageContext.request.contextPath}/db/");
				} else {
					sm.pop('删除失败，请重试！');
				}
			}
		});
	}
	function modDiary(id) {
		sm.ajax.request({
			url : "${pageContext.request.contextPath}/db/mod/" + id,
			method : 'POST',
			data : {
				datatype : ''
			},
			success : function(xhr) {
				data = JSON.parse(xhr.responseText)
				if (data.flag) {
					sm.pop('修改成功');
					sm.go("${pageContext.request.contextPath}/db/");
				} else {
					sm.pop('删除失败，请重试！');
				}
			}
		});
	}
	function setToday(thisday) {
		var now = new Date();
		var month = now.getMonth() + 1; //月
		var day = now.getDate(); //日
		var ds = now.getFullYear() + "-";
		if (month < 10)
			ds += "0";
		ds = ds + month + "-";
		if (day < 10)
			ds += "0";
		ds += day;
		sm.get(thisday).value = ds;
	}
	Date.prototype.toString = function(showWeek) {
		var myDate = this;
		var str = myDate.toLocaleDateString();
		if (showWeek) {
			var Week = [ '日', '一', '二', '三', '四', '五', '六' ];
			str += ' 星期' + Week[myDate.getDay()];
		}
		return str;
	}
</script>
</head>
<body>
<!-- check legal  -->
<c:choose>
	<c:when test="${MD == null or page == null}">
		<jsp:forward page="db"></jsp:forward>
	</c:when> 
</c:choose>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only"><fmt:message key="blog_togger" /></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><fmt:message key="blog_title" /></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/db"><fmt:message key="Index" /></a></li>
					<li><a href="${pageContext.request.contextPath}/db"><fmt:message key="Blog" /></a></li>
					<li><a href="${pageContext.request.contextPath}/#about"><fmt:message key="about" /></a></li>
					<li><a href="${pageContext.request.contextPath}/#resume"><fmt:message key="rs" /></a></li>
					<li><a href="${pageContext.request.contextPath}/#contact"><fmt:message key="contact" /></a></li>
					<c:choose> 
					<c:when  test="${sessionScope.admin == null}">
						<li><a href="${pageContext.request.contextPath}/index/login"><fmt:message key="manage" /></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/index/doLogout"><fmt:message key="logout" /></a></li>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<h3 class="page-header">
					<fmt:message key="blog_list" /><small>&nbsp;&nbsp; <fmt:message key="blog_tip" /></small>
					<c:if test="${sessionScope.admin != null}">
						&nbsp;&nbsp; <a class="btn btn-primary"
							href="${pageContext.request.contextPath}/db/add"><fmt:message key="blog_addnew" /></a>
					</c:if>
				</h3>

				<!-- check MD choose begin -->
				<c:choose> 
					<c:when test="${MD == 'add' and sessionScope.admin != null}">
						<div class="well">
		                    <h4><fmt:message key="blog_addnew" />:</h4>
								<form action="${pageContext.request.contextPath}/db/doAdd" method="POST" name="diaryadd" role="form">
									<div class="form-group">
										<input placeholder="标题" class="form-control" style="width: 100%" name="outline" />
										<textarea class="form-control" rows="10" name="diarys"  placeholder="在此处填写内容"></textarea>
										<input class="form-control"  style="width: 50%" 	name="mood" placeholder="心情：心情不错"> 
										<input class="form-control" style="width: 50%" name="weather" placeholder="天气：晴"> 
										<input class="form-control" id="calendaradd" 	style="width: 50%" name="diaryDays"> 
										<input class="form-control" style="width: 100%"  name="categorys" placeholder="标签，以逗号或空格间隔">
									</div>						
									<button type="submit" class="btn btn-primary"><fmt:message key="blog_submit" /></button>
									<button type="reset" class="btn btn-primary"><fmt:message key="blog_reset" /></button>
								</form>
		                </div>
					</c:when>
					
					<c:when test="${MD == 'mod' and sessionScope.admin != null}">
					<div class="well">
		                    <h4><fmt:message key="blog_modify" />:</h4>
								<form action="${pageContext.request.contextPath}/db/doMod" method="POST" name="diarymod" role="form">
									<div class="form-group">
										<input type="hidden" name="uid" value="${diary.uid}">
										<input placeholder="标题" class="form-control" style="width: 100%" name="outline" value="${diary.outline}">
										<textarea class="form-control" rows="10" name="diarys"  placeholder="在此处填写内容">${diary.diary}</textarea>
										<input class="form-control"  style="width: 50%" 	name="mood" placeholder="心情：心情不错" value="${diary.mood}"> 
										<input class="form-control" style="width: 50%" name="weather" placeholder="天气：晴" value="${diary.weather}"> 
										<input class="form-control" id="calendaradd" 	style="width: 50%" name="diaryDays"  value="<fmt:formatDate value='${diary.diaryDay}' pattern='yyyy-MM-dd'/>"> 
										<input class="form-control" style="width: 100%"  name="categorys" placeholder="标签，以逗号或空格间隔"  value="${diary.categorys}">
									</div>						
									<button type="submit" class="btn btn-primary"><fmt:message key="blog_submit" /></button>
									<button type="reset" class="btn btn-primary"><fmt:message key="blog_reset" /></button>
								</form>
		                </div>
					</c:when>
					<c:otherwise>

				<!-- Blog List -->
				<c:if test="${page.data != null and page.data != '[]'}">
					<c:forEach var="d" items="${page.data}">
					<div class="diarysitem">
						<h3>
							<a href="#"><c:out value="${d.outline }"></c:out></a>
						</h3>
						<p>
							<span style="color: blue;"> <span class="glyphicon glyphicon-user"></span></span>
							<span style="font-style: italic;"><fmt:message key="postedby" /></span>
							<fmt:message key="name" />
							<span style="font-style: italic;"><fmt:message key="postedon" /></span>
							<!-- <span class="glyphicon glyphicon-calendar"></span> -->
							<span class="glyphicon glyphicon-time"></span>
							<fmt:formatDate value="${d.diaryDay }" />
							<span style="color: green;"><span class="glyphicon glyphicon-heart"></span></span>
							<c:out value="${d.mood}"></c:out>
							<span style="color: grey;"><span class="glyphicon glyphicon-cloud"></span></span>
							<c:out value="${d.weather}"></c:out>
							<!-- August 28, 2013 at 10:00 PM -->
						</p>
						<hr>
						<p>
							<c:out value="${d.diary }"></c:out>
						</p>
						<!-- <span class="icon-tags"></span> -->
						<span  style="color: green;" class="glyphicon glyphicon-tags"></span>
						<c:if test="${d.categorys != null}">
								<c:out value="${d.categorys }"></c:out>
						</c:if>
						<span style="color:red;font-style: italic"> &nbsp;&nbsp;
							<c:if test="${sessionScope.admin != null}">
								<span class="glyphicon glyphicon-edit"></span>
								<a href="${pageContext.request.contextPath}/db/mod/${d.uid}"><fmt:message key="modify" /></a>
								<span class="glyphicon glyphicon-remove-circle"></span>
								<a href="#" onclick="deleteDiary('${d.uid}')"><fmt:message key="delete" /></a>
							</c:if>
						</span>
						<!-- <a class="btn btn-primary" href="#">Read More <span
					class="glyphicon glyphicon-chevron-right"></span></a> -->
						<!-- <span class="icon-calendar"></span>
									<span class="icon-heart"></span>
									<span class="icon-star"></span> -->
						</div>
						<br/>
						<!-- <hr> --> 
					</c:forEach>
				</c:if>

				<!-- Pager
				<ul class="pager">
					<li class="previous"><a href="#">&larr; Older</a></li>
					<li class="next"><a href="#">Newer &rarr;</a></li>
				</ul>
				 -->

				<c:choose>
					<c:when test="${pagetype != 'tagpage' and pagetype != 'monthpage'}">
						<div class="margin-top-20" align="center">
							<ul class="pagination">
								<li><a
									href="${pageContext.request.contextPath}/db/page/1"><fmt:message key="firstPage" /></a></li>
								<c:forEach var="pageindex" begin="1" end="${page.totalPage }"
									step="1">
									<c:choose>
										<c:when test="${pageindex == page.startPage}">
											<li class="active"><a
												href="${pageContext.request.contextPath}/db/page/${pageindex}">${pageindex}</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${pageContext.request.contextPath}/db/page/${pageindex}">${pageindex}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li><a
									href="${pageContext.request.contextPath}/db/page/${page.totalPage }"><fmt:message key="lastPage" /></a></li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<!-- Blog List Done -->

			</c:otherwise>
		</c:choose>
			</div>

			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Blog Search Well -->
				<div class="well">
					<h4><fmt:message key="blog_search" /></h4>
					<div class="input-group">
						<input type="text" class="form-control"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
					<!-- /.input-group -->
				</div>

				<!-- Blog Categories Well -->
				<div class="well">
					<h4><fmt:message key="blog_cat" /></h4>
					<p>
						<c:choose>
							<c:when test="${catemap != null}">
								<c:forEach var="d" items="${catemap}">
									<!-- //String message = java.net.URLEncoder.encode("中文字符","utf-8"); -->
									<!-- <span class="icon-tags"></span> -->
									<span class="glyphicon glyphicon-tag"></span>
									<a
										href="${pageContext.request.contextPath}/db/tagpage/${d.key }/1"
										title="${d.key } 共 ${d.value }" target="_self"><c:out
											value="${d.key }"></c:out>(<c:out value="${d.value }"></c:out>)</a>&nbsp;&nbsp;
							</c:forEach>
							</c:when>
							<c:otherwise>
								NO Data
						</c:otherwise>
						</c:choose>
					</p>
				</div>

				<div class="well">
					<h4><fmt:message key="blog_month" /></h4>
					<div class="row">
						<div class="col-lg-6">
							<ul class="list-unstyled">
								<c:choose>
									<c:when test="${timemap != null}">
										<c:forEach var="d" items="${timemap}">
											<li>
											<span class="glyphicon glyphicon-calendar"></span>
											<a
												href="${pageContext.request.contextPath}/db/monthpage/${fn:replace(fn:replace(d.key, '月', ''), '年', '-')}/1"
												title="${d.key } 共 ${d.value }" target="_self"><c:out
														value="${d.key }"></c:out>(<c:out value="${d.value }"></c:out>)</a></li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										NO Data
								</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!-- /.col-lg-6 -->
					</div>
					<!-- /.row -->
				</div>
			</div>
		</div>
		<!-- /.row -->
		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>
						Copyright &copy; <a href="http://www.zhengchao.net.cn/"
							target="_blank" title="<fmt:message key='name' />"><fmt:message
								key="name" /></a> 2012-2014 V4 <a href="mailto:zh_chao@126.com">zh_chao@126.com</a>&nbsp;
					<a href="<%=request.getContextPath()%>/index/lang/cn/db" >中文</a>
					<a href="<%=request.getContextPath()%>/index/lang/us/db" >English</a>
						<%-- <a href="<%=request.getContextPath()%>">中文</a> <a
							href="<%=request.getContextPath()%>/?l=us">English</a> --%>
					&nbsp;<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253519983'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/stat.php%3Fid%3D1253519983' type='text/javascript'%3E%3C/script%3E"));</script>					
					<span style="vertical-align:bottom;float: left" >
						<img src="${pageContext.request.contextPath}/resources/img/poweredby-117-12px.gif" alt="Ken" ><!-- style="vertical-align:middle;display:tablecell;" -->
					</span>
					</p>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</footer>

	</div>
	<!-- /.container -->
	<script
		src="${pageContext.request.contextPath}/resources/jquery/jquery-1.10.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	if (sm.get("calendarmod") != null && sm.get("calendarmod").value == "") {
		setToday('calendarmod');
	}
	if (sm.get("calendaradd") != null) {
		setToday('calendaradd');
	}
</script>
</html>
