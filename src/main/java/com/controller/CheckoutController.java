package com.controller;



import java.sql.Timestamp;

import java.text.SimpleDateFormat;

import java.util.Calendar;

import java.util.List;



import javax.servlet.http.HttpSession;

import javax.validation.Valid;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;

import org.springframework.web.bind.WebDataBinder;

import org.springframework.web.bind.annotation.InitBinder;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import com.spring.dao.AddressDAO;

import com.spring.dao.CartDAO;

import com.spring.dao.CategoryDAO;

import com.spring.dao.OrdersDAO;

import com.spring.dao.PaymentDAO;

import com.spring.dao.ProductDAO;

import com.spring.dao.SupplierDAO;

import com.spring.dao.UserDAO;

import com.spring.model.Address;

import com.spring.model.Cart;

import com.spring.model.Orders;

import com.spring.model.Payment;

import com.spring.model.Product;

import com.spring.model.User;



@Controller

public class CheckoutController 

{

	

	@Autowired

	CartDAO cartDAO;

	

	@Autowired

	AddressDAO addressDAO;

	

	

	@Autowired

	PaymentDAO paymentDAO;

	

	@Autowired

	OrdersDAO ordersDAO;

	



	

	@Autowired

	UserDAO userDAO;

	

	@Autowired

	SupplierDAO supplierDAO;

	

	@Autowired

	CategoryDAO categoryDAO;

	

	@Autowired

	ProductDAO productDAO;

	

	@RequestMapping(value="checkout",method = RequestMethod.GET)

	public String showShippingPage(@ModelAttribute("address") Address address,BindingResult result, HttpSession session,Model model){

		

		User user = (User) session.getAttribute("user");

		

		model.addAttribute("CartList", cartDAO.listCart());

				

		

		return "shipping";

	}

	

	

	@RequestMapping(value="selectShippingAddress",method = RequestMethod.POST)

	public String selectShippingAddress(@RequestParam("shipaddress") int id,HttpSession session,Model m,RedirectAttributes attributes){

		

		User user = (User) session.getAttribute("user");

		

		Address address = addressDAO.getAddressById(id);

		session.setAttribute("address", address);

		attributes.addFlashAttribute("address", address);

		attributes.addFlashAttribute("cartTotalAmount", cartDAO.CartPrice(user.getId()));

		

		return "redirect:/showpaymentPage";

	}

	

	@RequestMapping(value="saveShippingAddress",method = RequestMethod.POST)

	public String saveShippingPage(@Valid @ModelAttribute("address") Address address,BindingResult result, HttpSession session,Model m,RedirectAttributes attributes){

		if(result.hasErrors()){

			System.out.println(result.getAllErrors().toString());

			return "shipping";

		}else{

		User user = (User) session.getAttribute("user");

		address.setCreatedBy("SYSTEM");

		address.setCreatedTimestamp(new Timestamp(System.currentTimeMillis()));

		

		addressDAO.saveOrUpdate(address);

		session.setAttribute("address", address);

		attributes.addFlashAttribute("address", address);

		

		 return "paymentPage";

		}

	}

	

	@RequestMapping(value="paymentPage")

	public String PaymentPage(@ModelAttribute("payment") Payment payment,BindingResult result,HttpSession session,Model model){

		User user = (User) session.getAttribute("user");

		Address address = (Address) session.getAttribute("address");

		model.addAttribute("address", address);

		model.addAttribute("payment", payment);

		

		return "paymentPage";

	}

	

	@RequestMapping(value="selectPaymentMethod")

	public String selectPaymentMethod(@Valid @ModelAttribute("payment") Payment payment,BindingResult result,HttpSession session,Model m,RedirectAttributes attributes){

		if(result.hasErrors()){

			System.out.println(result.getAllErrors().toString());

			return "paymentPage";

		}else{

		User user = (User) session.getAttribute("user");

		String paymentChoice = "";

		if(payment.getPaymentMethod().equals("creditcard")){

			paymentChoice = "Credit Card";

		}else if(payment.getPaymentMethod().equals("debitcard")){

			paymentChoice = "Debit Card";

		}else if(payment.getPaymentMethod().equals("netbanking")){

			paymentChoice = "NetBanking";

		}else if(payment.getPaymentMethod().equals("cod")){

			paymentChoice = "Cash On Delivery";

		}

		

		

		return "redirect:/orderSummary";

		}

	}

	

	@RequestMapping(value="orderSummary",method = RequestMethod.GET)

	public String showOrderSummary(HttpSession session,Model model){

		

		User user = (User) session.getAttribute("user");

		Address address = (Address) session.getAttribute("address");

		Payment payment = (Payment) session.getAttribute("payment");

		model.addAttribute("address", address);

		model.addAttribute("payment", payment);

		model.addAttribute("productList",productDAO.retrieve());

		return "orderSummary";

	}

	

	@RequestMapping(value="processOrder")

	public String placeOrder(HttpSession session, Model model){

				

		

		User user = (User) session.getAttribute("user");		

		

		Address address = (Address) session.getAttribute("address");

		

		Payment payment = (Payment) session.getAttribute("payment");

		

		List<Cart> cartItemsList = cartDAO.listCart();

				

		double totalAmount = 0;

		

		

		for(Cart cartItem:cartItemsList){

			

			totalAmount += cartItem.getProductPrice() * cartItem.getProductQuantity();

		}

		

		for(Cart cartItem:cartItemsList){

			

			

			Orders order=new Orders();

			String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());

			order.setOrderId(timeStamp);

			

			order.setTotalAmount(totalAmount);

			order.setOrderStatus("PROCESSED");	

			order.setCreatedTimestamp(new Timestamp(System.currentTimeMillis()));

			order.setCreatedBy("SYSTEM");

			

			

			ordersDAO.saveOrUpdate(order);

						

			Product product = productDAO.findByPID(cartItem.getProductid());

			int quantityRemaining = product.getPstock() - cartItem.getProductQuantity();

			product.setPstock(quantityRemaining);

			

			productDAO.insertProduct(product);

			

			cartDAO.removeCartById(cartItem.getCid());

		}

		

		return "redirect:showinvoice";

	}

	

	@RequestMapping(value="showinvoice")

	public String showInvoiceAcknoledgement(HttpSession session,Model model){

			

		if(session != null){

			

			User user = (User) session.getAttribute("user");

			model.addAttribute("productList", productDAO.retrieve());

		    model.addAttribute("categoryList", categoryDAO.retrieve());

		}

		else{

			

			model.addAttribute("error", "No order detail found");

			

		}

		return "acknowledgement";

	}

	

	@InitBinder

	public void initBinder(WebDataBinder binder) {

	    binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));

	}

}

