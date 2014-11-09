package cn.net.zhengchao.blog.vo;

import java.io.Serializable;
import java.util.Date;

import k.lang.DateUtil;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.Temporal;
//import javax.persistence.TemporalType;
//import javax.persistence.Transient;
//
//import org.hibernate.annotations.GenericGenerator;

/**
 * 日志表.
 * 
 * @author Ken
 * @since 2014年8月28日
 */
// @Entity(name = "wali_diary")
public class SmDiary implements Serializable
{

	private static final long serialVersionUID = -1550154992225104488L;
	// @Id
	// @GeneratedValue(generator = "paymentableGenerator")
	// @GenericGenerator(name = "paymentableGenerator", strategy = "assigned")
	// @Column(name = "uid", length = 32)
	private String uid;
	// @Column
	// @Temporal(TemporalType.TIMESTAMP)
	private Date diaryDay;
	// @Transient
	private String diaryDays;
	// @Column(length = 32)
	private String weather;
	// @Column(length = 64)
	private String mood;
	// @Column(length = 32)
	private String admin;
	// @Column(length = 64)
	private String outline;
	// @Column(length = 64)
	private String categorys;
	// @Column(name = "diary")
	private String diary;
	// @Column
	private int viewtimes;
	// @Column
	private int lv;
	// @Column
	// @Temporal(TemporalType.TIMESTAMP)
	private Date createTime;
	// @Column
	// @Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	public SmDiary()
	{
	}

	public SmDiary(Date diaryDay, String categorys)
	{
		this.diaryDay = diaryDay;
		this.categorys = categorys;
	}

	public String getUid()
	{
		return uid;
	}

	public void setUid(String uid)
	{
		this.uid = uid;
	}

	public Date getDiaryDay()
	{
		return diaryDay;
	}

	public void setDiaryDay(Date diaryDay)
	{
		this.diaryDay = diaryDay;
	}

	public String getWeather()
	{
		return weather;
	}

	public void setWeather(String weather)
	{
		this.weather = weather;
	}

	public String getMood()
	{
		return mood;
	}

	public void setMood(String mood)
	{
		this.mood = mood;
	}

	public String getAdmin()
	{
		return admin;
	}

	public void setAdmin(String admin)
	{
		this.admin = admin;
	}

	public String getOutline()
	{
		return outline;
	}

	public void setOutline(String outline)
	{
		this.outline = outline;
	}

	public String getCategorys()
	{
		return categorys;
	}

	public void setCategorys(String categorys)
	{
		this.categorys = categorys;
	}

	public String getDiary()
	{
		return diary;
	}

	public void setDiary(String diarys)
	{
		this.diary = diarys;
	}

	public int getViewtimes()
	{
		return viewtimes;
	}

	public void setViewtimes(int viewtimes)
	{
		this.viewtimes = viewtimes;
	}

	public int getLv()
	{
		return lv;
	}

	public void setLv(int lv)
	{
		this.lv = lv;
	}

	public Date getCreateTime()
	{
		return createTime;
	}

	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	public Date getUpdateTime()
	{
		return updateTime;
	}

	public void setUpdateTime(Date updateTime)
	{
		this.updateTime = updateTime;
	}

	public String getDiaryDays()
	{
		return diaryDays;
	}

	public void setDiaryDays(String diaryDays)
	{
		this.diaryDays = diaryDays;
		Date d = DateUtil.formatDateStringZH(diaryDays);
		if (d != null)
		{
			this.diaryDay = d;
		}
	}

}
