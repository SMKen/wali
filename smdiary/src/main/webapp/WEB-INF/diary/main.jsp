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
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/sm.js"></script>
<script type="text/javascript">
function deleteDiary(id) {
	sm.ajax.request({
		url : "${pageContext.request.contextPath}/diary/delete/"+id,
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
		url : "${pageContext.request.contextPath}/diary/mod/"+id,
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
function setToday(thisday)
{
	var now = new Date();
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日
    var ds = now.getFullYear() + "-";
    if(month < 10)
    	ds += "0";
    ds = ds + month + "-";
    if(day < 10)
    	ds += "0";
    ds += day;
    sm.get(thisday).value=ds;
}
Date.prototype.toString = function(showWeek)  
{   
    var myDate= this;  
    var str = myDate.toLocaleDateString();  
    if (showWeek)  
    {   
        var Week = ['日','一','二','三','四','五','六'];  
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
					<li id="active"><a href="#"><span class="icon-home"></span>首页</a></li>
					<li><a href="#"><span class="icon-cog"></span>设置</a></li>
					<li><a href="#"><span class="icon-list-alt"></span>关于</a></li>
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
							<textarea rows="10" cols="20" name="diary">在此处填写内容</textarea>
							<div class="dateview">
								<span class="icon-heart"></span><span class="icon-star"></span>
									<span class="icon-calendar"></span>
									<input id="calendaradd" style="width: 80px" name="diaryDay">
									<span class="icon-tags"></span>
									<input style="width: 200px" name="categorys"> <br />
								<button type="submit" class="btn">保存</button>
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
								<input type="hidden" name="uid" value="${diary.uid}">
								标题:<input style="width: 80%" name="outline"  value="${diary.outline}">
								<textarea rows="10" cols="20" name="diary">${diary.diary}</textarea>
							<div class="dateview">
								<span class="icon-heart"></span><span class="icon-star"></span>
								<span class="icon-calendar"></span>选择时间
								<input id="calendarmod" style="width: 80px" name="diaryDay">
								<span class="icon-tags"></span><input
									style="width: 200px" name="categorys"  value="${diary.categorys}"> <br />
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
							<c:when test="${diarys != null}">
								<c:forEach var="d" items="${diarys}">
									<fmt:setLocale value="zh_cn" />  
									<h3>
										<c:out value="${d.outline }"></c:out> &nbsp;&nbsp;<fmt:formatDate value="${d.diaryDay }" />  
									</h3>
									<div class='itemcontent'>
										<c:out value="${d.diary }"></c:out>
										<br /> <a title="/" href="/" target="_blank" class="readmore">阅读>></a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="readmore" href="${pageContext.request.contextPath}/diary/mod/${d.uid}">修改</a>
										<a class="readmore" onclick="deleteDiary('${d.uid}')">删除</a>
									</div>
									<div class="dateview">
										<span class="icon-heart"></span><span class="icon-star"></span>
										<span class="icon-calendar"></span><fmt:formatDate value="${d.createTime }" type="both" dateStyle="default" />
										<span class="icon-tags"></span><c:out value="${d.categorys }"></c:out>
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
	<div class="footer">
		<div>
			Copyright © 2014 <a href="mailto:zh_chao@126.com">Ken</a>, All Rights
			Reserved.
		</div>
	</div>
</body>
<script type="text/javascript">
if(sm.get("calendarmod") !=null && sm.get("calendarmod").value=="")
{
	setToday('calendarmod');
}
if(sm.get("calendaradd") !=null)
{
	setToday('calendaradd');
}
</script>
</html>