package k.page;

/**
 * 分页对象.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
public class Page
{
	private int startPage = 1;
	private int prePage = 0;
	private int nextPage = 0;
	private int totalPage = 0;
	private int pageSize = 5;
	private int totalRecord = 0;
	private Object data = null;

	public Page()
	{
	}

	public Page(int start)
	{
		this.startPage = start;
	}

	public Page(int start, int pagesize)
	{
		this.startPage = start;
		this.pageSize = pagesize;
	}

	@Override
	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		sb.append("totalRecord:" + totalRecord);
		sb.append("pageSize:" + pageSize);
		sb.append("startPage:" + startPage);
		sb.append("prePage:" + prePage);
		sb.append("nextPage:" + nextPage);
		sb.append("totalRecord:" + totalRecord);
		sb.append("totalPage:" + totalPage);
		sb.append("data:" + data);
		return sb.toString();
	}

	void calc()
	{
		if (startPage < 1)
			startPage = 1;
		totalPage = totalRecord / pageSize + ((totalRecord % pageSize == 0) ? 0 : 1);
		prePage = (startPage == 1) ? 1 : (startPage - 1);
		nextPage = (totalPage <= startPage) ? startPage : startPage + 1;
	}

	public int getStartRow()
	{
		calc();
		return (startPage - 1) * pageSize;
	}

	public int getStartPage()
	{
		return startPage;
	}

	public void setStartPage(int startPage)
	{
		this.startPage = startPage;
	}

	public int getPrePage()
	{
		return prePage;
	}

	public void setPrePage(int prePage)
	{
		this.prePage = prePage;
	}

	public int getNextPage()
	{
		return nextPage;
	}

	public void setNextPage(int nextPage)
	{
		this.nextPage = nextPage;
	}

	public int getTotalPage()
	{
		return totalPage;
	}

	public void setTotalPage(int totalPage)
	{
		this.totalPage = totalPage;
	}

	public int getPageSize()
	{
		return pageSize;
	}

	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
		calc();
	}

	public int getTotalRecord()
	{
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord)
	{
		this.totalRecord = totalRecord;
		calc();
	}

	public void setTotalRecord(Long totalRecord)
	{
		this.totalRecord = totalRecord.intValue();
		calc();
	}

	public Object getData()
	{
		return data;
	}

	public void setData(Object data)
	{
		this.data = data;
	}

}
