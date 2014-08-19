<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="zh_CN" />

<%@ include file="resource/jsp/diarydb.jsp"%>
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
<style type="text/css">
.login-signup-page {
	padding: 50px auto 30px;
}

.login-signup-page form {
	background: #FEFEFE;
	border: 1px solid #E0DEDE;
	box-shadow: 0 0 3px #E0DEDE;
	padding: 10px 30px 30px;
}

.login-signup-page h2 {
	margin-bottom: 15px;
}

.login-signup-page .input-group {
	position: relative;
}

.login-signup-page .login-signup-forgot-link {
	position: absolute;
	right: 12px;
	top: 7px;
	font-size: 14px;
}

.login-signup-page .checkbox {
	padding-left: 0;
}
</style>
<script type="text/javascript">
	function CheckEmail(email) {
		return eregi(
				"^[0-9a-z][a-z0-9._-]{1,}@[a-z0-9-]{1,}[a-z0-9].[a-z.]{1,}[a-z]$",
				email);
	}
	function validate(str) {
		return eregi("^[0-9a-zA-Z@]$", str);
	}
	function checkvalidate() {
		var user = document.getElementById("email").value;
		var pwd = document.getElementById("pwd").value;
		alert(user + "_" + pwd);
		if (!validate(user) || !validate(pwd)) {
			alert("invalidate");
			return false;
		}
		return false;
	}
</script>
</head>
<%--如果登陆成功则直接进入 email pwd--%>
<c:out value="${param.email}" default="Nothing" />
<c:out value=" ${param.pwd} " default="Nothing" />
<div class="page-container">
	<div class="container margin-bottom-40">
		<div class="row">
			<div
				class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 login-signup-page">
				<form action="login.jsp" method="POST"
					onsubmit="return checkvalidate();">
					<h2>登陆</h2>

					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"><i class="icon-envelope"></i></span>
						<input type="text" name="email" id="email" class="form-control"
							placeholder="邮箱">
					</div>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"><i class="icon-remove-sign"></i></span>
						<input type="password" name="pwd" id="pwd" class="form-control"
							placeholder="密码">
						<!-- <a href="#" class="login-signup-forgot-link">忘记?</a> -->
					</div>

					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="checkbox-list">
								<label class="checkbox"><input type="checkbox">
									记住</label>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<button type="submit" class="btn theme-btn pull-right">登陆</button>
						</div>
					</div>
					<hr>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>