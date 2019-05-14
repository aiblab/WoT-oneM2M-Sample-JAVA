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
<%-- ADN 입력 화면.                                       	                    --%>
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

			<div class="content">
				<div class="container-fluid">
					<div class="row">

						<div class="col-md-12 col-lg-6">
							<div class="card">
								<div class="header">
									<h4 class="title">Server Info</h4>
									<p class="category">Using OneM2M Serve Url</p>
								</div>
								<div class="content">
									<div class="typo-line">
										<p class="category">URL</p>
										<p class="text-info">"${oneM2M_scl_base_url}"</p>
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
									<h4 class="title">ADN Setting</h4>
									<p class="category">Add your device ADN info</p>
								</div>
								<div class="content">
									<form id="adn-setting-form">
										<div class="row">
											<div class="col-md-12 ">
												<div class="form-group">
													<label>ADN ID</label> <input type="text"
														class="form-control border-input" placeholder="ADN ID"
														value="" id="adn-id" name="adnId">
												</div>
												<div class="form-group">
													<label>ADN Name</label> <input type="text"
														class="form-control border-input" placeholder="ADN Name"
														value="" id="adn-name" name="adnName">
												</div>
											</div>
										</div>

										<div class="text-center">
											<div class="btn btn-info btn-fill btn-wd" id="adn-submit">Insert
												ADN Info</div>
										</div>
										<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		

	</div>


</body>

<%@ include file="/WEB-INF/views/common/script.jsp"%>
</html>
