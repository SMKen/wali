package com.wali.smdiary.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	/*@Override
	public Map<String, Integer> getAllTags(String uid)
	{
		@SuppressWarnings("unchecked")
		List<Object> categories = (List<Object>) getSession().createQuery("select categorys  from " + getClass().getName()).list();
		if (categories == null || categories.isEmpty())
		{
			return null;
		}
		Map<String, Integer> cs = new HashMap<String, Integer>();
		for (Object ca : categories)
		{
			String cates[] = ca.toString().split(",");
			if (cates != null)
			{
				for (String s : cates)
				{
					if (cs.get(s) == null)
					{
						cs.put(s, 0);
					}
					cs.put(s, cs.get(s) + 1);
				}
			}
		}
		return cs;
	}
*/
}
