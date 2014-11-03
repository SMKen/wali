package cn.net.zhengchao.blog.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 语言设定 Web.
 * 
 * @author zc
 * @see 2014-11-3
 */
public class MainWeb extends HttpServlet {

	private static final long serialVersionUID = -3798714636190011663L;

	public MainWeb() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String lg1 = request.getRequestURI();
		String lg2 = request.getRequestURL().toString();
		String lg3 = request.getContextPath();
		response.setCharacterEncoding("UTF-8");
		// response.setContentType("application/json; charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.append(lg1 + "\t" + lg2 + "\t" + lg3);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
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
