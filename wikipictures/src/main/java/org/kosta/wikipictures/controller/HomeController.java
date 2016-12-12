package org.kosta.wikipictures.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("{viewName}.do")
	public String showView(@PathVariable String viewName){
		//System.out.println("1.@PathVariable:"+viewName);
		return viewName;
	}
	@RequestMapping("{dirName}/{viewName}.do")
	public String showView(@PathVariable String dirName,@PathVariable String viewName){
		//System.out.println("2.@PathVariable:"+dirName+"/"+viewName);
		return dirName+"/"+viewName;
	}
	
}
