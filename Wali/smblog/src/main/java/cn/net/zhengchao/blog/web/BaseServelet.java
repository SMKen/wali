package cn.net.zhengchao.blog.web;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 基本servlet.
 * 
 * @author zc
 * @since 2014-11-3
 */
public class BaseServelet extends HttpServlet {

	Logger logger  = LoggerFactory.getLogger(BaseServelet.class);

	/** session admin */
	protected static String SESSON_ADMIN = "admin";
	
	private static final long serialVersionUID = -8204263841007457665L;

	public BaseServelet() {
		super();
	}

	/**
	 * 获取请求的URL，/main/xxxx or /contextPath/main/xxxx
	 */
	String kGetReqUrl(HttpServletRequest request) {
		String requesturl = request.getRequestURI();
		logger.debug("request url is : "+requesturl);
		return requesturl;
	}

	/**
	 * 将url从mark截取，并按/来拆分字符串.
	 */
	String[] kGetReqParam(String url, String mark) {
		logger.debug("request url is : "+url+", mark is : "+mark);
		if (url == null || url.equals("") || !url.contains(mark)) {
			return new String[] {};
		}

		if (!url.endsWith("/")) {
			url += "/";
		}
		String a[] = url.substring(url.indexOf(mark) + mark.length()).split("/");
		logger.debug("params is  "+(a==null?"null":Arrays.asList(a)));
		return a;
	}

	/**
	 * 获取默认值，index从1开始.
	 */
	String kGetReqParamValue(String[] reqArr, int index , String defaultValue) { 
		if(reqArr == null || reqArr.length == 0 || reqArr.length < index)
		{
			return defaultValue;
		}
		
		return reqArr[index-1];
	}
	
	String mask = "smblog";
	
	String kGetMark(){
		return "/"+mask+"/";
	} 
	
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//		String requrl = request.getRequestURI();
//		mask = "main";
//		String reqParam [] = getReqParam(getReqUrl(request),getMark());
		/*System.out.println(Arrays.asList(str));

		String lg = request.getParameter("lg");
		String url = request.getParameter("url");

		if (lg != null && !lg.equals("") && lg.equals("us")) {
			request.getSession().setAttribute("lg", "us");
		} else {
			request.getSession().setAttribute("lg", "cn");
		}

		if (null == url || url.equals("") || url.equals("Ken")) {
			response.sendRedirect(request.getContextPath() + "/");
			// return "redirect:/";
		} else {
			response.sendRedirect(request.getContextPath() + "/" + url);
			// return "redirect:/"+url;
		}*/
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
