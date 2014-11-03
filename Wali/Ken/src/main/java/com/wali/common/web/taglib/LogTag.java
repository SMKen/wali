package com.wali.common.web.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 统一记录日志.
 * 
 * @author zc
 * @version 2014-8-22 上午10:13:34
 */
public class LogTag extends TagSupport
{

	Logger logger = LoggerFactory.getLogger(LogTag.class);

	private static final long serialVersionUID = -6444206094536825787L;
	private Object msg;
	private String lever;

	public void setMsg(Object msg)
	{
		this.msg = msg;
	}

	public void setLever(String lever)
	{
		this.lever = lever;
	}

	public LogTag()
	{
	}

	public int doStartTag()
	{
		// JspWriter out = this.pageContext.getOut();
		if(lever.equals("info"))
		{
			logger.info(msg.toString());
		}else if(lever.equals("warn"))
		{
			logger.warn(msg.toString());
		}else if(lever.equals("error"))
		{
			logger.error(msg.toString());
		}else if(lever.equals("warn"))
		{
			logger.warn(msg.toString());
		}else if(lever.equals("fatal"))
		{
			logger.error(msg.toString());
		}else if(lever.equals("debug"))
		{
			logger.debug(msg.toString());
		}else 
		{
			logger.debug(msg.toString());
		}  

		return EVAL_BODY_INCLUDE;
	}

	public int doAfterBody() throws JspException
	{
		return SKIP_BODY;
	}

	public int doEndTag() throws JspException
	{
		return EVAL_PAGE;
	}
}