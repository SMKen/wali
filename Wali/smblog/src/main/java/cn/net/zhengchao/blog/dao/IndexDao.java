package cn.net.zhengchao.blog.dao;

import java.sql.Connection;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.slf4j.LoggerFactory;

import cn.net.zhengchao.blog.vo.SmDiaryAdmin;

/**
 * 处理登陆等.
 * 
 * @author Ken
 * @since 2014年11月3日
 */
public class IndexDao extends BaseDbutilDao
{

	public IndexDao() {
		super();
		logger  = LoggerFactory.getLogger(IndexDao.class);
	}
	
	/**
	 * 检查登陆.
	 */
	@SuppressWarnings("rawtypes")
	public SmDiaryAdmin login(String email, String pwd)
	{
		QueryRunner qRunner = new QueryRunner();
		Connection conn = getConnection();
		if (conn == null)
		{
			return null;
		}
		try
		{
			@SuppressWarnings("unchecked")
			SmDiaryAdmin vo = (SmDiaryAdmin) qRunner.query(conn, "select * from wali_diary_admin where email = ? and pwd = ? limit 1",
					new BeanHandler(Class.forName("cn.net.zhengchao.blog.vo.SmDiaryAdmin")), new Object[] { email, pwd });
			return vo;
		} catch (Exception e)
		{
			logger.error("login do error ", e);
		} finally
		{
			closeConnecton(conn);
		}
		return null;
	}
}
