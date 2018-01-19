package com.controller;



import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import com.spring.dao.*;

import com.spring.model.*;



@Controller

public class IndexController {

	@Autowired

	UserDAO userDAO;

	

	@Autowired

	SupplierDAO supplierDAO;

	

	@Autowired

	CategoryDAO categoryDAO;

	

	@Autowired

	ProductDAO productDAO;

	 @RequestMapping(value="/",  method=RequestMethod.GET)

	    public String homePage(HttpSession session,Model m)

	    {

	    	session.setAttribute("categoryList", categoryDAO.retrieve());

	    	session.setAttribute("ProductList",productDAO.retrieve());

	   	/*session.setAttribute("CartList", cartDAO.listCart());*/

	    /*	m.addAttribute("UserClickedshowproduct", "true");*/

	    

	    	

	       return "index";

	    }

@RequestMapping(value="/goToregister",method=RequestMethod.GET)

public ModelAndView goToregister()

{

	ModelAndView mv=new ModelAndView();

	mv.addObject("user",new User());

	

	mv.setViewName("register");

	return mv;

}

@RequestMapping(value="/saveUser",method=RequestMethod.POST)

public ModelAndView saveUserData(@ModelAttribute("user")User user,BindingResult result)

{

	ModelAndView mv=new ModelAndView();

	if(result.hasErrors())

	{

		mv.setViewName("register");

		return mv;

		

	}

	else

	{

		user.setEnabled(true);

		user.setRole("ROLE_USER");

		userDAO.insertUser(user);

		mv.setViewName("index");

	}

	return mv;

}



@RequestMapping(value="/productCustList")

public ModelAndView getCustTable(@RequestParam("cid") int cid)

{

	ModelAndView mv=new ModelAndView();

	mv.addObject("prodList", productDAO.findByPID(cid));

	mv.setViewName("productCustList");

	return mv;

}

@ModelAttribute

public void getData(Model m)

{

	m.addAttribute("catList", categoryDAO.retrieve());

}

@RequestMapping(value="/goToLogin",method=RequestMethod.GET)

public ModelAndView goTOLogin()

{

	ModelAndView mv= new ModelAndView();



	mv.setViewName("Login");

	return mv;

	

	

}

@RequestMapping("/userLogged")

public String login(){

	return "redirect:/";

}





@RequestMapping("/error")

public String userError()

{

	return "error";

}

@RequestMapping("/reLogin")

public String relogin()

{

	return "redirect:/goTLlogin";

}



@RequestMapping(value ="nav/{id}" )

public String ShowProductByCategory(@PathVariable("id") int id,RedirectAttributes attributes,Model m) {

	

	

	

  attributes.addFlashAttribute("ListProduct", productDAO.getProdByCatId(id));

  

    return "redirect:/";

}

}