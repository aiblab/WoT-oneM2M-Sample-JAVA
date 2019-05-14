package com.web.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.web.domain.sensor.Sensor;
import com.web.sensor.service.SensorSerivce;

@RestController
public class SensorController {
	@Autowired
	private SensorSerivce sensorService;
	
	@RequestMapping(value="/api/registrySensor", method = RequestMethod.POST)
	public int registrySensor(@RequestBody Sensor sensor){
		int result = sensorService.registrySensor(sensor); 
		return result;
	}
	
	@RequestMapping(value="/api/getDevice", method = RequestMethod.POST)
	public String getDevice(@RequestBody Sensor sensor){
		String result = sensorService.getDevice(sensor);
		return result;
	}
	
	@RequestMapping(value="/api/deleteSensor", method = RequestMethod.POST)
	public int deleteSensor(@RequestBody Sensor sensor){
		int result = sensorService.deleteSensor(sensor);
		return result;
	}
	
	
	@RequestMapping(value="/api/sendSensingReport", method = RequestMethod.POST)
	public String sendSensingReport(@RequestBody Sensor sensor){
		String result = sensorService.sendSensingReport(sensor);
		return result;
	}
	
	//sendSensingReport
}
