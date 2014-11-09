package cn.net.zhengchao.blog.vo;

import java.io.Serializable;
import java.util.Date;

//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.Temporal;
//import javax.persistence.TemporalType;
//
//import org.hibernate.annotations.GenericGenerator;

/**
 * 管理员表
 * 
 * @author Ken
 * @since 2014年8月28日
 */
// @Entity(name = "wali_diary_admin")
public class SmDiaryAdmin implements Serializable
{

	private static final long serialVersionUID = 7444424719607939065L;
	// @Id
	// @GeneratedValue(generator = "paymentableGenerator")
	// @GenericGenerator(name = "paymentableGenerator", strategy = "assigned")
	// @Column(name = "uid", length = 32)
	private String uid;
	// @Column(length = 32)
	private String name;
	// @Column(length = 64)
	private String pwd;
	// @Column(length = 64)
	private String email;
	// @Column(length = 64)
	private String logo;
	// @Column(length = 64)
	private String imgs;
	// @Column
	private int logintimes;
	// @Column
	private int lv;
	private int diarycount;
	// @Column
	// @Temporal(TemporalType.TIMESTAMP)
	private Date createTime;
	// @Column
	// @Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;
	// @Column
	// @Temporal(TemporalType.TIMESTAMP)
	private Date lastloginTime;

	public String getUid()
	{
		return uid;
	}

	public void setUid(String uid)
	{
		this.uid = uid;
	}

	public int getLv()
	{
		return lv;
	}

	public void setLv(int lv)
	{
		this.lv = lv;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getLogo()
	{
		return logo;
	}

	public void setLogo(String logo)
	{
		this.logo = logo;
	}

	public String getImgs()
	{
		return imgs;
	}

	public void setImgs(String imgs)
	{
		this.imgs = imgs;
	}

	public int getLogintimes()
	{
		return logintimes;
	}

	public void setLogintimes(int logintimes)
	{
		this.logintimes = logintimes;
	}

	public int getDiarycount()
	{
		return diarycount;
	}

	public void setDiarycount(int diarycount)
	{
		this.diarycount = diarycount;
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

	public Date getLastloginTime()
	{
		return lastloginTime;
	}

	public void setLastloginTime(Date lastloginTime)
	{
		this.lastloginTime = lastloginTime;
	}

}
