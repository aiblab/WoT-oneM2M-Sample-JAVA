<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<%-- @(#)top.jsp 1.0 2017-02-05                                             --%>
<%--                                                                        --%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<%-- 상위공통 화면.                                                         	--%>
<%--                                                                        --%>
<%-- @author HANDYSOFT                                                      --%>
<%-- @version 1.0 2018-02-05                                                --%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>

<nav class="navbar navbar-default" id="top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" id="menu-toggle">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar bar1"></span> <span class="icon-bar bar2"></span> <span
					class="icon-bar bar3"></span>
			</button>
			<a class="navbar-brand top-title" href=""></a>
		</div>
		<div class="collapse navbar-collapse">
		  
			<ul class="nav navbar-nav navbar-right"> 
				<li><a href="/adn"> <i class="ti-settings"></i> <p>Settings</p>
				</a></li>
			</ul>
		 
		</div>
	</div>
</nav>
