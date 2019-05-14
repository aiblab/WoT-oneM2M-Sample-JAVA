package com.web.domain.device;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter 
@Setter
public class DeviceDetail {
	private String rn;
	private int ty;
	private String ri;
	private String pi;
	private String ct;
	private String it;
	private String lbl;
	private String et;
	private String apn;
	private String api;
	private String aei;
	private String poa;
	private String rr;
	private String csz;
	private List<DeviceSensor> ch;

}
