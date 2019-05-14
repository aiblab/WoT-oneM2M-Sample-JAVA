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

<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<%-- Sensor 입력 화면.                                       	                    --%>
<%--                                                                        --%>
<%-- @author HANDYSOFT                  			                        --%>
<%-- @version 1.0 2018-02-01 			                                    --%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>


<%@ include file="/WEB-INF/views/common/top.jsp"%>

<div class="content">
	<div class="container-fluid">
		<div class="row">

			<div class="col-md-12 col-lg-6">
				<div class="card">
					<div class="header">
						<h4 class="title">ADN Info</h4>
					</div>
					<div class="content">
						<div class="typo-line">
							<p class="category">ADN ID</p>
							<p class="text-info adn-id-txt"></p>
						</div>
						<div class="footer">
							<hr>
							<div class="stats">
								<!-- <i class="ti-reload"></i> Updated now -->
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="header">
						<h4 class="title">Sensor Setting</h4>
						<p class="category">Add your device sensor info</p>
					</div>
					<div class="content">
						<form id="sensor-setting-form" class="sensor-setting-form">
							<input type="hidden" name="adnId" id="adn-id" class="adn-id" />
							<div class="row">
								<div class="col-md-12 ">
									<div class="form-group">
										<label>Sensor Type</label> <input type="text"
											class="form-control border-input"
											placeholder="Sensor History" value="" id="sensor-name"
											name="sensorName">  
									</div>
									<div class="form-group">
										<label>Sensor ID</label> <input type="text"
											class="form-control border-input" placeholder="Sensor ID"
											value="" id="sensor-id" name="sensorId">
									</div>
									<div class="form-group">
										<label>Sensor Histroy</label> <input type="text"
											class="form-control border-input"
											placeholder="Sensor History" value="" id="sensor-history"
											name="sensorHistory">
									</div>
								</div>
							</div>

							<div class="text-center">
								<div class="btn btn-info btn-fill btn-wd sensor-submit"
									id="sensor-submit">Insert Sensor Info</div>
								<!-- <div class="btn btn-info btn-danger btn-wd sensor-delete-submit"
									id="sensor-delete-submit">Delete Sensor Info</div>-->
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
