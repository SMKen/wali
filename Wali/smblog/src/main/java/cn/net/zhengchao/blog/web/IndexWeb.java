package cn.net.zhengchao.blog.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * index Web.
 * @author zc
 * @see 2014-11-3
 */
public class IndexWeb extends HttpServlet { 
       
	private static final long serialVersionUID = -3798714636190011663L;

	public IndexWeb() {
        super();
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException { 
		super.doPut(req, resp);
	}

}
