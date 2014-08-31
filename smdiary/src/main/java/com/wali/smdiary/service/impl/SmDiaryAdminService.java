package com.wali.smdiary.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wali.smdiary.dao.ISmDiaryAdminDao;
import com.wali.smdiary.entity.SmDiaryAdmin;
import com.wali.smdiary.service.ISmDiaryAdminService;

/**
 * 
 * @author Ken
 * @since 2014年8月28日
 */
@Service
public class SmDiaryAdminService implements ISmDiaryAdminService
{

	//@Autowired
	@Resource(name = "smDiaryAdminDao")
	private ISmDiaryAdminDao dao;

	public SmDiaryAdmin login(String name, String pwd)
	{
		return dao.login(name, pwd);
	}

	public Boolean doUpdate(SmDiaryAdmin T)
	{
		return doUpdate(T);
	}

}
