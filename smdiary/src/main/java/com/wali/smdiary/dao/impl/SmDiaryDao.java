package com.wali.smdiary.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wali.common.web.page.Page;
import com.wali.smdiary.dao.ISmDiaryDao;
import com.wali.smdiary.entity.SmDiary;

/**
 * 日记表.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
@Repository(value = "smDiaryDao")
public class SmDiaryDao extends BaseHibernateDao<SmDiary, String> implements ISmDiaryDao
{

	@Autowired
	protected SessionFactory sessionFactory;

	@Override
	protected Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SmDiary> getListByParams(String[] propertys, Object[] values)
	{
		return (List<SmDiary>) getCriteria(propertys,values).addOrder(Order.desc("createTime")).list();
	}

	@SuppressWarnings("unchecked")
	public List<SmDiary> getTimeCategory(){
		List<SmDiary> categories = (List<SmDiary>) getSession().createQuery("select new com.wali.smdiary.entity.SmDiary(diaryDay,categorys)  from com.wali.smdiary.entity.SmDiary " ).list();
		return categories;
	}

	@SuppressWarnings("unchecked")
	public Page getPage(int getPage,String[] propertys, Object[] values){
		Page page = new Page(getPage);
		//先计算总数
		Criteria crit = getCriteria(propertys,values);
		long count = (long) crit.setProjection(Projections.rowCount()).uniqueResult();
		page.setTotalRecord(count);
		crit.setProjection(null);
		List<SmDiary> categories = (List<SmDiary>) crit.addOrder(Order.desc("createTime"))
				.setFirstResult(page.getStartRow())
				.setMaxResults(page.getPageSize())
				.list();
		page.setData(categories);
		return page;
	}
	
}
