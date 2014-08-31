package com.wali.common.lang;

import java.util.UUID;

/**
 * 工具类.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
public class StringUtil
{

	/**
	 * 获取随机的UUID.
	 */
	public static String getUUID()
	{
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
