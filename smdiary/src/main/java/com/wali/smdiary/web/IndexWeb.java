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

	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public ModelAndView hello2()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "HelloMVC");
		mv.setViewName("users");
		return mv;
	}

	@RequestMapping(value = "/count", method = RequestMethod.GET)
	public ModelAndView count()
	{
		int c = service.getCount();
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", c);
		mv.setViewName("main");
		return mv;
	}
}