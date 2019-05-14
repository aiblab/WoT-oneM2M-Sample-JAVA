package com.web.menu.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.hs.iot.web.service.OneM2MBridgeService;
import com.web.common.utils.ConvertJsonObjectUtils;
import com.web.domain.adn.AdnResponse;
import com.web.domain.device.Device;
import com.web.domain.device.DeviceSensor;
import com.web.domain.menu.Menu;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private OneM2MBridgeService oneM2MBridgeService;
	private JSONObject json;

	@Override
	public String menuList() {
		// TODO Auto-generated method stub

		List<Menu> menuList = new ArrayList<>();

		Gson gson = new Gson();
		String jsonMenuList = null;

		try { 
			JSONArray adnAll = oneM2MBridgeService.getADNAll();

			List<AdnResponse> adnList = gson.fromJson(adnAll.toString(), new TypeToken<List<AdnResponse>>() {
			}.getType());

			for (int i = 1; i < adnList.size(); i++) {
				String adnId = adnList.get(i).getNm();

				json = ConvertJsonObjectUtils.convertJSONObjectForDeviceAll(adnId);
				JSONObject deviceAll = oneM2MBridgeService.getDeviceAll(json);

				String deviceReplace = deviceAll.toString().replace("m2m:", "m2m");

				Menu menu = new Menu();
				menu.setAdnId(adnId);

				if (deviceAll.length() > 0) {
					Device device = gson.fromJson(deviceReplace, Device.class);
					menu.setSensorList(device.getM2mae().getCh());
				}

				System.out.println(menu);
				menuList.add(menu);

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		jsonMenuList = gson.toJson(menuList);
		return jsonMenuList;
	}

}
