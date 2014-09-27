package com.wali.smdiary.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wali.common.lang.DateUtil;
import com.wali.common.lang.StringUtil;
import com.wali.common.web.page.Page;
import com.wali.smdiary.entity.SmDiary;
import com.wali.smdiary.entity.SmDiaryAdmin;
import com.wali.smdiary.service.ISmDiaryService;

@Controller
@RequestMapping("/diary")
@SessionAttributes(types = SmDiaryAdmin.class, value = "admin")
public class DiaryWeb
{

	@Resource(name = "smDiaryService")
	private ISmDiaryService service;

	/** 初始化并返回 */
	private ModelAndView getCateGoryTimeMV()
	{
		return addCateGoryTime(new ModelAndView());
	}

	/** 添加CageGory 和　Time数据 */
	private ModelAndView addCateGoryTime(ModelAndView mv)
	{
		List<SmDiary> timeCategory = service.getTimeCategory();
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
		mv.addObject("timemap", timeCount);
		mv.addObject("catemap", categoryCount);

		return mv;
	}

	@RequestMapping
	public String main()
	{
		return "forward:/diary/page/1";
	}

	@RequestMapping(value = "/monthpage/{month}/{pid}", method = RequestMethod.GET)
	public ModelAndView month(@PathVariable String month, @PathVariable String pid)
	{
		Date monthDay = new Date();
		try
		{
			monthDay = DateUtil.formatDateStringYearMonth(month);
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

		Integer pageid = 1;
		try
		{
			pageid = Integer.valueOf(pid);
		} catch (Exception e)
		{
			pageid = 1;
		}
		ModelAndView mv = getCateGoryTimeMV();
		Page page = service.getPage(pageid, new String[] { "diaryDay", "diaryDay" }, new Object[] { cBegin.getTime(), cEnd.getTime() }, new String[] { "gt", "lt" });
		mv.addObject("page", page);
		mv.addObject("MD", "pagelist");
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/tagpage/{tag}/{pid}", method = RequestMethod.GET)
	public ModelAndView tag(@PathVariable String tag, @PathVariable String pid)
	{
		try
		{
			tag = new String(tag.getBytes("ISO-8859-1"), "UTF-8");
		} catch (Exception e)
		{
			tag = null;
		}
		Integer pageid = 1;
		try
		{
			pageid = Integer.valueOf(pid);
		} catch (Exception e)
		{
			pageid = 1;
		}

		ModelAndView mv = getCateGoryTimeMV();
		if (tag == null)
		{
			Page page = service.getPage(pageid, null, null, null);
			mv.addObject("page", page);
		} else
		{
			Page page = service.getPage(pageid, new String[] { "categorys" }, new Object[] { tag }, new String[] { "like" });
			mv.addObject("page", page);
		}
		mv.addObject("MD", "pagelist");
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/page/{pid}", method = RequestMethod.GET)
	public ModelAndView page(@PathVariable String pid)
	{
		Integer pageid = 1;
		try
		{
			pageid = Integer.valueOf(pid);
		} catch (Exception e)
		{
			pageid = 1;
		}
		ModelAndView mv = getCateGoryTimeMV();
		Page page = service.getPage(pageid, null, null, null);
		mv.addObject("page", page);
		mv.addObject("MD", "pagelist");
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView toAdd()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("MD", "add");
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/delete/{uid}", method = RequestMethod.POST)
	public @ResponseBody String doDelete(@PathVariable String uid)
	{
		int count = service.doDeleteById(uid);
		JSONObject json = new JSONObject();
		if (count >= 1)
		{
			json.put("flag", true);
		} else
		{
			json.put("flag", false);
		}
		return json.toString();
	}

	@RequestMapping(value = "/mod/{uid}", method = RequestMethod.GET)
	public ModelAndView toMod(@PathVariable String uid)
	{
		SmDiary sd = service.getOneById(uid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("diary", sd);
		mv.addObject("MD", "mod");
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/doadd", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView doAdd(@ModelAttribute("diary") SmDiary diaryadd)// ,
	{
		ModelAndView mv = getCateGoryTimeMV();
		if (diaryadd == null)
		{
			mv.addObject("MD", "add");
			mv.setViewName("main");
			return mv;
		}
		// diary.setAdmin(admin.getUid());
		diaryadd.setCreateTime(new Date());
		diaryadd.setUpdateTime(new Date());
		diaryadd.setUid(StringUtil.getUUID());
		if (diaryadd.getDiaryDay() == null)
		{
			diaryadd.setDiaryDay(new Date());
		}
		boolean flag = service.doSave(diaryadd);

		if (flag)
		{
			mv.addObject("msg", "发布成功!");
		} else
		{
			mv.addObject("msg", "发布失败!");
		}
		// List<SmDiary> diarys = service.getListByParams(null, null);
		Page page = service.getPage(1, null, null, null);

		mv.addObject("page", page);
		mv.addObject("MD", "list");
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/doMod", method = RequestMethod.POST)
	public ModelAndView doUpdate(@ModelAttribute("diary") SmDiary diary)
	{
		ModelAndView mv = getCateGoryTimeMV();
		if (diary == null)
		{
			Page page = service.getPage(1, null, null, null);
			mv.addObject("page", page);
			mv.addObject("MD", "pagelist");
			mv.setViewName("main");
			return mv;
		}

		// diary.setAdmin(admin.getUid());
		diary.setCreateTime(new Date());
		diary.setUpdateTime(new Date());
		// diary.setUid(StringUtil.getUUID());
		boolean flag = service.doUpdate(diary);
		mv.addObject("diary", diary);
		mv.addObject("flag", flag);
		if (flag)
		{
			mv.addObject("msg", "发布成功!");
		} else
		{
			mv.addObject("msg", "发布失败!");
		}

		Page page = service.getPage(1, null, null, null);
		mv.addObject("page", page);
		mv.addObject("MD", "pagelist");
		mv.setViewName("main");
		return mv;
	}

}