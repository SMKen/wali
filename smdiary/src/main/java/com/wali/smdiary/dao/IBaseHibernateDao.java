package com.wali.smdiary.dao;

import java.io.Serializable;
import java.util.List;

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

	Boolean doByParam(String property, Object value);

	List<T> getListByParams(String[] propertys, Object[] values);

	T getOneById(Serializable ID);

	T getByParams();

	List<T> getPagesByParams(String[] propertys, Object[] values, int page, int pageSize);

	abstract Class<T> getClazz();

}
