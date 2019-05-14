package com.web.sensor.service;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.iot.web.service.OneM2MBridgeService;
import com.web.common.utils.ConvertJsonObjectUtils;
import com.web.domain.sensor.Sensor;

@Service
public class SensorServiceImpl implements SensorSerivce {

	@Autowired
	public OneM2MBridgeService oneM2MBridgeService;
	private JSONObject json;

	@Override
	public int registrySensor(Sensor sensor) {
		int result = 0;
		int update = 0;

		try {
			json = ConvertJsonObjectUtils.convertJSONObjectForSensor(sensor);
			result = oneM2MBridgeService.registrySensor(json);

			if (result == 404) {
				result = oneM2MBridgeService.registrySensor(json);
				System.out.println("> Result - create SENSOR : " + result);
			} else if (result == 200) {
				System.out.println("> Result - already registered SENSOR : " + result);
				update = oneM2MBridgeService.updateSensor(json);
				System.out.println("> Result - update SENSOR : " + update);
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

	@Override
	public String getDevice(Sensor sensor) {
		String deviceReplace = null;
		try {
			json = ConvertJsonObjectUtils.convertJSONObjectForDevice(sensor);
			JSONObject device = oneM2MBridgeService.getDevice(json);

			deviceReplace = device.toString().replace("m2m:", "m2m");

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// JSONArray adnAll = oneM2MBridgeService.getADNAll();
		// TODO Auto-generated method stub
		return deviceReplace;
	}

	@Override
	public int deleteSensor(Sensor sensor) {

		int result = 0;
		try {
			json = ConvertJsonObjectUtils.convertJSONObjectForSensor(sensor);
			result = oneM2MBridgeService.deleteSensor(json);

			if (result == 200) {
				System.out.println("> Result - deleted SENSOR : " + result);
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

	@Override
	public String sendSensingReport(Sensor sensor) {
		// TODO Auto-generated method stub
		JSONObject lastValue= null;
		int result =0;
		
		try {
			json = ConvertJsonObjectUtils.convertJSONObjectForSensor(sensor);
			
			result = oneM2MBridgeService.sendSensingReport(json);
			
			if(result == 201) {
				System.out.println("> Result – posted sensing report : " + result);
				
				json = ConvertJsonObjectUtils.convertJSONObjectForLastValue(sensor.getAdnId(), sensor.getSensorId());
				lastValue = oneM2MBridgeService.getLastValue(json);
			} else {
				System.out.println("> Result - Internal server error : " + result);
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		
		return lastValue.toString();
	}
}
