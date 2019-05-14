var Sensor = {
	message : false,
	form : false,
	params : {},
	url : {},
	api : {
		registrySensor : "/api/registrySensor",
		getDevice : "/api/getDevice",
		deleteSensor : "/api/deleteSensor",
		sendSensingReport : "/api/sendSensingReport"
	},
	doInit : function() {

		var p = this;
		p.form = $('.sensor-setting-form');
		p.form.report = $('.sensor-report-form');

		$('.sensor-status-div').hide();
		$('.sensor-stop-submit').hide();

		$('.sensor-delete-submit').bind("click", p.doDelete);
		$('.sensor-submit').bind("click", p.doCreate);
		$('.report-submit').bind("click", p.doReport);
		$('.sensor-stop-submit').bind("click", p.doStopRport);
	},
	setViewValues : function(adnId) {
		$('.adn-id').val(adnId);
		$('.adn-id-txt').append(adnId);
	},
	setDetailViewValues : function(adnId, sensorId) {
		if (!jutils.empty(adnId) && !jutils.empty(sensorId)) {
			var data = {
				adnId : adnId,
				sensorId : sensorId
			};

			data = JSON.stringify(data);
			$.ajax({
				url : Sensor.api.getDevice,
				data : data,
				dataType : "json",
				contentType : "application/json",
				type : "POST",
				async : false,
				success : function(res) {
					if (!jutils.empty(res.m2mcnt)) {
						Sensor.params.adnId = adnId;
						Sensor.params.sensorId = sensorId;
						Sensor.params.sensorName = res.m2mcnt.lbl;
						Sensor.params.sensorHistory = res.m2mcnt.mni;

						$('.adn-id').val(Sensor.params.adnId);
						$('.adn-id-txt').append(Sensor.params.adnId);

						$('.sensor-id').val(Sensor.params.sensorId);
						$('.sensor-id-txt').append(Sensor.params.sensorId);

						$('.sensor-name').val(Sensor.params.sensorName);
						$('.sensor-name-txt').append(Sensor.params.sensorName);

						$('.sensor-history').val(Sensor.params.sensorHistory);
						$('.sensor-history-txt').append(
								Sensor.params.sensorHistory);
					}
				},
				error : function(response) {
					console.log("error");
				}
			});
		}
	},
	doCreate : function() {
		if (this.id != 'sensor-submit')
			return false;

		if (!Sensor.doValidate())
			return false;

		var data = Sensor.form.serializeObject();

		// console.log(data);
		$.ajax({
			url : Sensor.api.registrySensor,
			data : data,
			dataType : "json",
			contentType : "application/json",
			type : "POST",
			async : false,
			success : function(res) {
				console.log(res);
				if (res != 500) {
					Homepage.getAdnListAll();

					jalrt.showNotification({
						from : 'top',
						align : 'right',
						icon : 'ti-info-alt',
						message : jprops.contents.sensor.success,
						type : jprops.alrt.success,
						time : '2000'
					});

					Homepage.getAdnListAll();
				} else {
					jalrt.showNotification({
						from : 'top',
						align : 'right',
						icon : 'ti-info-alt',
						message : jprops.contents.sensor.error,
						type : jprops.alrt.danger,
						time : '2000'
					});
				}
			},
			error : function(response) {
				console.log("error");
			}
		});

	},
	doValidate : function() {
		var input = Sensor.form.find('input');
		var validate = true;
		$.each(input, function(i, e) {
			if (jutils.empty($(e).val())) {
				validate = false;
				return false;
			}
		});

		// jalrt.showNotification('top','right','ti-info-alt',jprops.contents.setting.validate,
		// jprops.alrt.warning,'2000');

		if (!validate) {
			jalrt.showNotification({
				from : 'top',
				align : 'right',
				icon : 'ti-info-alt',
				message : jprops.contents.sensor.validate,
				type : jprops.alrt.warning,
				time : '2000'
			});
		}

		return validate;
	},
	doDelete : function() {
		if (this.id != 'sensor-delete-submit')
			return false;

		var data = Sensor.form.report.serializeObject();

		$.ajax({
			url : Sensor.api.deleteSensor,
			data : data,
			dataType : "json",
			contentType : "application/json",
			type : "POST",
			async : false,
			success : function(res) {
				console.log(res);

				if (res != 500) {
					jcommon.go('/adn');
				} else {
					jalrt.showNotification({
						from : 'top',
						align : 'right',
						icon : 'ti-info-alt',
						message : jprops.contents.sensor.error,
						type : jprops.alrt.danger,
						time : '2000'
					});
				}
			},
			error : function(response) {
				console.log("error");
			}
		});
	},
	doReport : function() {
		if (this.id != 'report-submit')
			return false;

		var data = Sensor.form.report.serializeObject();
		var autoUpdate = $('#sensing-value-auto-update').val();
		var sensingValue = $('#sensing-value').val();

		if (jutils.empty(sensingValue)) {
			jalrt.showNotification({
				from : 'top',
				align : 'right',
				icon : 'ti-info-alt',
				message : jprops.contents.sensor.value.error,
				type : jprops.alrt.danger,
				time : '2000'
			});
			return false;
		}

		Sensor.doReportApi(data);

		if (Sensor.params.handle == "") {
			Sensor.params.handle = setInterval(function() {
				Sensor.doReportApi(data);
			}, autoUpdate);
		} else {
			clearInterval(Sensor.params.handle);
			Sensor.params.handle = "";
			Sensor.params.handle = setInterval(function() {
				Sensor.doReportApi(data);
			}, autoUpdate);
		}

	},
	doReportApi : function(data) {

		$.ajax({
			url : Sensor.api.sendSensingReport,
			data : data,
			dataType : "json",
			contentType : "application/json",
			type : "POST",
			async : false,
			success : function(res) {

				if (!jutils.empty(res)) {
					var sensorName = res.resourceId;
					var sensorValue = res.value;
					var value = "NULL";
					$.each(sensorValue, function(i, e) {
						console.log(i);
						if (i == sensorName) {
							value = e;
						}
					});

					$('.sensor-stop-submit').show();
					$('.sensing-value-txt').empty();
					$('.sensing-time-txt').empty();

					$('.sensing-value-txt').append(value);
					$('.sensing-time-txt').append(res.time);
					$('.sensor-status-div').show();
				} else {
					jalrt.showNotification({
						from : 'top',
						align : 'right',
						icon : 'ti-info-alt',
						message : jprops.contents.sensor.error,
						type : jprops.alrt.danger,
						time : '2000'
					});
				}
			},
			error : function(response) {
				console.log("error");
			}
		});
	},
	doStopRport : function() {
		clearInterval(Sensor.params.handle);
		Sensor.params.handle = "";
		
		jalrt.showNotification({
			from : 'top',
			align : 'right',
			icon : 'ti-info-alt',
			message : jprops.contents.sensor.value.stop,
			type : jprops.alrt.success,
			time : '2000'
		});
	}
}

$(function() {
	Sensor.doInit();
});