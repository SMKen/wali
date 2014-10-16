package com.wali.smdiary.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wali.smdiary.entity.SmDiaryAdmin;
import com.wali.smdiary.service.ISmDiaryAdminService;

@Controller
@RequestMapping("/index")
@SessionAttributes(types = SmDiaryAdmin.class, value = "admin")
public class IndexWeb
{

	@Resource(name = "smDiaryAdminService")
	private ISmDiaryAdminService admin;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "please login");
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String doLogin(String email, String pwd, ModelMap mm)
	{
		SmDiaryAdmin ad = admin.login(email, pwd);
		if (ad != null)
		{
			ad.setPwd("***");
			mm.addAttribute("admin", ad);
			return "redirect:/diary";
		}
		mm.addAttribute("emaill", email);
		mm.addAttribute("msg", "用户名或密码不对。");
		return "redirect:/index/login";
	}
}