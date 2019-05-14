package com.web.common.utils;

import org.json.JSONException;
import org.json.JSONObject;

import com.web.domain.adn.Adn;
import com.web.domain.sensor.Sensor;

public class ConvertJsonObjectUtils {

	static JSONObject json = new JSONObject();

	public static JSONObject convertJSONObjectForADN(Adn adn) throws JSONException {

		json.put("ADN.ID", adn.getAdnId());
		json.put("ADN.NAME", adn.getAdnName());
		json.put("CHECK.URI", adn.getAdnId());

		return json;
	}

	public static JSONObject convertJSONObjectForDeviceAll(String adnId) throws JSONException {
		json.put("ADN.ID", adnId);
		return json;
	}

	public static JSONObject convertJSONObjectForDevice(Sensor sensor) throws JSONException {
		json.put("ADN.ID", sensor.getAdnId());
		json.put("SENSOR.ID", sensor.getSensorId());
		json.put("CHECK.URI", sensor.getAdnId() + "/" + sensor.getSensorId());
		return json;
	}

	public static JSONObject convertJSONObjectForSensor(Sensor sensor) throws JSONException {
		json.put("ADN.ID", sensor.getAdnId());
		json.put("SENSOR.ID", sensor.getSensorId());
		json.put("SENSOR.NAME", sensor.getSensorName());
		json.put("SENSOR.HISTORY", sensor.getSensorHistory());
		json.put("SENSING.NAME", sensor.getSensorName());
		json.put("SENSING.VALUE", sensor.getSensingValue());
		return json;
	}
	
	public static JSONObject convertJSONObjectForLastValue (String andId, String sensorId) throws JSONException {
		JSONObject json = new JSONObject();
		
		json.put("ADN.ID", andId); 
		json.put("ID", sensorId);
		
		return json;
	}

}
