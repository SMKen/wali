package com.wali.smdiary.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wali.common.lang.StringUtil;
import com.wali.common.web.Page;
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

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView manage(@ModelAttribute("admin") SmDiaryAdmin admin)
	{
		List<SmDiary> diarys = service.getPagesByParams(new String[] { "admin" }, new String[] { admin.getUid() }, new Page(1));

		ModelAndView mv = new ModelAndView();
		mv.addObject("diarys", diarys);
		mv.setViewName("list");
		return mv;
	}

	@RequestMapping(value = "/toAdd", method = RequestMethod.GET)
	public ModelAndView toAdd()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("add");
		return mv;
	}

	@RequestMapping(value = "/toMod/{uid}", method = RequestMethod.GET)
	public ModelAndView toMod(@PathVariable String uid)
	{
		SmDiary sd = service.getOneById(uid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("diary", sd);
		mv.setViewName("mod");
		return mv;
	}

	@RequestMapping(value = "/doDel/{uid}", method = RequestMethod.GET)
	public ModelAndView doDel(@PathVariable String uid)
	{
		int sd = service.doDeleteByParam("UID", uid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("diary", sd);
		mv.setViewName("mod");
		return mv;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView doAdd(@ModelAttribute("diary") SmDiary diary, @ModelAttribute("admin") SmDiaryAdmin admin)
	{
		diary.setAdmin(admin.getUid());
		diary.setCreateTime(new Date());
		diary.setUpdateTime(new Date());
		diary.setUid(StringUtil.getUUID());
		boolean flag = service.doSave(diary);
		ModelAndView mv = new ModelAndView();
		mv.addObject("diary", diary);
		mv.addObject("flag", flag);
		mv.setViewName("add");
		return mv;
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView doUpdate(@ModelAttribute("diary") SmDiary diary, @ModelAttribute("admin") SmDiaryAdmin admin)
	{
		diary.setAdmin(admin.getUid());
		diary.setCreateTime(new Date());
		diary.setUpdateTime(new Date());
		diary.setUid(StringUtil.getUUID());
		boolean flag = service.doUpdate(diary);
		ModelAndView mv = new ModelAndView();
		mv.addObject("diary", diary);
		mv.addObject("flag", flag);
		mv.setViewName("update");
		return mv;
	}

}