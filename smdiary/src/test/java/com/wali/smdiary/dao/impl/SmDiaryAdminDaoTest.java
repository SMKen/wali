package com.wali.smdiary.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wali.smdiary.dao.ISmDiaryAdminDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:diary-beans.xml")
@Transactional
public class SmDiaryAdminDaoTest
// extends AbstractJUnit4SpringContextTests
{

	@Resource(name = "smDiaryAdminDao")
	private ISmDiaryAdminDao smDiaryAdminDao;

	@Test
	public void test()
	{
		List<?> list = smDiaryAdminDao.getAll();
		Assert.assertNotNull(list);
		Assert.assertTrue(list.size() >= 1);
		System.out.println(list.size());
//		Assert.assertTrue(list.size() < 1);
	}

}
