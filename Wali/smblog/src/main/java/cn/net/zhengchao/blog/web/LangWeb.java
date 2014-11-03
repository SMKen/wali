package cn.net.zhengchao.blog.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 语言设定 Web.
 * 
 * @author zc
 * @see 2014-11-3
 */
public class LangWeb extends BaseServelet {

	private static final long serialVersionUID = -3798714636190011663L;

	public LangWeb() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		/**折分URL*/
		mask = "lang";//  /lang/us/db
		String reqParam [] = kGetReqParam(kGetReqUrl(request),kGetMark());
		String lang = kGetReqParamValue(reqParam, 1, "cn");
		String redirectPath = kGetReqParamValue(reqParam, 2, "/");

		request.getSession().setAttribute("lg", lang);
		response.sendRedirect(request.getContextPath() + redirectPath);
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
