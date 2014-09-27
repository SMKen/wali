package com.wali.smdiary.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wali.common.web.page.Page;
import com.wali.smdiary.dao.ISmDiaryDao;
import com.wali.smdiary.entity.SmDiary;
import com.wali.smdiary.service.ISmDiaryService;

@Service
public class SmDiaryService implements ISmDiaryService
{

	@Resource(name = "smDiaryDao")
	private ISmDiaryDao dao;

	@Override
	public int getCountl()
	{
		return dao.getCountl();
	}

	@Override
	public Boolean doSave(SmDiary T)
	{
		return dao.doSave(T);
	}

	@Override
	public int doDeleteById(String id)
	{
		return dao.doDeleteByParam("uid", id);
	}
	
	@Override
	public Boolean doUpdate(SmDiary T)
	{
		return dao.doUpdate(T);
	}

	@Override
	public int doDeleteByParam(String property, Object value)
	{
		return dao.doDeleteByParam(property, value);
	}

	@Override
	public List<SmDiary> getListByParams(String[] propertys, Object[] values)
	{
		return dao.getListByParams(propertys, values);
	}

	@Override
	public SmDiary getOneById(Serializable ID)
	{
		return dao.getOneById(ID);
	}

	@Override
	public List<SmDiary> getPagesByParams(String[] propertys, Object[] values, Page page)
	{
		return dao.getPagesByParams(propertys, values, page);
	}

	@Override
	public List<SmDiary> getTimeCategory()
	{
		return dao.getTimeCategory();
	}
//	@Override
//	public Map<String, Integer> getAllTags(String uid)
//	{
//		return dao.getAllTags(uid);
//	}

	@Override
	public Page getPage(int getPage, String[] propertys, Object[] values)
	{
		return dao.getPage(getPage, propertys, values);
	}

}
