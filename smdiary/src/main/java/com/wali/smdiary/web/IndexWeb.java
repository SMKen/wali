package com.wali.smdiary.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wali.smdiary.service.SmDiaryAdminService;

@Controller
@RequestMapping("/index")
public class IndexWeb
{

	@Resource(name = "smDiaryAdminService")
	private SmDiaryAdminService service;
/*
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index()
	{
		return new ModelAndView("index");
	}
*/
	@RequestMapping(value = "/ma", method = RequestMethod.GET)
	public ModelAndView manage()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "HelloMVC");
		mv.setViewName("manage");
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login()
	{
		int c = service.doCount();
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", c);
		mv.setViewName("main");
		return mv;
	}
}