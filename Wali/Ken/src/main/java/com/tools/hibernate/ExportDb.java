package com.tools.hibernate;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

/**
 * 导出实体的数据库结构.
 * 
 * @author Ken
 * @since 2014年8月28日
 */
public class ExportDb
{
	public static void main(String[] args)
	{
		Configuration cfg = new Configuration().configure("export.xml");
		SchemaExport export = new SchemaExport(cfg);
		// true,print ; true export to db
		export.create(true, false);
	}

}
