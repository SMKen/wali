package com.wali.smdiary.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.Embeddable;

import org.hibernate.Session;

import com.wali.common.lang.StringUtil;
import com.wali.smdiary.dao.IBaseHibernateDao;
import com.wali.smdiary.entity.SmDiaryAdmin;

/**
 * Hibernate 基准类.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
@Embeddable
public abstract class BaseHibernateDao<T, ID extends Serializable> implements IBaseHibernateDao<T, ID>
{

	@Override
	public List<T> getAll()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> getAllOrderyed(String property, Boolean isAsc)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCountl()
	{
		// TODO Auto-generated method stub
		return 0;
	}

	abstract Session getSession();
	
	@Override
	public Boolean doSave(Serializable T)
	{
		//Session session = getSession();
		try
		{
//			Transaction tx =	session.beginTransaction();
//			tx.begin();
			SmDiaryAdmin t = new SmDiaryAdmin();
			t.setUid(StringUtil.getUUID());
			t.setEmail("xxx");
			t.setPwd("pwd");
			getSession().save(t);
			/*Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hsql);*/
			//tx.commit();
			return true;
		} finally
		{
			//session.close();
		}
	}

	@Override
	public Boolean doUpdate(Serializable T)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean doDelete(Serializable T)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean doByParam(String property, Object value)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> getListByParams(String[] propertys, Object[] values)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public T getOneById(Serializable ID)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public T getByParams()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> getPagesByParams(String[] propertys, Object[] values, int page, int pageSize)
	{
		// TODO Auto-generated method stub
		return null;
	}

	protected Class<T> clazz;

	@Override
	public Class<T> getClazz()
	{
		return this.clazz;
	}

	@SuppressWarnings("unchecked")
	public BaseHibernateDao()
	{
		this.clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}
}
