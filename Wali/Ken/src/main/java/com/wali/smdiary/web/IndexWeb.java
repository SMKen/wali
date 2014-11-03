package com.wali.smdiary.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wali.smdiary.entity.SmDiaryAdmin;
import com.wali.smdiary.service.ISmDiaryAdminService;

@Controller
@RequestMapping("/index")
@SessionAttributes(types = SmDiaryAdmin.class, value = "admins")
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

	@RequestMapping(value = "/doLogout", method = RequestMethod.GET)
	public String doLogout(ModelMap mm,HttpServletRequest request)
	{
		mm.remove("admins");
		mm.addAttribute("admins", null);
		mm.clear();
		request.getSession().removeAttribute("admin");
		return "redirect:/db";
	}

	@RequestMapping(value = "/langus", method = RequestMethod.GET)
	public String langus(HttpServletRequest request)
	{
		request.getSession().setAttribute("lg", "us");;
		return "redirect:/";
	}
	
	@RequestMapping(value = "/langcn", method = RequestMethod.GET)
	public String langcn(HttpServletRequest request)
	{
		request.getSession().setAttribute("lg", "cn");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/lang/{lg}/{url}", method = RequestMethod.GET)
	public String lang(@PathVariable String lg,@PathVariable String url,HttpServletRequest request)
	{
		if(lg != null && !lg.equals("") && lg.equals("us"))
		{
			request.getSession().setAttribute("lg", "us");
		}else{
			request.getSession().setAttribute("lg", "cn");
		}
		
		if(null == url || url.equals("") || url.equals("Ken"))
		{
			return "redirect:/";
		}
		else{
			return "redirect:/"+url;
		}
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String doLogin(String email, String pwd, ModelMap mm,HttpServletRequest request)
	{
		SmDiaryAdmin ad = admin.login(email, pwd);
		if (ad != null)
		{
			ad.setPwd("***");
			mm.addAttribute("admins", ad);
			request.getSession().setAttribute("admin", ad);
			return "redirect:/db";
		}
		mm.addAttribute("emaill", email);
		mm.addAttribute("msg", "用户名或密码不对。");
		return "redirect:/index/login";
	}
}