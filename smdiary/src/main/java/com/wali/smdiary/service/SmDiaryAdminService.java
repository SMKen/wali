package com.wali.smdiary.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wali.smdiary.dao.impl.SmDiaryAdminDao;

/**
 * 
 * @author Ken
 * @since 2014年8月28日
 */
@Service
public class SmDiaryAdminService
{

	@Resource(name = "smDiaryAdminDao")
	private SmDiaryAdminDao dao;

	public int getCount()
	{
		return dao.getAllObjs().size();
	}

	public SmDiaryAdminDao getDao()
	{
		return dao;
	}

	public void setDao(SmDiaryAdminDao dao)
	{
		this.dao = dao;
	}

}
