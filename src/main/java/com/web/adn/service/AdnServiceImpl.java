package com.web.adn.service;
 
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.iot.web.service.OneM2MBridgeService;
import com.web.common.utils.ConvertJsonObjectUtils;
import com.web.domain.adn.Adn;

@Service
public class AdnServiceImpl implements AdnService {

	@Autowired
	public OneM2MBridgeService oneM2MBridgeService;
	private JSONObject json;
 
	@Override
	public int doCreateADN(Adn adn) {

		int result = 0;

		try {
			json = ConvertJsonObjectUtils.convertJSONObjectForADN(adn);
			result = oneM2MBridgeService.checkDuplicated(json);

			if (result == 404) {
				result = oneM2MBridgeService.createADN(json);
				System.out.println("> Result - create ADN : " + result);
			} else if (result == 200) {
				System.out.println("> Result - already registered ADN : " + result);
			} else {
				System.out.println("> Result - Internal server error : " + result);
			}

		} catch (JSONException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
