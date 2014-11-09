package cn.net.zhengchao.blog.vo;

/**
 * 用户vo. 用户分游客用户lv = 10,普通用户lv=5,超级管理员lv=1.
 * 
 * @author Ken
 * @since 2014年11月9日
 */
public class AdminVo
{

	private String uid;
	private String name;
	private int lv;

	public AdminVo(String uid, String name, int lv)
	{
		super();
		this.uid = uid;
		this.name = name;
		this.lv = lv;
	}

	public AdminVo()
	{
		super();
	}

	public String getUid()
	{
		return uid;
	}

	public void setUid(String uid)
	{
		this.uid = uid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getLv()
	{
		return lv;
	}

	public void setLv(int lv)
	{
		this.lv = lv;
	}

}
