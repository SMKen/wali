package com.wali.smdiary.service;

import com.wali.smdiary.entity.SmDiaryAdmin;

/**
 * 
 * @author Ken
 * @since 2014年8月28日
 */
public interface ISmDiaryAdminService
{

	SmDiaryAdmin login(String name, String pwd);

	Boolean doUpdate(SmDiaryAdmin T);

}
