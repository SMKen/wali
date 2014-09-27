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
<style type="text/css">
.margin-top-20 {
	margin-top: 20px !important;
}

.pagination {
	margin: 10px 0;
}

.pagination {
	border-radius: 4px;
	display: inline-block;
	margin: 20px 0;
	padding-left: 0;
}

.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover,
	.pagination>.active>span:hover, .pagination>.active>a:focus,
	.pagination>.active>span:focus {
	background-color: #428bca;
	border-color: #428bca;
	color: #fff;
	cursor: default;
	z-index: 2;
}

.pagination>li {
	float: left;
}

.pagination>li>a, .pagination>li>span {
	background-color: #fff;
	border: 1px solid #ddd;
	float: left;
	line-height: 1.42857;
	margin-left: -1px;
	padding: 6px 12px;
	position: relative;
	text-decoration: none;
}

a {
	color: #0da3e2;
}

a, a:focus, a:hover, a:active {
	outline: 0 none;
}

div, input, select, textarea, span, img, table, td, th, p, a, button, ul,
	code, pre, li {
	border-radius: 0 !important;
}

a {
	color: #428bca;
	text-decoration: none;
}

a {
	background: none repeat scroll 0 0 transparent;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/js/sm.js"></script>
<script type="text/javascript">
	function deleteDiary(id) {
		sm.ajax.request({
			url : "${pageContext.request.contextPath}/diary/delete/" + id,
			method : 'POST',
			data : {
				datatype : ''
			},
			success : function(xhr) {
				data = JSON.parse(xhr.responseText)
				if (data.flag) {
					sm.pop('删除成功');
					sm.go("${pageContext.request.contextPath}/diary/");
				} else {
					sm.pop('删除失败，请重试！');
				}
			}
		});
	}
	function modDiary(id) {
		sm.ajax.request({
			url : "${pageContext.request.contextPath}/diary/mod/" + id,
			method : 'POST',
			data : {
				datatype : ''
			},
			success : function(xhr) {
				data = JSON.parse(xhr.responseText)
				if (data.flag) {
					sm.pop('删除成功');
					sm.go("${pageContext.request.contextPath}/diary/");
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
	<!-- head begin -->
	<div class="top">
		<div class="header">
			<div class="title">Diary</div>
			<div class="nav">
				<ul>
					<li id="active"><a
						href="${pageContext.request.contextPath}/diary/"><span
							class="icon-home"></span>首页</a></li>
					<li><a href="${pageContext.request.contextPath}/diary/"><span
							class="icon-cog"></span>设置</a></li>
					<li><a href="${pageContext.request.contextPath}/diary/"><span
							class="icon-list-alt"></span>关于</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- head end -->

	<div class="container">
		<div class="content">
			<!-- check MD choose begin -->
			<c:choose>
				<c:when test="${MD == 'add'}">
					<span class="icon-th-list"></span>日记列表&nbsp;&nbsp; <a href="#">管理</a>
					<!-- itemlist begin -->
					<div class="itemlist">
						<form action="${pageContext.request.contextPath}/diary/doadd"
							method="POST" name="diaryadd">
							标题:<input style="width: 80%" name="outline" />
							<textarea rows="10" cols="20" name="diarys">在此处填写内容</textarea>
							<div class="dateview">
								<span class="icon-heart"></span> <input style="width: 80px"
									name="mood" value="心情不错"> <span class="icon-star"></span>
								<input style="width: 80px" name="weather" value="晴"> <span
									class="icon-calendar"></span> <input id="calendaradd"
									style="width: 80px" name="diaryDays"> <span
									class="icon-tags"></span> <input style="width: 200px"
									name="categorys"> <br />
								<button type="submit" class="btn">保存</button>
								<!-- <button type="submit" class="btn btn-primary">Save changes</button>
					            <button class="btn">Cancel</button> -->
							</div>
						</form>
					</div>
				</c:when>

				<c:when test="${MD == 'mod'}">
					<span class="icon-th-list"></span>日记列表&nbsp;&nbsp; <a href="#">管理</a>
					<!-- itemlist begin -->
					<div class="itemlist">
						<form action="${pageContext.request.contextPath}/diary/doMod"
							method="POST" name="diarymod">
							<input type="hidden" name="uid" value="${diary.uid}"> 标题:<input
								style="width: 80%" name="outline" value="${diary.outline}">
							<textarea rows="10" cols="20" name="diarys">${diary.diarys}</textarea>
							<div class="dateview">
								<span class="icon-heart"></span> <input style="width: 80px"
									name="mood" value="${diary.mood}"> <span
									class="icon-star"></span> <input style="width: 80px"
									name="weather" value="${diary.weather}"> <span
									class="icon-calendar"></span> <input id="calendarmod"
									style="width: 80px" name="diaryDays" value="${diary.diaryDay}">
								<span class="icon-tags"></span> <input style="width: 200px"
									name="categorys" value="${diary.categorys}"> <br />
								<button type="submit" class="btn">保存</button>
							</div>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<span class="icon-th-list"></span>日记列表&nbsp;&nbsp; <a
						href="${pageContext.request.contextPath}/diary/add">新增</a>
					<c:if test="${msg != null}">
						<font color="red">${msg }</font>
					</c:if>
					<!-- itemlist begin -->
					<div class="itemlist">
						<c:choose>
							<c:when test="${page.data != null and page.data != '[]'}">
								<c:forEach var="d" items="${page.data}">
									<fmt:setLocale value="zh_cn" />
									<div class="diarysitem">
										<!-- <h3></h3> -->
										<div class="dtitle">
											<div class="dtitleleft">
												<c:out value="${d.outline }"></c:out>
											</div>
											<div class="dtitleright">
												<span class="icon-calendar"></span>
												<fmt:formatDate value="${d.diaryDay }" />
												<span class="icon-heart"></span>
												<c:out value="${d.mood}"></c:out>
												<span class="icon-star"></span>
												<c:out value="${d.weather}"></c:out>
											</div>
										</div>
										<div class='itemcontent'>
											<c:out value="${d.diarys }"></c:out>
											<br />
											<!-- <a title="/" href="/" target="_blank" class="readmore">阅读>></a>&nbsp;&nbsp;&nbsp;&nbsp; -->

										</div>
										<div class="dbo">
											<%-- <span class="icon-calendar"></span><fmt:formatDate value="${d.createTime }" type="both" dateStyle="default" /> --%>
											<div class="dtitleleft">
												<span class="icon-tags"></span>
												<c:out value="${d.categorys }"></c:out>
											</div>
											<div class="dtitleright">
												<a class="readmore"
													href="${pageContext.request.contextPath}/diary/mod/${d.uid}">修改</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a class="readmore"
													onclick="deleteDiary('${d.uid}')">删除</a>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="clear"></div>
								<!-- paging list -->
								
									<c:choose>
									<c:when test="${pagetype != 'tagpage' and pagetype != 'monthpage'}"> 
											<div class="margin-top-20" align="center">
												<ul class="pagination">
													<li><a
														href="${pageContext.request.contextPath}/diary/page/1">首页</a></li>
													<c:forEach var="pageindex" begin="1" end="${page.totalPage }" step="1">
														<c:choose>
															<c:when test="${pageindex == page.startPage}">
																<li class="active"><a
																	href="${pageContext.request.contextPath}/diary/page/${pageindex}">${pageindex}</a></li>
															</c:when>
															<c:otherwise>
																<li><a
																	href="${pageContext.request.contextPath}/diary/page/${pageindex}">${pageindex}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<li><a
														href="${pageContext.request.contextPath}/diary/page/${page.totalPage }">末页</a></li>
												</ul>
											</div>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<div
									style="font: red; margin-top: 20px; text-align: center; color: red;">
									NO Diary</div>
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
								<li><a
									href="${pageContext.request.contextPath}/diary/monthpage/${fn:replace(fn:replace(d.key, '月', ''), '年', '-')}/1"
									title="${d.key } 共 ${d.value }" target="_self"><c:out
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
								<!-- //String message = java.net.URLEncoder.encode("中文字符","utf-8"); -->
								<li><a
									href="${pageContext.request.contextPath}/diary/tagpage/${d.key }/1"
									title="${d.key } 共 ${d.value }" target="_self"><c:out
											value="${d.key }"></c:out>(<c:out value="${d.value }"></c:out>)</a></li>

								<%-- <li><a href="/" title="123" target="_blank"><c:out
											value="${d.key }"></c:out>(<c:out value="${d.value }"></c:out>)</a></li> --%>
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
	<div class="footer">
		<div>
			Copyright © 2014 <a href="mailto:zh_chao@126.com">Ken</a>, All Rights
			Reserved.
		</div>
	</div>
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