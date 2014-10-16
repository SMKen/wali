<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary</title>
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<style type="text/css">
.loginform {
	width: 300px;
	margin: 0 auto;
	padding: 4;
	background: none repeat scroll 0 0 #fefefe;
	border: 1px solid #e0dede;
	box-shadow: 0 0 3px #e0dede;
	padding: 10px 30px 30px;
}

.form-control {
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 1px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
	color: #555;
	display: block;
	font-size: 14px;
	height: 24px;
	line-height: 1.2;
	padding: 4px;
	width: 90%;
	transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s
		ease-in-out 0s;
}

.btn {
	-moz-user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 2px;
	cursor: pointer;
	display: inline-block;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.2;
	margin-bottom: 0;
	padding: 4px;
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
}
</style>
</head>
<body>
	<div class="loginform">
		<form action="${pageContext.request.contextPath}/index/doLogin"
			method="POST">
			<h2>登陆到Diary</h2>
			<input type="text" name="email" id="email" class="form-control"
				placeholder="邮箱" value="${email }" /> <input type="password"
				name="pwd" id="pwd" class="form-control" placeholder="密码" /> <br />
			<button type="submit" class="btn">登陆</button>
			<button type="reset" class="btn">重置</button>
			<br />
			<c:if test="${msg != null}">
				<font color="red">${msg }</font>
			</c:if>
		</form>
	</div>
</body>
</html>