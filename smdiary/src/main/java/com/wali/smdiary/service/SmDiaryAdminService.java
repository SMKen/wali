package com.wali.smdiary.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wali.smdiary.dao.ISmDiaryAdminDao;
import com.wali.smdiary.dao.impl.SmDiaryAdminDao;
import com.wali.smdiary.entity.SmDiaryAdmin;

/**
 * 
 * @author Ken
 * @since 2014年8月28日
 */
@Service
public class SmDiaryAdminService
{

	@Resource(name = "smDiaryAdminDao")
	private ISmDiaryAdminDao dao;

	public int getCount()
	{
		System.out.println(dao.doSave(new SmDiaryAdmin()));
		return 1;
	}

	public int doCount()
	{
		System.out.println(dao.doSave(new SmDiaryAdmin()));
		return 1;
	}

}
