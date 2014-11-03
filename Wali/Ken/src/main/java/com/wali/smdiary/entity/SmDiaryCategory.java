package com.wali.smdiary.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * 日志分类表.
 * 
 * @author Ken
 * @since 2014年8月28日
 */
@Deprecated
@Entity(name = "wali_diary_category")
public class SmDiaryCategory implements Serializable
{

	private static final long serialVersionUID = 5684672103290728875L;
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "assigned")
	@Column(length = 32)
	private String name;
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	private Date createTime;
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
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

}
