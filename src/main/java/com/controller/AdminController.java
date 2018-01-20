package com.controller;



import java.io.BufferedOutputStream;





import java.io.FileOutputStream;

import java.io.IOException;



import javax.servlet.http.HttpServletRequest;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.transaction.annotation.Transactional;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.CategoryDAO;
import com.spring.dao.ProductDAO;
import com.spring.dao.SupplierDAO;
import com.spring.model.Category;
import com.spring.model.Product;
import com.spring.model.Supplier;





@Controller
public class AdminController 

{

	@Autowired

	SupplierDAO supplierDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;



	

	@RequestMapping("/admin/adding")

	public String adding()

	{

		return "adding";

	}

	@RequestMapping(value="/admin/saveSupp",method=RequestMethod.POST)

	@Transactional

	public ModelAndView saveSuppData(@RequestParam("sid") int sid,@RequestParam("sname")String sname)

	{

		ModelAndView mv=new ModelAndView();

		Supplier ss= new Supplier();

		ss.setSid(sid);

		ss.setSname(sname);

		supplierDAO.insertSupplier(ss);

		mv.setViewName("adding");

		return mv;

	}

	@RequestMapping(value="/admin/saveCat",method=RequestMethod.POST)

	@Transactional

	public ModelAndView saveCatData(@RequestParam("cid") int cid,@RequestParam("cname") String cname)

	{

		ModelAndView mv=new ModelAndView();

		Category cc= new Category();

		cc.setCid(cid);cc.setCname(cname);

		categoryDAO.insertCategory(cc);

		mv.setViewName("adding");

		return mv;

	}

	@RequestMapping(value="/admin/saveProduct",method=RequestMethod.POST)

	@Transactional

	public String saveprod(HttpServletRequest request,@RequestParam("file")MultipartFile file)

	{

		Product prod= new Product();

	

		prod.setPname(request.getParameter("pname"));

		prod.setPrice(Double.parseDouble(request.getParameter("price")));

		prod.setPdescription(request.getParameter("pdescription"));

		prod.setPstock(Integer.parseInt(request.getParameter("pstock")));

		prod.setCategory(categoryDAO.findByCatId(Integer.parseInt(request.getParameter("pCategory"))));

		prod.setSupplier(supplierDAO.findBySuppId(Integer.parseInt(request.getParameter("pSupplier"))));

		

		String filepath =request.getSession().getServletContext().getRealPath("/");

		String filename= file.getOriginalFilename();

		prod.setImagName(filename);

		productDAO.insertProduct(prod);

		

		

		System.out.println("File path"+filepath);

		try

		{

			byte imagebyte[]=file.getBytes();

			BufferedOutputStream fos= new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));

			fos.write(imagebyte);

			fos.close();

		}

		catch(IOException e)

		{

			e.printStackTrace();

		}

		

		return "adding";



		

	}



	

	@ModelAttribute

	public void loadingDataInPage(Model m)

	{

		m.addAttribute("satList",supplierDAO.retrieve());

		m.addAttribute("catList",categoryDAO.retrieve());

		m.addAttribute("prodList",productDAO.retrieve());



	}
	@RequestMapping("/admin/productList")

	public ModelAndView prodlist()

	{

	ModelAndView mv= new ModelAndView();

	mv.addObject("prodList",productDAO.retrieve());

	mv.setViewName("productAdminList");

	return mv;

	}

	

	@RequestMapping("/admin/supplierList")

	public ModelAndView satlist()

	{

		ModelAndView mv= new ModelAndView();

		mv.addObject("satList",supplierDAO.retrieve());

		mv.setViewName("supplierAdminList");

		return mv;

		

	}

	@RequestMapping("/admin/categoryList")

	public ModelAndView catlist()

	{

		ModelAndView mv= new ModelAndView();

		mv.addObject("catList",categoryDAO.retrieve());

		mv.setViewName("categoryAdminList");

		return mv;

		

	}
	

    

	@RequestMapping("/deleteSupp/{sid}")

	public String deleteSupplier(@PathVariable("sid")int sid)

	{

		supplierDAO.deletesupp(sid);

		return "redirect:/admin/supplierList?del";

	}

	@RequestMapping("/deleteCat/{cid}")

	public String deleteCategory(@PathVariable("cid")int cid)

	{

		categoryDAO.deletecat(cid);

		return "redirect:/admin/categoryList?del";

	}
	@RequestMapping("/deleteProd/{pid}")

	public String deleteProduct(@PathVariable("pid")int pid)

	{

		productDAO.deleteProd(pid);

		return "redirect:/admin/productList?del";

	}
	
    


    



	

	

	@RequestMapping("/updateProd")

	public ModelAndView updateproduct(@RequestParam("pid") int pid)

	{

		ModelAndView mv= new ModelAndView();

		Product p=productDAO.findByPID(pid);

		mv.addObject("prod",p);

		mv.addObject("catList",categoryDAO.retrieve());

		mv.addObject("satList",supplierDAO.retrieve());

		mv.setViewName("updateProduct");

		return mv;

	}

	@RequestMapping(value="/ProductUpdate",method=RequestMethod.POST)

	@Transactional

	public String updateprod(HttpServletRequest request,@RequestParam("file")MultipartFile file)

	{

		String pid= request.getParameter("pid");

		Product prod= new Product();

		prod.setPid(Integer.parseInt(pid));

		

	

		prod.setPname(request.getParameter("pname"));

		prod.setPrice(Double.parseDouble(request.getParameter("price")));

		prod.setPdescription(request.getParameter("pdescription"));

		prod.setPstock(Integer.parseInt(request.getParameter("pstock")));

		String cat=request.getParameter("pCategory");

		String sat=request.getParameter("pSupplier");

		prod.setCategory(categoryDAO.findByCatId(Integer.parseInt(cat)));

		prod.setSupplier(supplierDAO.findBySuppId(Integer.parseInt(sat)));

		

		String filepath =request.getSession().getServletContext().getRealPath("/");

		String filename= file.getOriginalFilename();

		prod.setImagName(filename);

		/*productDAO.updateprod(prod);*/

		System.out.println("File path"+filepath);

		try

		{

			byte imagebyte[]=file.getBytes();

			BufferedOutputStream fos= new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));

			fos.write(imagebyte);

			fos.close();

		}

		catch(IOException e)

		{

			e.printStackTrace();

		}

		return "redirect:/admin/productList?update";

		

	}



	





}