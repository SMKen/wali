<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="zh_CN" />
<%@ include file="diarydb.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>SMDairy</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Blog,Simple,smKen,ken">
<meta name="author" content="Ken">

<c:catch var="sqle">
	<c:if test="${param.email != null || param.pwd != null}">
		<sql:query dataSource="${db}" var="userList"
			sql="select * from smdiary_admin where email = ? and pwd = ?"
			scope="page">
			<sql:param value="${param.email}" />
			<sql:param value="${param.pwd}" />
		</sql:query>
		<c:choose>
			<c:when test="${userList.rowCount>0}">
				<c:set var="user" scope="session" value="${param.email}"/> 
				<script type="text/javascript">
					alert("${sessionScope.user}登陆成功!");
					self.location.href = "index.jsp";
				</script>
			</c:when>
			<c:otherwise>
				<c:remove var="user" scope="session" />
			</c:otherwise>
		</c:choose>
	</c:if>
</c:catch>

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
	function checkEmail(email) {
		var reg = new RegExp(
				"^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$");
		if (reg.test(email)) {
			return true;
		}
		return false;
	}
	function validate(str) {
		var regs = new RegExp("^[a-zA-Z0-9]{6,20}$");
		if (regs.test(str)) {
			return true;
		}
		return false;
	}
	function checkvalidate() {
		var user = document.login.email.value;//getElementById("email").value;
		var pwd = document.login.pwd.value;//.getElementById("pwd").value;
		//alert(user + "_" + pwd);
		if (!checkEmail(user) || !validate(pwd)) {
			alert("invalidate user or password");
			return false;
		} 
		document.login.submit();
	}
</script>
</head>
<%--如果登陆成功则直接进入 email pwd  onSubmit="return checkvalidate();"--%>
<div class="page-container">
	<div class="container margin-bottom-40">
		<div class="row">
			<div
				class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 login-signup-page">
				<form name="login" action="login.jsp" method="POST">
					<h2>登陆</h2>

					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"><i class="icon-envelope"></i></span>
						<input type="text" name="email" id="email" class="form-control"
							placeholder="邮箱" value="${param.email}" />
					</div>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"><i class="icon-remove-sign"></i></span>
						<input type="password" name="pwd" id="pwd" class="form-control"
							placeholder="密码" />
						<!-- <a href="#" class="login-signup-forgot-link">忘记?</a> -->
					</div>

					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="checkbox-list">
								<label class="checkbox"><input type="checkbox" /> 记住</label>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<!-- onclick="checkvalidate();" -->
							<button type="button" onclick="checkvalidate();"
								class="btn theme-btn pull-right">登陆</button>
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