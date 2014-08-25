package com.wali.smdiary.jsp.taglib;

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
		try
		{
			switch (lever)
			{
			case "info":
				logger.info(msg.toString());
				break;
			case "warn":
				logger.warn(msg.toString());
				break;
			case "error":
				logger.error(msg.toString());
				break;
			case "fatal":
				logger.error(msg.toString());
				break;
			case "debug":
				logger.debug(msg.toString());
				break;
			default:
				logger.debug(msg.toString());
				break;
			}
		} catch (Exception e)
		{
			logger.warn("recorde log error . ");
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