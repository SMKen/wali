<%
	String ip = request.getHeader("x-forwarded-for");
	if (ip == null || ip.length() == 0
			|| "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("Proxy-Client-IP");
	}
	if (ip == null || ip.length() == 0
			|| "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("WL-Proxy-Client-IP");
	}
	if (ip == null || ip.length() == 0
			|| "unknown".equalsIgnoreCase(ip)) {
		ip = request.getRemoteAddr();
	} 
	
	request.setAttribute("ip",ip); 
	//request.getSession().setAttribute("ip",ip); 
%>