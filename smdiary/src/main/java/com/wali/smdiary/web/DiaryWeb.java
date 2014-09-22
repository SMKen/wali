package com.wali.smdiary.web;

import java.util.ArrayList;
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
				String date = DateUtil.formatDateZH(sd.getDiaryDay());
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
	public ModelAndView main()// @ModelAttribute("admin") SmDiaryAdmin admin
	{
		// List<SmDiary> diarys = service.getPagesByParams(new String[] {
		// "admin" }, new String[] { admin.getUid() }, new Page(1));
		List<SmDiary> diarys = service.getListByParams(null, null);
		ModelAndView mv = getCateGoryTimeMV();
		mv.addObject("diarys", diarys);
		mv.addObject("MD", "main");
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("admin") SmDiaryAdmin admin)
	{
		// List<SmDiary> diarys = service.getPagesByParams(new String[] {
		// "admin" }, new String[] { admin.getUid() }, new Page(1));
		List<SmDiary> diarys = service.getListByParams(null, null);

		ModelAndView mv = getCateGoryTimeMV();
		mv.addObject("diarys", diarys);
		mv.addObject("MD", "list");
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
		if(count >=1)
		{
			json.put("flag", true);
		}else{
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

	@RequestMapping(value = "/doadd", method = RequestMethod.POST)
	public ModelAndView doAdd(@ModelAttribute("diary") SmDiary diaryadd)// ,
	{
		// diary.setAdmin(admin.getUid());
		diaryadd.setCreateTime(new Date());
		diaryadd.setUpdateTime(new Date());
		diaryadd.setUid(StringUtil.getUUID());
		if(diaryadd.getDiaryDay() ==null)
		{
			diaryadd.setDiaryDay(new Date());
		}
		boolean flag = service.doSave(diaryadd);

		ModelAndView mv = getCateGoryTimeMV();
		if(flag)
		{
			mv.addObject("msg", "发布成功!");	
		}else
		{
			mv.addObject("msg", "发布失败!");	
		}
		List<SmDiary> diarys = service.getListByParams(null, null);

		mv.addObject("diarys", diarys);
		mv.addObject("MD", "list");
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/doMod", method = RequestMethod.POST)
	public ModelAndView doUpdate(@ModelAttribute("diary") SmDiary diary)
	{
		//diary.setAdmin(admin.getUid());
		diary.setCreateTime(new Date());
		diary.setUpdateTime(new Date());
		//diary.setUid(StringUtil.getUUID());
		boolean flag = service.doUpdate(diary);
		ModelAndView mv = getCateGoryTimeMV();
		mv.addObject("diary", diary);
		mv.addObject("flag", flag);
		if(flag)
		{
			mv.addObject("msg", "发布成功!");	
		}else
		{
			mv.addObject("msg", "发布失败!");	
		}
		List<SmDiary> diarys = service.getListByParams(null, null);

		mv.addObject("diarys", diarys);
		mv.addObject("MD", "list");
		mv.setViewName("main");
		return mv;
	}

}