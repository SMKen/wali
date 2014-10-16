package com.wali.smdiary.service;

import java.io.Serializable;
import java.util.List;

import com.wali.common.web.page.Page;
import com.wali.smdiary.entity.SmDiary;

/**
 * 日志服务类.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
public interface ISmDiaryService
{

	Page getPage(int getPage,String[] propertys, Object[] values,String [] match);
	
	int getCountl();

	Boolean doSave(SmDiary T);

	int doDeleteById(String id);
	
	Boolean doUpdate(SmDiary T);

	// Boolean doDelete(Serializable T);

	int doDeleteByParam(String property, Object value);

	List<SmDiary> getListByParams(String[] propertys, Object[] values);

	SmDiary getOneById(Serializable ID);

	// T getByParams(String property, Object value);

	List<SmDiary> getPagesByParams(String[] propertys, Object[] values, Page page);

	List<SmDiary> getTimeCategory();
	
//	Map<String, Integer> getAllTags(String uid);

}
