package com.wali.smdiary.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 管理员Dao.
 * 
 * @author Ken
 * @since 2014年8月28日
 */
@Repository
public class SmDiaryAdminDao
{

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getAllObjs()
	{
		String hsql = "from com.wali.smdiary.entity.SmDiary";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hsql);

		return query.list();
	}

}
