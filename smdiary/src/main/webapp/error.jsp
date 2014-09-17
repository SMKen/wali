<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary</title>
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body>
	<%
		int statusCode = (Integer) request
				.getAttribute("javax.servlet.error.status_code");
		String message = (String) request
				.getAttribute("javax.servlet.error.message");
		String servletName = (String) request
				.getAttribute("javax.servlet.error.servlet_name");
		String uri = (String) request
				.getAttribute("javax.servlet.error.request_uri");
		Throwable t = (Throwable) request
				.getAttribute("javax.servlet.error.exception");
		if (statusCode == 404)
			out.print("对不起，你访问的资源不存在。");
		else if (statusCode == 405)
			out.print("对不起，你访问的资源受限。");
		else if (statusCode == 500)
			out.print("对不起，服务器内部出现错误");
		else
			out.print("对不起，未知服务器错误。");
	%>
</body>
<script type="text/javascript">
	function redirectIndex() {
		window.location.href = '${pageContext.request.contextPath}';
	}
	//window.setTimeout(redirectIndex, 5000)
</script>
</html>