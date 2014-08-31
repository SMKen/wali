package com.wali.smdiary.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.util.Assert;

import com.wali.common.web.Page;
import com.wali.smdiary.dao.IBaseHibernateDao;

/**
 * Hibernate 基准类.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
//@Embeddable
public abstract class BaseHibernateDao<T, ID extends Serializable> implements IBaseHibernateDao<T, ID>
{

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getAll()
	{
		return (List<T>) getSession().createCriteria(getClazz()).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getAllOrderyed(String property, Boolean isAsc)
	{
		if (isAsc)
		{
			return (List<T>) getSession().createCriteria(getClazz()).addOrder(Order.asc(property)).list();
		}
		return (List<T>) getSession().createCriteria(getClazz()).addOrder(Order.desc(property)).list();
	}

	@Override
	public int getCountl()
	{
		return (Integer) getSession().createCriteria(getClazz()).setProjection(Projections.rowCount()).uniqueResult();
	}

	@Override
	public Boolean doSave(Serializable T)
	{
		getSession().save(T);
		return true;
	}

	@Override
	public Boolean doUpdate(Serializable T)
	{
		getSession().update(T);
		return true;
	}

	@Override
	public Boolean doDelete(Serializable T)
	{
		getSession().delete(T);
		return true;
	}

	@Override
	public int doDeleteByParam(String property, Object value)
	{
		int count = getSession().createQuery("delete from " + getClass().getName() + " where " + property + " ? ").setParameter(property, value).executeUpdate();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getListByParams(String[] propertys, Object[] values)
	{
		return (List<T>) getCriteria(propertys,values).list();
	}

	Criteria getCriteria(String[] propertys, Object[] values)
	{
		Criteria c = getSession().createCriteria(getClazz());
		if (null != propertys)
		{
			for (int i = 0; i < propertys.length; i++)
			{
				c.add(Restrictions.eq(propertys[i], values[i]));
			}
		}
		return c;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public T getOneById(Serializable ID)
	{
		Assert.notNull(ID);  
		return (T) getSession().get(getClazz(), ID);
	}

	@Override
	public T getByParams(String property, Object value)
	{
		@SuppressWarnings("unchecked")
		List<T> list = getSession().createCriteria(getClazz()).add(Restrictions.eq(property, value)).setFirstResult(0).setMaxResults(1).list();
		if (null == list || list.isEmpty())
			return null;
		return list.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getPagesByParams(String[] propertys, Object[] values,Page page)
	{
		return (List<T>) getCriteria(propertys,values).setFirstResult(page.getStartRow()).setMaxResults(page.getPageSize()).list();
	}

	abstract Session getSession();

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
