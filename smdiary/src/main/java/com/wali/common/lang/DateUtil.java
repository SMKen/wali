package com.wali.common.lang;

import java.text.ParseException;
import java.util.Date;

/**
 * 时间工具类.
 * 
 * @author Ken
 * @since 2014年9月13日
 */
public class DateUtil
{

	/** yyyy-MM-dd */
	public final static String FORMAT_DATE = "yyyy-MM-dd";
	/** yyyy-MM */
	public final static String FORMAT_DATE_YM = "yyyy-MM";
	/** yyyy-MM-dd HH:mm:ss */
	public final static String FORMAT_DATETIME = "yyyy-MM-dd HH:mm:ss";
	/** yyyy年MM月dd日 */
	public final static String FORMAT_DATE_ZH = "yyyy年MM月dd日";
	/** yyyy年MM月 */
	public final static String FORMAT_DATE_ZHMONTH = "yyyy年MM月";
	/** yyyy年MM月dd日 HH时mm分ss秒 */
	public final static String FORMAT_DATETIME_ZH = "yyyy年MM月dd日 HH时mm分ss秒";

	/**
	 * @see {@link #FORMAT_DATE_ZH}
	 */
	public static String formatDateZH(Date date)
	{
		java.text.SimpleDateFormat sfdate = new java.text.SimpleDateFormat(FORMAT_DATE_ZH);
		return sfdate.format(date);
	}
	
	/**
	 * @see {@link #FORMAT_DATE_ZHMONTH}
	 */
	public static String formatDateZHMonth(Date date)
	{
		java.text.SimpleDateFormat sfdate = new java.text.SimpleDateFormat(FORMAT_DATE_ZHMONTH);
		return sfdate.format(date);
	}

	/**
	 * @see {@link #FORMAT_DATE_ZH}
	 */
	public static Date formatDateStringZH(String date)
	{
		java.text.SimpleDateFormat sfdate = new java.text.SimpleDateFormat(FORMAT_DATE);
		try
		{
			return sfdate.parse(date);
		} catch (ParseException e)
		{
			return null;
		}
	}

	/**
	 * @see {@link #FORMAT_DATE_YM}
	 */
	public static Date formatDateStringYearMonth(String date)
	{
		java.text.SimpleDateFormat sfdate = new java.text.SimpleDateFormat(FORMAT_DATE_YM);
		try
		{
			return sfdate.parse(date);
		} catch (ParseException e)
		{
			return null;
		}
	}
	
}
