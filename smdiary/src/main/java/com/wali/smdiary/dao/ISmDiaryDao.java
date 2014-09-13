package com.wali.smdiary.dao;

import java.io.Serializable;
import java.util.List;

import com.wali.common.web.page.Page;
import com.wali.smdiary.entity.SmDiary;

/**
 * 日志类.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
public interface ISmDiaryDao extends IBaseHibernateDao<SmDiary, String>
{

	int getCountl();

	Boolean doSave(Serializable T);

	Boolean doUpdate(Serializable T);

	// Boolean doDelete(Serializable T);

	int doDeleteByParam(String property, Object value);

	List<SmDiary> getListByParams(String[] propertys, Object[] values);

	SmDiary getOneById(Serializable ID);

	// T getByParams(String property, Object value);

	List<SmDiary> getPagesByParams(String[] propertys, Object[] values, Page page);

	public List<SmDiary> getTimeCategory();
//	Map<String, Integer> getAllTags(String uid);

}
