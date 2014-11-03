package com.wali.smdiary.dao;

import java.io.Serializable;
import java.util.List;

import com.wali.common.web.page.Page;

/**
 * 基准Hibenrate接口.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
public interface IBaseHibernateDao<T, ID extends Serializable>
{

	List<T> getAll();

	List<T> getAllOrderyed(String property, Boolean isAsc);

	int getCountl();

	Boolean doSave(Serializable T);

	Boolean doUpdate(Serializable T);

	Boolean doDelete(Serializable T);

	int doDeleteByParam(String property, Object value);

	List<T> getListByParams(String[] propertys, Object[] values);

	T getOneById(Serializable ID);

	T getByParams(String property, Object value);

	List<T> getPagesByParams(String[] propertys, Object[] values, Page page);

	abstract Class<T> getClazz();

}
