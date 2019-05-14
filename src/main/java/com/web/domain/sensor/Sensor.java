package com.web.domain.sensor;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Sensor {
	private String adnId;
	private String sensorId;
	private String sensorName;
	private String sensorHistory;
	private String sensingValue;
}
