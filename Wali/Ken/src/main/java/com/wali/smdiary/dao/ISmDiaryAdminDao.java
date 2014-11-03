package com.wali.smdiary.dao;

import java.io.Serializable;

import com.wali.smdiary.entity.SmDiaryAdmin;

/**
 * 管理员信息，如登陆，个人信息查询等.
 * 
 * @author Ken
 * @since 2014年8月31日
 * @param <T>
 * @param <ID>
 */
public interface ISmDiaryAdminDao extends IBaseHibernateDao<SmDiaryAdmin, String>
{

	@Deprecated
	Boolean doSave(Serializable t);

	/**
	 * 登陆成功返回用户信息.
	 */
	SmDiaryAdmin login(String name, String pwd);

	Boolean doUpdate(SmDiaryAdmin t);

}
