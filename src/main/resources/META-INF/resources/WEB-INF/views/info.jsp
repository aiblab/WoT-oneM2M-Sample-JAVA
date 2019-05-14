<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<%-- @(#)main.jsp 1.0 2018-02-01                               	 			--%>
<%--                                                                        --%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<%-- 메인 화면.                                          	                    --%>
<%--                                                                        --%>
<%-- @author HANDYSOFT                  			                        --%>
<%-- @version 1.0 2018-02-01 			                                    --%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

		<div class="main-panel">
			<%@ include file="/WEB-INF/views/common/top.jsp"%>
			<div class="content" style="background-color: #fff;">
				<div class="container-fluid">
					<div class="row">
						<p class="h5">1. Handypia IoT Platform 서비스 환경설정 정보 확인</p>
						<dl class="row">
							<dt class="col-sm-2">서비스 환경설정 정보 확인</dt>
							<dd class="col-sm-10">
								개방형 클라우드 플랫폼 환경 변수
								<mark> VCAP_SERVICES</mark>
								를 확인하여 <strong>Handypia IoT Platform</strong>서비스 정보에서
								<mark>“onem2mBaseUrl”</mark>
								정보를 확인 한다.
							</dd>
							<dd class="col-sm-12"
								style="margin-top: 1em; margin-bottom: 1em;">
								<pre><code>{ 
  .....
  "system_env_json": {
    "VCAP_SERVICES": {
      <mark>"HandyPIA-IoT-Platform"</mark>: [
        {
          "credentials": {
            "password": "",
            <mark>"onem2mBaseUrl"</mark>: "http://13.125.35.229:8080/~/paas-in-13-125-35-229/base",
            "username": ""
          }, 
  .....
}</code></pre>
							</dd>
						</dl>

						<p class="h5">2. Library 정보</p>
						<dl class="row">
							<dt class="col-sm-12">Repository 설정 추가</dt> 
							<dd class="col-sm-12" style="margin-top: 1em; margin-bottom: 1em;">
								<pre><code>&lt;repositories&gt;
	&lt;repository&gt;
		&lt;id&gt;kr.co.handysoft.paragon&lt;/id&gt;
		&lt;name&gt;Bluesunrise Repository&lt;/name&gt;
		&lt;url&gt;http://paragon.handysoft.co.kr/repository/maven2/&lt;/url&gt;
	&lt;/repository&gt;
&lt;/repositories&gt;</code></pre>
							</dd>
							<dt class="col-sm-12">Dependancy 설정 추가</dt> 
							<dd class="col-sm-12"
								style="margin-top: 1em; margin-bottom: 1em;">
								<pre><code>&lt;dependencies&gt;
	&lt;dependency&gt;
		&lt;groupId&gt;com.hs.iot&lt;/groupId&gt;
		&lt;artifactId&gt;oneM2MBridge&lt;/artifactId&gt;
		&lt;version&gt;0.0.2-SNAPSHOT&lt;/version&gt;
	&lt;/dependency&gt;
&lt;/dependencies&gt;</code></pre>
							</dd>
						</dl>
						
						<p class="h5">3. 서비스 환경 설정</p>
						<p style="text-indent: 1em;">
							<small>
								웹 서비스 개발을 위해 제공되는 본 Library 는 Spring Framework 기준으로 구현되어 있다. 
								해당 서비스가 구동되기 위해서는 Spring 에서 제공하는 annotation @ComponentScan) 을 설정하거나, 
								application 구성 XML 파일에 환경을 설정해야 한다.
							</small>
						</p>
						<dl class="row">
							<dt class="col-sm-2">Annotation</dt>
							<dd class="col-sm-10">
							본 가이드에서는 <mark>SpringBootApplication</mark> 를 기준으로 설정한다.<br>
							서비스 개발을 위한 라이브러리는 <mark>com.hs.iot</mark> 하위 팩키지에 포함되어 있다. 
							</dd>
							<dd class="col-sm-12"
								style="margin-top: 1em; margin-bottom: 1em;">
							<pre><code>package com.hs.iot.web;

import ....

@SpringBootApplication
<mark><strong>@ComponentScan({"com.hs.iot "})</strong></mark>
public class WebServiceApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(WebServiceApplication.class);
	}
....
}</code></pre>
							</dd>
						</dl>
						
						<dl class="row">
							<dt class="col-sm-2">Application 구성 XML</dt>
							<dd class="col-sm-10">
							본 가이드에서는 oneM2M-context.xml 을 기준으로 설명한다.
							</dd>
							<dd class="col-sm-12"
								style="margin-top: 1em; margin-bottom: 1em;">
							<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans 
           http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
           http://www.springframework.org/schema/context
           http://www.springframework.org/schema/context/spring-context-3.0.xsd"&gt;
               
    &lt;context:component-scan base-package="<mark>com.hs.iot</mark>"/&gt;
     
&lt;/beans&gt;</code></pre>
							</dd>
						</dl>
						
						<p class="h5">4. API 정보</p>
						<p style="text-indent: 1em;">
							<small>
								본 개발가이드에 제공되는 내용을 oneM2M 서비스 사용 시 oneM2M 서비스에 제공되는 API를 쉽게 접근하기 위해 Bridge 를 제공하는 것으로 AE (Appilcation entiry), Sensor, Actuator 및 각 node 의 container instance 를 관리하고, 조회 기능을 제공한다. 이에 따라 oneM2M 에 대한 구조를 이해하고 관련 정보를 전달해야 한다.
또한, oneM2M 을 지원하는 장비가 직접적으로 oneM2M 서버와 연결된 경우 해당 장치의 정보를 확인하고, 전송된 정보를 조회할 수 있도록 기능을 제공한다.
							</small>
						</p> 
						<table class="table table-sm table-hover">
							<thead>
								<tr class="bg-primary">
									<th scope="col">API(Method) Name</th>
									<th scope="col">Return type</th>
									<th scope="col">Descriptions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>createADN(JSONObject adn)</td>
									<td>Integer</td>
									<td>Application Dedicated Node 또는 Application Entity를 생성하고, 처리 결과를 반환한다.</td>
								</tr>
								<tr>
									<td>checkDuplicated(JSONObject device)</td>
									<td>Integer</td>
									<td>ADN, sensor, actuator 등록 여부를 확인하고, 그 결과를 반환한다.</td>
								</tr>
								<tr>
									<td>registrySensor(JSONObject sensor)</td>
									<td>Integer</td>
									<td>Sensor(센서) node 를 등록하고, 그 처리 결과를 반환한다. Sensor(센서) Node 는 ADN 생성 후 Sensor 를 등록해야 한다.</td>
								</tr>
								<tr>
									<td>updateSensor(JSONObject sensor)</td>
									<td>Integer</td>
									<td>Sensor(센서) node 의 정보 중 Lable 과 History Log Count 를 변경하고, 그 결과를 반환한다.</td>
								</tr>
								<tr>
									<td>deleteSensor(JSONObject sensor)</td>
									<td>Integer</td>
									<td>Sensor(센서) node 및 하위 Sensin Value(Container Instance) Node 를 삭제하고, 그 결과를 반환한다.</td>
								</tr>
								<tr>
									<td>registryActuator(JSONObject actuator)</td>
									<td>Integer</td>
									<td>Actuator (제어기) node 를 등록하고, 그 처리 결과를 반환한다. Actuator Node 는 ADN 생성 후 Actuator 를 등록해야 한다.</td>
								</tr>
								<tr>
									<td>updateActuator(JSONObject actuator)</td>
									<td>Integer</td>
									<td>Actuator(제어기) node 의 정보 중 Lable 과 History Log Count 를 변경하고, 그 결과를 반환한다.</td>
								</tr>
								<tr>
									<td>deleteActuator(JSONObject actuator)</td>
									<td>Integer</td>
									<td>Actuator(제어기) node 및 하위 Actuation result(Container Instance) Node 를 삭제하고, 그 결과를 반환한다.</td>
								</tr>
								<tr>
									<td>sendSensingReport(JSONObject report)</td>
									<td>Integer</td>
									<td>Sensor(센서) node 의 센싱 결과 정보를 보고 하고, 그 결과를 반환한다.</td>
								</tr>
								<tr>
									<td>sendActuatorResult(JSONObject report)</td>
									<td>Integer</td>
									<td>Actuator(제어기) node 의 제어 결과 정보를 보고 하고, 그 결과를 반환한다.</td>
								</tr>
								<tr>
									<td>getDevice(JSONObject json)</td>
									<td>JSONObject</td>
									<td>등록된 Node 의 단일 정보를 반환한다.</td>
								</tr>
								<tr>
									<td>getDeviceAll(JSONObject json)</td>
									<td>JSONObject</td>
									<td>등록 ADN 의 전체 Node 정보를 반환한다.</td>
								</tr>
								<tr>
									<td>getLastValue(JSONObject json)</td>
									<td>JSONObject</td>
									<td>Sensor(센서) 또는 Actuator(제어기) node 의 등록된 센싱 결과 중 마지막 센싱 정보를 반환한다.</td>
								</tr>
								<tr>
									<td>getValues(JSONObject json)</td>
									<td>JSONArray</td>
									<td>Sensor(센서) 또는 Actuator(제어기) node 의 등록된 모든 센싱 정보를 반환한다.</td>
								</tr>
								<tr>
									<td>getADNAll()</td>
									<td>JSONArray</td>
									<td>CSL(Infra node)에 등록된 모든 ADN 목록을 반환한다.</td>
								</tr> 
							</tbody>
						</table>
						<div class="json-obj-list-div">
							<p style="font-weight:700;font-size:13px !important;">4.1 createADN</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td><p>ADN(Application Dedicated Node) 을 생성하기 위한 아이디를 입력한다. oneM2M 서버에서 해당 ID 는 중복되지 않아야 하므로, <mark>checkDuplication</mark>을 활용하여 중복체크 후 사용등록 처리 한다.
											<mark>ID 는 반드시 ‘S’ 또는 ‘C’ 가 prefix 로 사용되어야 한다.</mark></p>
											<p>EX> ID : raspberry > <mark>S</mark>raspberry</p>
										</td> 
									</tr>
									<tr>
										<td>ADN.NAME</td>
										<td>String</td>
										<td>ADN(Application Dedicated Node) 을 생성하기 위한 명칭을 입력한다.</td> 
									</tr> 
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 201</td>
										<td>oneM2M 서버에 ADN(Application Dedicated Node) 을 생성</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>서버 등록 시 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("ADN.NAME", "Multisensor Device");
json.put("CHECK.URI", "S0.2.481.2.100.0.41.43_AE ");
int result = oneM2MBridgeService.checkDuplicated(json);
if(result == 404) {
	result = oneM2MBridgeService.createADN(json);
	System.out.println("> Result - create ADN : " + result);
} else if(result == 200) {
	System.out.println("> Result - already registered ADN : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>	
							
							<p style="font-weight:700;font-size:13px !important;">4.2 checkDuplicated</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>CHECK.ID</td>
										<td>String</td>
										<td><p>중복체크는 ADN, Sensor, Actuator 를 모두 검사가 가능하고, oneM2M 에서는 Hierarchy 구조이기 때문에 ADN 과 ADN 하위의 Sensor 또는 Actuator를 URI 로 입력하여 체크한다. </p>
											<p>EX> </p>
											<p>- ADN 중복 체크할 경우 : 	CHECK.ID : “{ADN.ID}”</p>
											<p>- SENSOR.ID 를 중복 체크할 경우 : CHECK.ID : “{ADN.ID}/{SENSOR.ID}”</p>
										</td> 
									</tr>
									<tr>
										<td>ADN.NAME</td>
										<td>String</td>
										<td>ADN(Application Dedicated Node) 을 생성하기 위한 명칭을 입력한다.</td> 
									</tr> 
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 200</td>
										<td>oneM2M 서버에 이미 등록된 ID 가 있음</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>oneM2M 서버에 이미 등록된 ID 가 없음</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>서버 등록 시 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("ADN.NAME", "Multisensor Device");
json.put("CHECK.URI", "S0.2.481.2.100.0.41.43_AE ");
int result = oneM2MBridgeService.checkDuplicated(json);

if(result == 404) {
	result = oneM2MBridgeService.createADN(json);
	System.out.println("> Result - create ADN : " + result);
} else if(result == 200) {
	System.out.println("> Result - already registered ADN : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>	
							
							<p style="font-weight:700;font-size:13px !important;">4.3 registrySensor</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>SENSOR.ID</td>
										<td>String</td>
										<td>등록된 ADN 하위에 센서를 등록하기 위한 아이디를 입력한다.</td> 
									</tr> 
									<tr>
										<td>SENSOR.NAME</td>
										<td>String</td>
										<td>센서를 등록하기 위한 명칭을 입력한다.</td> 
									</tr> 
									<tr>
										<td>SENSOR.HISTORY</td>
										<td>String</td>
										<td>
										<p>등록된 센서에 센싱 리포트 등록 시 oneM2M 서버에서 히스토리 카운트를 입력한다. “10” 으로 입력된 경우 센싱리포트 결과가 10개까지 이력이 남는다.</p>
										<p><mark>getValues</mark>를 요청하는 경우 해당 히스토리 카운트에 등록된 만큼 결과값을 받을 수 있다.</p>
</td> 
									</tr> 
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 201</td>
										<td>ADN 하위에 해당 센서가 등록됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없음</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>서버 등록 시 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("SENSOR.ID", "3300-1");
json.put("SENSOR.NAME", "Temperature");
json.put("SENSOR.HISTORY", "10");
json.put("CHECK.URI", "S0.2.481.2.100.0.41.43_AE");
int result = oneM2MBridgeService.checkDuplicated(json);

if(result == 404) {
	result = oneM2MBridgeService.registrySensor(json);
	System.out.println("> Result - create SENSOR : " + result);
} else if(result == 200) {
	System.out.println("> Result - already registered SENSOR : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>	
							
							
							<p style="font-weight:700;font-size:13px !important;">4.4 updateSensor</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>SENSOR.ID</td>
										<td>String</td>
										<td>
											<p>센서 정보를 변경하기 위한 아이디를 입력한다.</p>
											<p><mark>이미 등록된 SENSOR.ID 는 변경할 수 없다.</mark></p>
										</td> 
									</tr> 
									<tr>
										<td>SENSOR.NAME</td>
										<td>String</td>
										<td>센서명을 변경하기 위한 명칭을 입력한다.</td> 
									</tr> 
									<tr>
										<td>SENSOR.HISTORY</td>
										<td>String</td>
										<td>센서의 히스토리 카운트 입력한다.</td> 
									</tr> 
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 200</td>
										<td>센서 정보가 변경 됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없거나, ADN 하위의 SENSOR 가 없음</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>변경 요청 시 시스템 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("SENSOR.ID", "3300-1");
json.put("SENSOR.NAME", "Temperature");
json.put("SENSOR.HISTORY", "10");
json.put("CHECK.URI", "S0.2.481.2.100.0.41.43_AE");
int result = oneM2MBridgeService.updateSensor(json);

if(result == 200) {
	System.out.println("> Result – update sensor : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>	
							
							
							
							
							<p style="font-weight:700;font-size:13px !important;">4.5 deleteSensor</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>SENSOR.ID</td>
										<td>String</td>
										<td>센서 삭제하기 위한 아이디를 입력한다.</td> 
									</tr>  
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 200</td>
										<td>센서가 삭제 됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없거나, ADN 하위의 SENSOR 가 없음</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>변경 요청 시 시스템 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("SENSOR.ID", "3300-1");
int result = oneM2MBridgeService.deleteSensor(json);

if(result == 200) {
	System.out.println("> Result - deleted SENSOR : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
} 
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>	
						
							
							
							<p style="font-weight:700;font-size:13px !important;">4.6 registryActuator</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>ACTUATOR.ID</td>
										<td>String</td>
										<td>등록된 ADN 하위에 제어기를 등록하기 위한 아이디를 입력한다.</td> 
									</tr> 
									<tr>
										<td>ACTUATOR.NAME</td>
										<td>String</td>
										<td>제어기 등록하기 위한 명칭을 입력한다.</td> 
									</tr> 
									<tr>
										<td>ACTUATOR.HISTORY</td>
										<td>String</td>
										<td>
											<p>등록된 제이거에 제어 결과 리포트 등록 시 oneM2M 서버에서 히스토리 카운트를 입력한다. “10” 으로 입력된 경우 제어 결과가 10개까지 이력이 남는다.</p>
											<p><mark>getValues</mark> 를 요청하는 경우 해당 히스토리 카운트에 등록된 만큼 결과값을 받을 수 있다.</p>
										</td> 
									</tr> 
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 201</td>
										<td>ADN 하위에 해당 제어기가 등록됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없음</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>
											<p>서버 등록 시 에러 발생</p>
											<p>ADN 하위 등록 시 ACTUATOR.ID 가 중복된 경우 </p>
										</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("ACTUATOR.ID", "3300-1");
json.put("ACTUATOR.NAME", "Temperature");
json.put("ACTUATOR.HISTORY", "10");
json.put("CHECK.URI", "S0.2.481.2.100.0.41.43_AE");
int result = oneM2MBridgeService.checkDuplicated(json);

if(result == 404) {
	result = oneM2MBridgeService.registryActuator(json);
	System.out.println("> Result - create actuator : " + result);
} else if(result == 200) {
	System.out.println("> Result - already registered actuator: " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}

</code></pre>
										</td>
									</tr>
								</tbody>
							</table>	
							
							
							<p style="font-weight:700;font-size:13px !important;">4.7 updateActuator</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>ACTUATOR.ID</td>
										<td>String</td>
										<td>
											<p>제어기 정보를 변경하기 위한 아이디를 입력한다.</p>
											<p><mark>이미 등록된 ACTUATOR.ID 는 변경할 수 없다.</mark></p>
										</td> 
									</tr> 
									<tr>
										<td>ACTUATOR.NAME</td>
										<td>String</td>
										<td>제어기 명을 변경하기 위한 명칭을 입력한다</td> 
									</tr> 
									<tr>
										<td>ACTUATOR.HISTORY</td>
										<td>String</td>
										<td>제어기의 히스토리 카운트 입력한다.</td> 
									</tr> 
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 200</td>
										<td>센서 정보가 변경 됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없거나, ADN 하위의 ACTUATOR 가 없음</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>변경 요청 시 시스템 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("ACTUATOR.ID", "3300-1");
json.put("ACTUATOR.NAME", "Temperature");
json.put("ACTUATOR.HISTORY", "10");
int result = oneM2MBridgeService. updateActuator(json);

if(result == 200) {
	System.out.println("> Result - update actuator : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>	
							
							<p style="font-weight:700;font-size:13px !important;">4.8 deleteActuator</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>ACTUATOR.ID</td>
										<td>String</td>
										<td>제어기를 삭제하기 위한 아이디를 입력한다.</td> 
									</tr>  
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 200</td>
										<td>제어기가 삭제 됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없거나, ADN 하위의 ACTUATOR 가 없음</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>변경 요청 시 시스템 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("ACTUATOR.ID", "3300-1");
int result = oneM2MBridgeService.deleteAactuator(json);

if(result == 200) {
	System.out.println("> Result - deleted ACTUATOR: " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}

</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
							<p style="font-weight:700;font-size:13px !important;">4.9 sendSensingReport</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>SENSOR.ID</td>
										<td>String</td>
										<td>등록된 센서 아이디를 입력한다.</td> 
									</tr> 
									<tr>
										<td>SENSOR.NAME</td>
										<td>String</td>
										<td>센싱된 이름을 추가 한다.</td> 
									</tr>
									<tr>
										<td>SENSOR.VALUE</td>
										<td>String</td>
										<td>센싱된 결과 값을 입력한다.</td> 
									</tr>   
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 201</td>
										<td>센싱 리포트가 등록됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없거나 센서가 없는 경우</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>서버 등록 시 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("SENSOR.ID", "3300-1");
json.put("SENSING.NAME", "Temperature");
json.put("SENSING.VALUE", "25.3");
int result = oneM2MBridgeService.sendSensingReport(json);

if(result == 201) {
	System.out.println("> Result – posted sensing report : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
								
							<p style="font-weight:700;font-size:13px !important;">4.10 sendActuatorResult</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>ACTUATOR.ID</td>
										<td>String</td>
										<td>등록된 제어기 아이디를 입력한다.</td> 
									</tr> 
									<tr>
										<td>ACTUATOR.NAME</td>
										<td>String</td>
										<td>제어 이름을 추가 한다.</td> 
									</tr>
									<tr>
										<td>ACTUATOR.VALUE</td>
										<td>String</td>
										<td>제어 결과 값을 입력한다.</td> 
									</tr>   
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 201</td>
										<td>제어 결과가 등록됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없거나 제어기가 없는 경우</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>서버 등록 시 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("SENSOR.ID", "3300-1");
json.put("SENSING.NAME", "Temperature");
json.put("SENSING.VALUE", "25.3");
int result = oneM2MBridgeService.sendSensingReport(json);

if(result == 201) {
	System.out.println("> Result – posted sensing report : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
								
							<p style="font-weight:700;font-size:13px !important;">4.11 sendActuation</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>ACTUATOR.ID</td>
										<td>String</td>
										<td>등록된 제어 아이디를 입력한다.</td> 
									</tr>  
									<tr>
										<td>ACTUATOR.VALUE</td>
										<td>String</td>
										<td>제어기의 제어값을 입력한다.</td> 
									</tr>   
								</tbody>
								<thead>
									<tr class="bg-info">
										<th scope="col" colspan="2">CODE</th> 
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  colspan="2"> 201</td>
										<td>제어 결과가 등록됨</td>
									</tr>
									<tr>
										<td  colspan="2">404</td>
										<td>등록된 ADN 이 없거나 제어기가 없는 경우</td>
									</tr>
									<tr>
										<td  colspan="2">500</td>
										<td>서버 등록 시 에러 발생</td>
									</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("SENSOR.ID", "3300-1");
int result = oneM2MBridgeService. sendActuation(json);

if(result == 201) {
	System.out.println("> Result – posted action result : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
								
							<p style="font-weight:700;font-size:13px !important;">4.12 getDevice</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr>
									<tr>
										<td>SENSOR.ID</td>
										<td>String</td>
										<td>등록된 센서  아이디를 입력한다.</td> 
									</tr>   
								  	<tr>
							  			<td colspan="3"><pre style="background: #fff"><code>{
    "m2m:cnt": {
        "rn": "3301-1",
        "ty": 3,
        "ri": "/handypia-in/48CNVkpVCS85VsfyFUkLpD",
        "pi": "/handypia-in/S0.2.481.2.100.0.73.74_AE",
        "ct": "20170822T080258",
        "lt": "20170826T064319",
        "lbl": "luxometer",
        "et": "99991231T235959",
        "st": 506,
        "cr": "S0.2.481.2.100.0.73.74_AE",
        "mni": 10,
        "cni": 0,
        "cbs": 0,
        "ch": []
    }
}</code></pre>
</td>
								  	</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put("SENSOR.ID", "3300-1");
int result = oneM2MBridgeService. sendActuation(json);

if(result == 201) {
	System.out.println("> Result – posted action result : " + result);
} else {
	System.out.println("> Result - Internal server error : " + result);
}
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
							
							<p style="font-weight:700;font-size:13px !important;">4.13 getDeviceAll</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr> 
								  	<tr>
							  			<td colspan="3"><pre style="background: #fff"><code>{
    "m2m:ae": {
        "rn": "S0.2.481.2.100.0.73.74_AE",
        "ty": 2,
        "ri": "/handypia-in/S0.2.481.2.100.0.73.74_AE",
        "pi": "/handypia-in/acE5dlrnnUa9rRfI886F1x",
        "ct": "20170822T080258",
        "lt": "20170825T063827",
        "lbl": "TI Sensortag",
        "et": "99991231T235959",
        "apn": "S0.2.481.2.100.0.73.74_AE",
        "api": "S0.2.481.2.100.0.73.74_AE",
        "aei": "/S0.2.481.2.100.0.73.74_AE",
        "poa": "http://10.30.5.63:8080/actuator/S0.2.481.2.100.0.73.74_AE",
        "rr": false,
        "csz": "application/json",
        "ch": [
            {
                "nm": "3301-1",
                "typ": 3,
                "value": "/handypia-in/48CNVkpVCS85VsfyFUkLpD"
            },
            {
                "nm": "3303-1",
                "typ": 3,
                "value": "/handypia-in/8BeQ1Dn1sDu6KvluGOKneV"
            },
            {
                "nm": "3303-2",
                "typ": 3,
                "value": "/handypia-in/arbudVjzTQY81Zs0hx99MY"
            },
            {
                "nm": "3303-3",
                "typ": 3,
                "value": "/handypia-in/atDPeOegS407Rc6b8okJ2V"
            },
            ……
        ]
    }
}
</code></pre>
</td>
								  	</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
JSONObject result = oneM2MBridgeService. getDevice(json);

if(result != null) {
	System.out.println("> Result – " + result.toString());
} else {	
	System.out.println("> Result - Internal server error ");
} 
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
							<p style="font-weight:700;font-size:13px !important;">4.14 getLastValue</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr> 
									<tr>
										<td>ID</td>
										<td>String</td>
										<td>등록된 센서/제어기 아이디를 입력한다.</td> 
									</tr> 
								  	<tr>
							  			<td colspan="3"><pre style="background: #fff"><code>{
	"resourceId":"luxometer",
	"time":"20180115133630",
	"value":{
		"luxometer":"224.4"
	},
	"thingId":"S0.2.481.2.100.0.73.74_AE"
} 
</code></pre>
</td>
								  	</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
json.put(".ID", "3300-1");
JSONObject result = oneM2MBridgeService. getLastValue(json);

if(result != null) {
	System.out.println("> Result – " + result.toString());
} else {
	System.out.println("> Result - Internal server error "); 
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
							<p style="font-weight:700;font-size:13px !important;">4.15 getValues</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>ADN.ID</td>
										<td>String</td>
										<td>등록된 ADN(Application Dedicated Node) 아이디를 입력한다.</td> 
									</tr> 
									<tr>
										<td>ID</td>
										<td>String</td>
										<td>등록된 센서/제어기 아이디를 입력한다.</td> 
									</tr> 
								  	<tr>
							  			<td colspan="3"><pre style="background: #fff"><code>[
	{
		" resourceId " : "luxometer" ,
		" time " : "20180115133120" ,
		" value " : {
			" luxometer " : "239.4"
		} ,
		" thingId " : "S0.2.481.2.100.0.73.74_AE"
	} ,
	{
		" resourceId " : "luxometer" ,
		" time " : "20180115133130" ,
		" value " : {
			" luxometer " : "238.2"
		} ,
		" thingId " : "S0.2.481.2.100.0.73.74_AE"
	} ,
	{
		" resourceId " : "luxometer" ,
		" time " : "20180115133140" ,
		" value " : {
			" luxometer " : "239.1"
		} ,
		" thingId " : "S0.2.481.2.100.0.73.74_AE"
	}, ......
] 
</code></pre>
</td>
								  	</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONObject json = new JSONObject();
json.put("ADN.ID", "S0.2.481.2.100.0.41.43_AE");
JSONArray result = oneM2MBridgeService. getValues(json);
	
if(result != null) {
	System.out.println("> Result – " + result.toString());
} else {
	System.out.println("> Result - Internal server error ");
} 
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
							<p style="font-weight:700;font-size:13px !important;">4.16 getADNALL</p> 
							<table class="table table-sm">
								<thead>
									<tr class="bg-info">
										<th scope="col" style="width:15%">Name</th>
										<th scope="col" style="width:15%">Type</th>
										<th scope="col">Descriptions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="3" style="text-align:center;">JSONObject Parameters 없음.</td> 
									</tr>  
								  	<tr>
							  			<td colspan="3"><pre style="background: #fff"><code>[
	{
		"typ":2,
		"value":"\/csitso-in\/CTEST00000",
		"nm":"CTEST00000"
	},
	{
		"typ":2,
		"value":"\/csitso-in\/S0000001",
		"nm":"S0000001"
	},......
] 
</code></pre>
</td>
								  	</tr>
									<tr>
										<td colspan="3">
<pre><code>JSONArray result = oneM2MBridgeService.getADNAll();

if(result.length() > 0) {
	System.out.println("> Result - posted sensing report : " + result.toString());
} else {
	System.out.println("> Result - Internal server error : " + result);
} 
</code></pre>
										</td>
									</tr>
								</tbody>
							</table>
							
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
	</div>


</body>

<%@ include file="/WEB-INF/views/common/script.jsp"%>

</html>
							
 
						