package com.food.tmf.controller;

import java.util.ArrayList; 
import java.util.List; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation. RequestMethod; 
import com.food.tmf.RestaurantDTO;


@Controller
@RequestMapping
public class HomePageController {
	
	@RequestMapping(value="/home", method=RequestMethod.GET) 
	public String getAllRestuarents (Model m) 
	{ 
		System.out.println("/home url invoked "); 
		String resName = "BURGER KING"; 
		List<RestaurantDTO> resList = new ArrayList<RestaurantDTO>(); 
		resList = getResList(); 
		m.addAttribute("resList", resList); return "header"; 
	}
	@RequestMapping(value="/home", method=RequestMethod.POST) 
	public String getLoginDetails() 
	{
		System.out.println("/login url invoked "); 
		return "footer"; 
	} 
	public List<RestaurantDTO> getResList()
	{
		List<RestaurantDTO> resList = new ArrayList<RestaurantDTO>(); 
		List<String> cuisinsList = new ArrayList<String>(); 
		cuisinsList.add("South"); 
		cuisinsList.add("Italian"); 
		resList.add(new RestaurantDTO("PIZZA HUT", "4.4","350.00", cuisinsList)); 
		resList.add(new RestaurantDTO("ALPHA", "4.1","150.00", cuisinsList )); 
		resList.add(new RestaurantDTO ("VANTILLU", "4.0","250.00", cuisinsList)); 
		resList.add(new RestaurantDTO("SAIRAM PARLOUR", "4.7", "300.00", cuisinsList)); 
		resList.add(new RestaurantDTO ("BURGER KING", "3.8","400.00", cuisinsList)); 
		return resList; 
	}

}
