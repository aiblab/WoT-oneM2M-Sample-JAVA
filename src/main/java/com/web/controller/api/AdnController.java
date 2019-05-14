package com.web.controller.api;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.web.adn.service.AdnService;
import com.web.domain.adn.Adn;
import com.web.menu.service.MenuService; 

@RestController
public class AdnController {

	@Autowired
	private AdnService adnService;

	@Autowired
	private MenuService menuService;

	
	@RequestMapping(value="/api/getAdnListAll", method = RequestMethod.GET)
	public String getAdnListAll(){
		String menuList = menuService.menuList(); 
		return menuList;
	}
	
	@RequestMapping(value="/api/createADN", method = RequestMethod.POST)
	public int createADN(@RequestBody Adn adn){
		
		int result = adnService.doCreateADN(adn);
		return result;
	}
}
