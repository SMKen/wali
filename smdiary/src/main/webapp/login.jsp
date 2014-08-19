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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Blog,Simple,smKen,ken">
<meta name="author" content="Ken">

<c:catch var="sqle"> 
	<sql:query dataSource="${db}" var="userList"
		sql="select * from smdiary_admin where email = ? and pwd = ?"
		scope="page">
		<sql:param value="${param.email}" />
		<sql:param value="${param.pwd}" />
	</sql:query>
	<c:if test="${userList.rowCount>0}">
	<%-- <c:set  var="alias"  value="Eric"  scope="session"  />
	<c:out  value="${sessionScope.currentUser.username"  />
	 --%>
	<script type="text/javascript">
			function getCookie(name) {  
				var nameEQ = name + "=";  
				var ca = document.cookie.split(';');    //把cookie分割成组  
				for(var i=0;i < ca.length;i++) {  
					var c = ca[i];                      //取得字符串  
					while (c.charAt(0)==' ') {          //判断一下字符串有没有前导空格  
						c = c.substring(1,c.length);      //有的话，从第二位开始取  
					}  
					if (c.indexOf(nameEQ) == 0) {       //如果含有我们要的name  
						return unescape(c.substring(nameEQ.length,c.length));    //解码并截取我们要值  
					}  
				}  
				return false;  
			}  
				  
			//清除cookie  
			function clearCookie(name) {  
				setCookie(name, "", -1);  
			}  
			  
			//设置cookie  
			function setCookie(name, value, seconds) {  
				seconds = seconds || 0;   //seconds有值就直接赋值，没有为0，这个根php不一样。  
				var expires = "";  
				if (seconds != 0 ) {      //设置cookie生存时间  
					var date = new Date();  
					date.setTime(date.getTime()+(seconds*1000));  
					expires = "; expires="+date.toGMTString();  
				}  
				document.cookie = name+"="+escape(value)+expires+"; path=/";   //转码并赋值  
			}  
			//调用一下上面方法： 查看复制打印?
			setCookie("test","tank",1800);         //设置cookie的值，生存时间半个小时  
			alert(getCookie('test'));                     //取得cookie的值，显示tank  
			clearCookie("test");                           //删除cookie的值  
			alert(getCookie('test'));                     //test对应的cookie值为空，显示为false.就是getCookie最后返的false值。
			setCookie("smdiary_user","${param.email}",3600*24*30);   
			self.location.href ="index.jsp";
	</script>
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
		var reg = new RegExp("^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$");
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
	function checkvalidate(){
		var user = document.login.email.value;//getElementById("email").value;
		var pwd = document.login.pwd.value;//.getElementById("pwd").value;
		//alert(user + "_" + pwd);
		if (!checkEmail(user) || !validate(pwd)) {
			alert("invalidate user or password");
			return false;
		} 
		console.log("OK");
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