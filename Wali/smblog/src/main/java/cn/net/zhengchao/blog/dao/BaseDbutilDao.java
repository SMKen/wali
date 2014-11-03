package cn.net.zhengchao.blog.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 基础的Dbutil工具类.
 * 
 * @author Ken
 * @since 2014年11月3日
 */
public class BaseDbutilDao
{

	Logger logger = LoggerFactory.getLogger(BaseDbutilDao.class);

	// sea mysql
	// String JDBCURL = "jdbc:mysql://localhost:3306/macaw4";
	// String JDBCDRIVER = "com.mysql.jdbc.Driver";
	// String JDBCUSER = "";
	// String JDBCPWD = "";

	// H2 test
	String JDBCURL = "jdbc:h2:tcp://localhost/~/smdiary";
	String JDBCDRIVER = "org.h2.Driver";
	String JDBCUSER = "sa";
	String JDBCPWD = "";

	/**
	 * 初始化数据库连接.
	 * 
	 * @return
	 * @throws SQLException
	 */
	Connection getConnection()
	{
		Connection connection = null;
		try
		{
			DbUtils.loadDriver(JDBCDRIVER);
			connection = DriverManager.getConnection(JDBCURL, JDBCUSER, JDBCPWD);
			connection.setAutoCommit(false);// 关闭自动提交
		} catch (SQLException e)
		{
			logger.error("init db connection error ", e);
			connection = null;
		}
		return connection;
	}

	/**
	 * 关闭数据库连接.
	 */
	boolean closeConnecton(Connection con)
	{
		if (con == null)
		{
			return true;
		}
		DbUtils.closeQuietly(con);
		return true;
	}
}
