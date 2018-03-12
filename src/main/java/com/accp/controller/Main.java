package com.accp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Main")
public class Main {
	
	@RequestMapping("/todata")
	public String tologin(){
		return "main/datatable";
	}

	@RequestMapping("/main")
	public String main(){
		return "main/main";
	}


}