package com.web.sensor.service;

import com.web.domain.sensor.Sensor;

public interface SensorSerivce {

	int registrySensor(Sensor sensor);

	String getDevice(Sensor sensor);

	int deleteSensor(Sensor sensor);

	String sendSensingReport(Sensor sensor);

}
