package com.tmf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class IndexPageController {
	
	@RequestMapping("/hello") 
	public String helloWorld()
    {
        return "/WEB-INF/view/header.jsp";
    }

}
