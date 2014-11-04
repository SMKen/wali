package cn.net.zhengchao.blog.dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import k.page.Page;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.slf4j.LoggerFactory;

import cn.net.zhengchao.blog.vo.SmDiary;

/**
 * 处理日志添加及标签等.
 * 
 * @author Ken
 * @since 2014年11月3日
 */
public class DiaryBlogDao extends BaseDbutilDao
{

	public DiaryBlogDao() {
		super();
		logger  = LoggerFactory.getLogger(DiaryBlogDao.class);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Page getPage(int getPage, String[] propertys, Object[] values, String[] match)
	{
		Page page = new Page(getPage);
		StringBuffer paramSql = new StringBuffer();
		if(propertys != null && propertys.length>0)
			if (null != propertys)
			{
				for (int i = 0; i < propertys.length; i++)
				{
					boolean add = false;
					if(i< match.length)
					{
						if(match[i].equals("gt"))
						{
							paramSql.append(" and "+propertys[i] + ">= ? ");
							add = true;
						}else if(match[i].equals("lt"))
						{
							paramSql.append(" and "+propertys[i] + "<= ? ");
							add = true;
						}else if(match[i].equals("like"))
						{
							paramSql.append(" and "+propertys[i] + " like ? ");
							add = true;
						}
					}
					if(!add)
					{
						paramSql.append(" and "+propertys[i] + " = ? ");
					}
				}
			}
		String paramSqlStr = paramSql.toString();
		if(paramSqlStr != null && paramSqlStr.startsWith(" and"))
		{
			paramSqlStr = " where " + paramSqlStr.substring(4);
		}
		// 先计算总数
		//Criteria crit = getCriteria(propertys, values, match);
		//Map<String, Object> map = qr.query(conn, "SELECT * FROM person where id = ?", new MapHandler(), 1L);
//        Person person = new Person();
//        person.setId((Long) map.get("id"));
		String sql = "select count(*) as count from wali_diary ";
		String countSql = sql + paramSqlStr;
		QueryRunner queryRunner = new QueryRunner();
		Connection conn = getConnection();
		if (conn == null)
		{
			return page;
		}
		try
		{
			 Number num = 0 ;
			 num = (Number) queryRunner.query(conn, countSql, scalarHandler, values); 
			 if (num != null ) {
				 page.setTotalRecord(num.intValue());
				 //num.longValue() : - 1 ; 
			 }else{
				 page.setTotalRecord(0);
				 return page;
			 }
			 			
			String pageSql  = "select * from wali_diary " + paramSqlStr +" order by diaryDay desc,updateTime desc limit ?,?"; 			 
			List<Object> list = new ArrayList<Object>();  
	        if(values == null)
	        {
	        	values = new Object[0];
	        }
			for (int i=0; i<values.length; i++) {  
	            list.add(values[i]);  
	        }  
	        
	        list.add(values.length,page.getStartRow());
	        list.add(values.length+1,page.getPageSize());
	        
	        Object[] newParam =  list.toArray(new Object[1]);
	        
	        List<SmDiary> diarys = (List<SmDiary>) queryRunner.query(conn,pageSql, 
	        		new BeanListHandler(Class.forName("cn.net.zhengchao.blog.vo.SmDiary")),newParam); 
	        page.setData(diarys);
			return page;
	        
		} catch (Exception e)
		{
			logger.error("update record error ", e);
		} finally
		{
			closeConnecton(conn);
		}
		
//		List<SmDiary> categories = (List<SmDiary>) crit.addOrder(Order.desc("createTime")).
//				setFirstResult(page.getStartRow()).setMaxResults(page.getPageSize()).list();
//		page.setData(categories);
		return page;
	}

	@SuppressWarnings("rawtypes")
	private ScalarHandler scalarHandler = new ScalarHandler()
	{
		@Override
		public Object handle(ResultSet rs) throws SQLException
		{
			Object obj = super.handle(rs);
			if (obj instanceof BigInteger)
				return ((BigInteger) obj).longValue();
			return obj;
		}
	};

	/**
	 * 
	 * @param sql
	 *            插入sql语句
	 * @param params
	 *            插入参数
	 * @return 返回影响行数
	 */
	public int saveOrUpdate(String sql, Object[] params)
	{
		QueryRunner queryRunner = new QueryRunner();
		Connection conn = getConnection();
		if (conn == null)
		{
			return 0;
		}
		try
		{
			int affectedRows = 0;
			if (params == null)
			{
				affectedRows = queryRunner.update(conn, sql);
			} else
			{
				affectedRows = queryRunner.update(conn, sql, params);
			}
			conn.commit();
			return affectedRows;

		} catch (Exception e)
		{
			try
			{
				conn.rollback();
			} catch (SQLException e1)
			{
				logger.error("update record roback error ", e1);
			}
			logger.error("update record error ", e);
		} finally
		{
			closeConnecton(conn);
		}
		return 0;
	}

	/**
	 * 
	 * @param sql
	 *            插入sql语句
	 * @param params
	 *            插入参数
	 * @return 返回影响行数
	 */
	public int deleteById(String uid)
	{
		QueryRunner queryRunner = new QueryRunner();
		Connection conn = getConnection();
		if (conn == null)
		{
			return 0;
		}
		try
		{
			int affectedRows = 0;
			affectedRows = queryRunner.update(conn, "delete from wali_diary where uid=?", uid);
			conn.commit();
			return affectedRows;
		} catch (Exception e)
		{
			try
			{
				conn.rollback();
			} catch (SQLException e1)
			{
				logger.error("update record roback error ", e1);
			}
			logger.error("delete record error ", e);
		} finally
		{
			closeConnecton(conn);
		}
		return 0;
	}

	/**
	 * 获取所有的时间与标签.
	 */
	@SuppressWarnings("rawtypes")
	public SmDiary getDiaryById(String uid)
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
			SmDiary vo = (SmDiary) qRunner.query(conn, "select * from wali_diary where uid = ? limit 1", 
					new BeanHandler(Class.forName("cn.net.zhengchao.blog.vo.SmDiary")),
					new Object[] {uid});
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
	
	/**
	 * 获取所有的时间与标签.
	 */
	@SuppressWarnings("rawtypes")
	public List<SmDiary> getTimeCategory()
	{
		QueryRunner qRunner = new QueryRunner();
		Connection conn = getConnection();
		if (conn == null)
		{
			return null;
		}
		try
		{
			// List<SmDiary> categories = ()
			// getSession().createQuery("select new com.wali.smdiary.entity.SmDiary(diaryDay,categorys)  from com.wali.smdiary.entity.SmDiary "
			// ).list();
			@SuppressWarnings("unchecked")
			List<SmDiary> vo = (List<SmDiary>) qRunner.query(conn, "select diaryDay,categorys from wali_diary", new BeanListHandler(Class.forName("cn.net.zhengchao.blog.vo.SmDiary")),
					new Object[] {});
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
