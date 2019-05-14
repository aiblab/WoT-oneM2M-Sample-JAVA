package com.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {
 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getSampleAppMainView(HttpServletRequest request) { 
		return new ModelAndView("redirect:/info");
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView getSampleAppInfoView(HttpServletRequest request) {
		return new ModelAndView("info"); 
	}

	
	@RequestMapping(value = "/adn", method = RequestMethod.GET)
	public ModelAndView getSampleAppAdnView(HttpServletRequest request) { 
		String oneM2M_scl_base_url = "test";
		return new ModelAndView("contents/adn", "oneM2M_scl_base_url", oneM2M_scl_base_url);
	}

	@RequestMapping(value = "/sensor/{adnId}", method = RequestMethod.GET)
	public ModelAndView getSampleAppSensorParamsView(HttpServletRequest request, @PathVariable String adnId) {  
		if(StringUtils.isEmpty(adnId)){
			return new ModelAndView("redirect:/adn");
		}else{
			return new ModelAndView("contents/sensor");
		}  
	}
	
	@RequestMapping(value = "/sensor", method = RequestMethod.GET)
	public ModelAndView getSampleAppSensorView(HttpServletRequest request) { 
		return new ModelAndView("redirect:/adn");
	}
	
	@RequestMapping(value = "/report/{sensorId}", method = RequestMethod.GET)
	public ModelAndView getSampleAppSensorDetailParamsView(HttpServletRequest request, @PathVariable String sensorId) {  
		if(StringUtils.isEmpty(sensorId)){
			return new ModelAndView("redirect:/adn");
		}else{
			return new ModelAndView("contents/report");
		}  
	}
	
	@RequestMapping(value = "report", method = RequestMethod.GET)
	public ModelAndView getSampleAppSensorDetailView(HttpServletRequest request) { 
		return new ModelAndView("redirect:/adn");
	}
	 
}
