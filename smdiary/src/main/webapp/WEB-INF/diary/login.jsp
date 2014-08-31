<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form commandName="admin">
		<form:hidden path="id" />
		<ul>
			<li><form:label path="email">邮箱:</form:label> <form:input
					path="email" /></li>
			<li><form:label path="pwd">密码:</form:label> <form:password
					path="pwd" /></li>
			<li>
				<button type="submit">登录</button>
				<button type="reset">重置</button>
			</li>
		</ul>
	</form:form>
</body>
</html>