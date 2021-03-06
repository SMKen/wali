package cn.net.zhengchao.blog.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;

import cn.net.zhengchao.blog.dao.IndexDao;
import cn.net.zhengchao.blog.vo.AdminVo;
import cn.net.zhengchao.blog.vo.SmDiaryAdmin;

/**
 * index Web.
 * 
 * @author zc
 * @see 2014-11-3
 */
public class IndexWeb extends BaseServelet
{

	private static final long serialVersionUID = -3798714636190011663L;

	public IndexWeb()
	{
		super();
		logger = LoggerFactory.getLogger(IndexWeb.class);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		mask = "index";// /lang/us/db
		logger.debug("request url is : " + kGetReqUrl(request));
		String reqParam[] = kGetReqParam(kGetReqUrl(request), kGetMark());
		String lang = kGetReqParamValue(reqParam, 1, "login");
		if (lang.equals("doLogout") || lang.equals("logout"))
		{
			request.getSession().removeAttribute(SESSON_ADMIN);
			logger.debug("logout remove session : " + request.getSession().getAttribute(SESSON_ADMIN));
			response.sendRedirect(request.getContextPath() + "/db/page/1/");
		} else if (lang.equals("doLogin"))
		{
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");

			logger.debug("request url xxx is : " + kGetReqUrl(request));
			SmDiaryAdmin ad = new IndexDao().login(email, pwd);
			if (ad != null)
			{
				ad.setPwd("***");
				AdminVo av = new AdminVo(ad.getUid(), ad.getName(), ad.getLv());
				// mm.addAttribute("admins", ad);
				request.getSession().setAttribute(SESSON_ADMIN, av);
				response.sendRedirect(request.getContextPath() + "/db/");
				return;
			}
			request.getSession().setAttribute("emaill", email);
			request.getSession().setAttribute("msg", "用户名或密码不对。");
			response.sendRedirect(request.getContextPath() + "/index/login");
		} else
		{
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		service(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		service(request, response);
	}

}
