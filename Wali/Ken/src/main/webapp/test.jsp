<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary</title>
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<script type="text/javascript" src="resource/js/sm.js"></script>
</head>
<body>
<script type="text/javascript">
	var str = '{"name":"jack"}';
	var obj = JSON.parse(str);
	console.log(str);
	console.log(obj);
	console.log(obj.name);
	sm.ajax.request({
		url : "diary/delete/id",
		method:'POST',
		data : {
			datatype :''
		},
		success : function(xhr) {
			console.log(xhr.responseText);
			console.log(JSON.parse(xhr.responseText));
		},
		error : function(xhr) {
			
		}
	});
	
</script>
</body>
</html>