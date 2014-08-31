package com.wali.smdiary.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wali.smdiary.dao.ISmDiaryAdminDao;
import com.wali.smdiary.entity.SmDiary;

/**
 * 管理员Dao.
 * 
 * @author Ken
 * @since 2014年8月28日
 */
@Repository(value = "smDiaryAdminDao")
public class SmDiaryAdminDao extends BaseHibernateDao<SmDiary, String> implements ISmDiaryAdminDao<SmDiary, String>
{

	@Autowired
	protected SessionFactory sessionFactory;

	protected Session getSession()
	{
		return sessionFactory.getCurrentSession();
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
