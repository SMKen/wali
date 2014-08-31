package com.wali.smdiary.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wali.smdiary.dao.ISmDiaryAdminDao;
import com.wali.smdiary.entity.SmDiaryAdmin;

/**
 * 管理员Dao.
 * 
 * @author Ken
 * @since 2014年8月28日
 */
@Repository(value = "smDiaryAdminDao")
public class SmDiaryAdminDao extends BaseHibernateDao<SmDiaryAdmin, String> implements ISmDiaryAdminDao
{

	@Autowired
	protected SessionFactory sessionFactory;

	protected Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public SmDiaryAdmin login(String name, String pwd)
	{
		List<SmDiaryAdmin> list = getListByParams(new String[] { "email", "pwd" }, new String[] { name, pwd });
		if (list != null && !list.isEmpty() && list.size() >= 1)
		{
			return list.get(0);
		}
		return null;
	}

	@Override
	public Boolean doUpdate(SmDiaryAdmin t)
	{
		return super.doUpdate(t);
	}

}
