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
						<h4 class="title">Sensor Info</h4>
					</div>
					<div class="content">
						<div class="typo-line">
							<p class="category">Sensor ID</p>
							<p class="sensor-id-txt"></p>
						</div>
						<div class="typo-line">
							<p class="category">Sensor Name</p>
							<p class="sensor-name-txt"></p>
						</div>
						<div class="typo-line">
							<p class="category">Sensor History</p>
							<p class="sensor-history-txt"></p>
						</div>
						<div class="text-center">
							<div class="btn btn-info btn-danger btn-wd sensor-delete-submit"
								id="sensor-delete-submit">Delete Sensor Info</div>
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
						<h4 class="title">Report Sensing Value</h4>
						<p class="category"></p>
					</div>
					<div class="content">
						<form id="sensor-setting-form" class="sensor-report-form">
							<input type="hidden" name="adnId" id="adn-id" class="adn-id" />
							<input type="hidden" name="sensorId" id="sensor-id"
								class="sensor-id" /> <input type="hidden" name="sensorName"
								id="sensor-name" class="sensor-name" /> <input type="hidden"
								name="sensorHisotry" id="sensor-history" class="sensor-history" />
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Sensing Value</label> <input type="text"
											class="form-control border-input" placeholder="Sensing Value"
											value="" id="sensing-value" name="sensingValue">

									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Sensing Value Auto Update</label>
										<select
											class="form-control border-input" id="sensing-value-auto-update">
											<option data-tokens="1" value="1000">1 Sec</option>
											<%
												for (int i = 1; i <= 12; i++) {
											%>
											<option value="<%=i * 5 * 1000%>"><%=i * 5%> Sec</option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>

							<div class="text-center">
								<div class="btn btn-info btn-fill btn-wd report-submit"
									id="report-submit">Report Sensor Info</div>
								<div class="btn btn-info btn-danger btn-wd sensor-stop-submit"
								id="sensor-stop-submit" style="background-color: #EB5E28; color:#fff">Stop Sensor Info</div>
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>

				<div class="card sensor-status-div">
					<div class="content">
						<div class="row">
							<div class="col-xs-5 col-lg-6">
								<div class="icon-big icon-warning text-center">
									<i class="ti-cloud-up"></i>
								</div>
							</div>
							<div class="col-xs-7 col-lg-6">
								<div class="numbers" style="padding-right: 1.6em">
									<p class="sensing-value-txt" style="font-size: 3em;"></p>
									<p class="sensor-id-txt"
										style="font-size: 1em; padding-right: .3em"></p>
								</div>
							</div>
						</div>
						<div class="footer">
							<hr>
							<div class="stats">
								<i class="ti-reload"></i>
								<p class="sensing-time-txt" style="display: inline;"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
