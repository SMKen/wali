package cn.net.zhengchao.blog.web;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import k.lang.DateUtil;
import k.lang.StringUtil;
import k.page.Page;

import org.json.JSONObject;
import org.slf4j.LoggerFactory;

import cn.net.zhengchao.blog.dao.DiaryBlogDao;
import cn.net.zhengchao.blog.vo.AdminVo;
import cn.net.zhengchao.blog.vo.SmDiary;

/**
 * 日志主要 Web.
 * 
 * @author zc
 * @see 2014-11-3
 */
public class DiaryBlogWeb extends BaseServelet
{

	private static final long serialVersionUID = -3798714636190011663L;

	public DiaryBlogWeb()
	{
		super();
		logger  = LoggerFactory.getLogger(DiaryBlogWeb.class);
	}

	private void addCateGoryTime(HttpServletRequest request)
	{
		List<SmDiary> timeCategory = new DiaryBlogDao().getTimeCategory();
		Map<String, Integer> timeCount = new TreeMap<String, Integer>(new Comparator<String>()
		{ // new HashMap<String,Integer>();
					public int compare(String obj1, String obj2)
					{
						return obj2.compareTo(obj1);// 降序排序
					}
				});
		Map<String, Integer> categoryCount = new HashMap<String, Integer>();

		List<Map.Entry<String, Integer>> mappingList = null;
		// 通过ArrayList构造函数把map.entrySet()转换成list
		mappingList = new ArrayList<Map.Entry<String, Integer>>(categoryCount.entrySet());
		// 通过比较器实现比较排序
		Collections.sort(mappingList, new Comparator<Map.Entry<String, Integer>>()
		{
			public int compare(Map.Entry<String, Integer> mapping1, Map.Entry<String, Integer> mapping2)
			{
				return mapping1.getValue().compareTo(mapping2.getValue());
			}
		});

		for (SmDiary sd : timeCategory)
		{
			if (sd.getDiaryDay() != null)
			{
				String date = DateUtil.formatDateZHMonth(sd.getDiaryDay());
				if (timeCount.get(date) == null)
					timeCount.put(date, 0);
				timeCount.put(date, timeCount.get(date) + 1);
			}
			String cates = sd.getCategorys();
			if (cates != null)
			{
				String cateArra[] = StringUtil.splitCategory(cates);
				for (String ca : cateArra)
				{
					if (categoryCount.get(ca) == null)
						categoryCount.put(ca, 0);
					categoryCount.put(ca, categoryCount.get(ca) + 1);
				}
			}
		}
		// mv.addObject("timemap", timeCount);
		// mv.addObject("catemap", categoryCount);
		// request.getSession().setAttribute("timemap", timeCount);
		request.setAttribute("timemap", timeCount);
		request.setAttribute("catemap", categoryCount);
		// request.getSession().setAttribute("catemap", categoryCount);
		// return mv;
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		mask = "db";// /lang/us/db
		request.setAttribute("DB", "YES");
		AdminVo vo = (AdminVo) request.getSession().getAttribute(SESSON_ADMIN);
		if(vo == null)
		{
			vo = new AdminVo();
			vo.setLv(10);//default is scanner 
		}
		//logger.debug("request url is : " + kGetReqUrl(request));
		String reqParam[] = kGetReqParam(kGetReqUrl(request), kGetMark());
		String param1 = kGetReqParamValue(reqParam, 1, "d");
		logger.debug("request url param1 is : " + param1);
		if (param1.equals("d"))
		{
			response.sendRedirect(request.getContextPath() + "/db/page/1/");
		} else if (param1.equals("page"))
		{
			String param2 = kGetReqParamValue(reqParam, 2, "1");
			// 分页查找第一页
			Integer pageid = 1;
			try
			{
				pageid = Integer.valueOf(param2);
			} catch (Exception e)
			{
				pageid = 1;
			}
			logger.debug("blog list page search begin ");
			Page page = new DiaryBlogDao().getPage(pageid, new String []{"LV"}, new Object[]{vo.getLv()}, new String[]{"gt"});
			logger.debug("blog list page search results : " + page);
			request.setAttribute("page", page);
			request.setAttribute("pagetype", "pagelist");
			request.setAttribute("MD", "pagelist");
			addCateGoryTime(request);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} else if (param1.equals("monthpage"))
		{
			String param2 = kGetReqParamValue(reqParam, 3, "1");
			String parammonth = kGetReqParamValue(reqParam, 2, "1");
			// 分页查找第一页
			Integer pageid = 1;
			try
			{
				pageid = Integer.valueOf(param2);
			} catch (Exception e)
			{
				pageid = 1;
			}

			Date monthDay = new Date();
			try
			{
				monthDay = DateUtil.formatDateStringYearMonth(parammonth);
			} catch (Exception e)
			{
				monthDay = new Date();
			}
			Calendar cBegin = Calendar.getInstance();
			cBegin.setTime(monthDay);
			cBegin.set(Calendar.DAY_OF_MONTH, 1);
			cBegin.set(Calendar.HOUR_OF_DAY, 0);
			cBegin.set(Calendar.MINUTE, 0);
			cBegin.set(Calendar.SECOND, 0);
			cBegin.set(Calendar.MILLISECOND, 1);
			Calendar cEnd = (Calendar) cBegin.clone();
			cEnd.set(Calendar.MONTH, cBegin.get(Calendar.MONTH) + 1);
			cEnd.set(Calendar.SECOND, cEnd.get(Calendar.SECOND)-2);
			
			logger.debug("blog month list page search begin ");
			Page page = new DiaryBlogDao().getPage(pageid, new String[] { "DIARYDAY", "DIARYDAY" ,"LV"}, new Object[] { cBegin.getTime(), cEnd.getTime() ,vo.getLv()}, new String[] { "gt", "lt","gt" });
			logger.debug("blog month list page search results : " + page);
			request.setAttribute("page", page);
			request.setAttribute("MD", "pagelist");
			request.setAttribute("pagetype", "monthpage");
			addCateGoryTime(request);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} else if (param1.equals("tagpage"))
		{
			String param2 = kGetReqParamValue(reqParam, 3, "1");
			String tag = null;
			try
			{
				tag = kGetReqParamValue(reqParam, 2, "--");
				logger.debug("decode tag before is : "+tag);
				tag= URLDecoder.decode(tag, "utf-8");
				logger.debug("decode tag is : "+tag);
				//tag = new String(tag.getBytes("ISO-8859-1"), "UTF-8");
			} catch (Exception e)
			{
				tag = null;
			}
			// 分页查找第一页
			Integer pageid = 1;
			try
			{
				pageid = Integer.valueOf(param2);
			} catch (Exception e)
			{
				pageid = 1;
			}

			logger.debug("blog tag list page search begin ");
			Page page = null;
			if (tag == null)
			{
				//new String []{"LV"}, new Object[]{vo.getLv()}, new String[]{"gt"});
				page = new DiaryBlogDao().getPage(pageid,new String []{"LV"}, new Object[]{vo.getLv()}, new String[]{"gt"});
			} else
			{
				page = new DiaryBlogDao().getPage(pageid, new String[] { "CATEGORYS","LV"}, new Object[] { "%"+tag+"%",vo.getLv()}, new String[] { "like" ,"gt"});
			}

			logger.debug("blog tag list page search results : " + page);
			request.setAttribute("page", page);
			request.setAttribute("MD", "pagelist");
			request.setAttribute("pagetype", "tagpage");
			addCateGoryTime(request);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} else if (param1.equals("mod"))
		{
			String uid = kGetReqParamValue(reqParam, 2, "1");
			if (null == uid)
			{
				response.sendRedirect(request.getContextPath() + "/db/page/1/");
			} else
			{
				logger.debug("blog go mod search begin ");
				SmDiary obj = new DiaryBlogDao().getDiaryById(uid);
				logger.debug("blog go mod search results : " + obj);
				request.setAttribute("diary", obj);
				request.setAttribute("MD", "mod");
				addCateGoryTime(request);
				request.getRequestDispatcher("/main.jsp").forward(request, response);
			}

		} else if (param1.equals("add"))
		{
			request.setAttribute("MD", "add");
			addCateGoryTime(request);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} else if (param1.equals("doAdd"))
		{
			String outline = getRString(request.getParameter("outline"),"标题");
			String diarys =getRString( request.getParameter("diarys"),"无");
			String mood = getRString(request.getParameter("mood"),"--");
			String weather = getRString(request.getParameter("weather"),"--"); 
			String diaryDays = getRString(request.getParameter("diaryDays"),null);
			Date diaryDay = new Date();
			try
			{
				diaryDay = DateUtil.formatDateStringZH(diaryDays);
				logger.debug(diaryDays + " date " + diaryDay);
			} catch (Exception e)
			{
				logger.debug(diaryDays + " parse error "+e.toString());
				diaryDay = new Date();
			}
			String categorys = getRString(request.getParameter("categorys"),null);
			String lv = request.getParameter("lv");
			Integer lvint = 10;
			try{
				lvint = Integer.valueOf(lv);
			}catch(Exception e)
			{
				lvint = 10;
			}
			if(lvint>10) lvint = 10;
			if(lvint<1) lvint = 1;
			
			String sql = "INSERT INTO WALI_NOTES(UID,LV,ADMIN,CATEGORYS,CREATETIME,DIARY,DIARYDAY,MOOD,OUTLINE,UPDATETIME,VIEWTIMES,WEATHER) "
					+ "values(?,?,? ,? ,? ,? ,?  ,? ,? ,? ,1 ,? )";
			Object params[] = new Object[] { StringUtil.getUUID(),lvint, "Ken", categorys, new Date(), diarys, diaryDay, mood, outline, new Date(), weather };
			logger.debug("insert diary " + sql);
			logger.debug("insert diary params " + Arrays.asList(params));
			int flag = new DiaryBlogDao().saveOrUpdate(sql, params);
			logger.debug("insert diary results :"+ flag);
			if (flag == 1)
			{
				logger.debug("publish new blog : Publish success!");
			} else
			{
				logger.warn("publish new blog : Publish error!");
			}
			addCateGoryTime(request);
			response.sendRedirect(request.getContextPath() + "/db/page/1/");
		} else if (param1.equals("doMod"))
		{
			String outline = getRString(request.getParameter("outline"),"标题");
			String diarys =getRString( request.getParameter("diarys"),"无");
			String mood = getRString(request.getParameter("mood"),"--");
			String weather = getRString(request.getParameter("weather"),"--"); 
			String diaryDays = getRString(request.getParameter("diaryDays"),null);
			
			String lv = request.getParameter("lv");
			Integer lvint = 10;
			try{
				lvint = Integer.valueOf(lv);
			}catch(Exception e)
			{
				lvint = 10;
			}
			if(lvint>10) lvint = 10;
			if(lvint<1) lvint = 1;
			
			Date diaryDay = new Date();
			try
			{
				diaryDay = DateUtil.formatDateStringZH(diaryDays);
				logger.debug(diaryDays + " date " + diaryDay);
			} catch (Exception e)
			{
				logger.debug(diaryDays + " parse error "+e.toString());
				diaryDay = new Date();
			}
			String categorys = getRString(request.getParameter("categorys"),null);
			String uid = request.getParameter("uid");
			String sql = "update WALI_NOTES set CATEGORYS = ?,LV=? ,DIARY = ? ,DIARYDAY =? ,MOOD=? ,OUTLINE =?,UPDATETIME=?,WEATHER=? where UID =?";
			Object params[] = new Object[] { categorys,lvint, diarys, diaryDay, mood, outline, new Date(), weather, uid };

			int flag = new DiaryBlogDao().saveOrUpdate(sql, params);

			if (flag == 1)
			{
				logger.debug("modify blog : Modify success!");
			} else
			{
				logger.warn("modify blog : Modify error!");
			}
			addCateGoryTime(request);
			response.sendRedirect(request.getContextPath() + "/db/page/1/");
		} else if (param1.equals("delete"))
		{
			String uid = kGetReqParamValue(reqParam, 2, "1");
			if (null == uid)
			{
				response.sendRedirect(request.getContextPath() + "/db/page/1/");
			} else
			{
				int count = new DiaryBlogDao().deleteById(uid);
				JSONObject json = new JSONObject();
				if (count >= 1)
				{
					json.put("flag", true);
				} else
				{
					json.put("flag", false);
				}
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().write(json.toString());
				// return json.toString();
			}
		} else
		{
			response.sendRedirect(request.getContextPath() + "/db/page/1/");
		}

		// return "forward:/db/page/1";

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		service(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		service(request, response);
	}

	String getRString(String str , String defaults)
	{
		if(str == null || str.equals("")) {
			if(defaults!= null) return defaults;
			return str;
		}
		try{
			if(str.equals(new String(str.getBytes("ISO-8859-1"), "ISO-8859-1")))
			{
				return new String(str.getBytes("ISO-8859-1"), "UTF-8");
			}
		}catch(Exception e)
		{
			
		}
		return str;
	}
	
}
