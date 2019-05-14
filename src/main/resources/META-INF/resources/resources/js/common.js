var Homepage = {
	message : false,
	form : false,
	params : {},
	url : {
		sensor : '/sensor'
	},
	api : {
		getAdnListAll : '/api/getAdnListAll'
	},
	// 이벤트를 바인딩한다.
	doInit : function() {

		var p = this;

		var url = $(location).attr("href");
		var curl = jcommon.getURLIndex(url); 
		 
		p.setTopTitle(curl);
		p.getAdnListAll();
	},
	setTopTitle : function(url) {
		var title = $('#top').find('.top-title');
		
		console.log(url);
		
		switch (url) {
		case "adn":
			title.text(jprops.contents.adn.title);
			title.attr('href', '/adn');
			break;
		case "sensor":
			title.text(jprops.contents.sensor.title);
			title.attr('href', '/sensor');
		default:
			title.text(jprops.contents.info.title);
		    title.attr('href','');
			break;
		}
	},
	getAdnListAll : function() {
		var sidebarUl = $('.sidebar-ul');

		sidebarUl.empty();

		$.ajax({
			url : Homepage.api.getAdnListAll,
			dataType : "json",
			contentType : "application/json",
			cache : false,
			type : "GET",
			async : false,
			success : function(res) {
				// console.log(res);
				if (res.length > 0) {
					Homepage.setSidebarList(res);
				}
			},
			error : function(response) {
				console.log("error");
			}
		});

		Homepage.params.menuList = '';
	},
	setSidebarList : function(list) {
		var p = this;

		var menuList = list;

		if (menuList.length > 0) {
			menuList = eval(menuList);
			p.params.menuList = menuList;
		} else {
			return false;
		}

		var html = '';

		var sidebarUl = $('.sidebar-ul');

		$.each(menuList,function(i, e) {
			var adnLi = '';

			if (e.sensorList.length > 0) {
				adnLi += '<li class="sidebar-li"><a data-toggle="collapse" href="#'+ e.adnId+ '"><i class="ti-panel"></i> <p style="display:inline;">'+ e.adnId+ '</p> <i class="ti-plus menu-plus"></i></a></li>';

								var sensorLi = '';

								$
										.each(
												e.sensorList,
												function(k, e) {
													sensorLi += '<li class="sidebar-sub-li"><i class="ti-angle-right" style="font-size:1em;"></i><p>'
															+ e.nm
															+ '</p></li>';
												});

								adnLi += '<ul class="sub-title collapse out sidebar-sub-ul" id="'
										+ e.adnId + '">' + sensorLi + '</ul>';
							} else {
								adnLi += '<li class="sidebar-li"><a data-toggle="collapse" href="#'
										+ e.adnId
										+ '"><i class="ti-panel"></i> <p>'
										+ e.adnId + '</p></a></li>';
							}

							sidebarUl.append(adnLi);

						});

		sidebarUl.find('li.sidebar-li').click(function() {
			$('.sidebar-ul').find('li.sidebar-li').removeClass('active');
			$('.collapse').collapse('hide');
			$(this).addClass('active');

			var adnId = $(this).find('p').text();

			$('.main-panel').find('.content').empty();

			$.get("/sensor/" + adnId, function(data) {
				$('.main-panel').html(data);
				Sensor.params.adnId = adnId;
				Sensor.setViewValues(adnId);
				Homepage.setTopTitle('sensor');
				Sensor.doInit();
			});

		});

		sidebarUl.find('li.sidebar-sub-li').click(
				function() {
					$('.sidebar-ul').find('li.sidebar-sub-li').removeClass(
							'active');
					$(this).addClass('active');

					var sensorId = $(this).find('p').text();
					var adnId = Sensor.params.adnId;

					$('.main-panel').find('.content').empty();

					$.get("/report/" + sensorId, function(data) {
						$('.main-panel').html(data);
						$('#top').find('.top-title').text(
								jprops.contents.sensor.detail.title);
						Sensor.params.sensorId = sensorId;
						Sensor.setDetailViewValues(adnId, sensorId);
						Sensor.doInit();
					});
				});

	},
	menuToggle : function(e, v, flag) {
		e.preventDefault();

		if ($(window).width() <= 991) {
			if (flag == "main") {

				$('.sidebar-wrapper').find('li.sidebar-li').removeClass(
						'active');
				$('.sidebar-wrapper').find('li.sidebar-sub-li').removeClass(
						'active');
				$('.sidebar-wrapper').find('li.sidebar-sub-li').css('color',
						'#66615b');
				$('.collapse').collapse('hide');
				$(v).addClass('active');

				var adnId = $(v).find('p').text();

				$('.main-panel').find('.content').empty();

				if ($(v).next().hasClass('sidebar-sub-ul')) {
					$('.sidebar-sub-ul').hide();
					$(v).next().show();
				}

				$.get("/sensor/" + adnId, function(data) {

					$('.main-panel').find('.content').html(data);
					$('.main-panel').find('.content').find('.navbar-default')
							.remove();
					Sensor.params.adnId = adnId;
					Sensor.setViewValues(adnId);
					Homepage.setTopTitle('sensor');
					Sensor.doInit();
				});
			} else {
				$('.sidebar-wrapper').find('li.sidebar-sub-li').removeClass(
						'active');
				$('.sidebar-wrapper').find('li.sidebar-sub-li').css('color',
						'#66615b');
				$(v).addClass('active');
				$(v).css('color', '#7A9E9F');

				$('.main-panel').find('.content').empty();

				var sensorId = $(v).find('p').text();
				var adnId = Sensor.params.adnId;

				$.get("/report/" + sensorId, function(data) {
					$('.main-panel').find('.content').html(data);
					$('.main-panel').find('.content').find('.navbar-default')
							.remove();
					$('#top').find('.top-title').text(
							jprops.contents.sensor.detail.title);
					Sensor.params.sensorId = sensorId;
					Sensor.setDetailViewValues(adnId, sensorId);
					Sensor.doInit();
				});
			}
		}

	}
}

$(function() {
	Homepage.doInit();
});