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
			<div class="content"></div> 
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>

		</div>
	</div>


</body>

<%@ include file="/WEB-INF/views/common/script.jsp"%>

</html>
