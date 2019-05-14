var ADN = {
	message : false,
	form : false,
	params : {},
	url : {},
	api : {
		createADN : "/api/createADN",
	},
	// 이벤트를 바인딩한다.
	doInit : function() {

		var p = this;
		p.form = $('#adn-setting-form');

//		Homepage.setTopTitle('adn');

		$('#adn-submit').bind("click", p.doCreate);
	},
	doCreate : function() {
		if (this.id != 'adn-submit')
			return false;

		if (!ADN.doValidate())
			return false;

		var data = ADN.form.serializeObject();

		// console.log(data);

		$.ajax({
			url : ADN.api.createADN,
			data : data,
			dataType : "json",
			contentType : "application/json",
			type : "POST",
			async : false,
			success : function(res) { 
				if (res != 500) {
					 
					jalrt.showNotification({
						from : 'top',
						align : 'right',
						icon : 'ti-info-alt',
						message : jprops.contents.adn.success,
						type : jprops.alrt.success,
						time : '2000'
					});

					Homepage.getAdnListAll(); 
					 
				} else {
					jalrt.showNotification({
						from : 'top',
						align : 'right',
						icon : 'ti-info-alt',
						message : jprops.contents.adn.error,
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
		var input = ADN.form.find('input');
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
				message : jprops.contents.adn.validate,
				type : jprops.alrt.warning,
				time : '2000'
			});
		}

		return validate;
	} 
}

$(function() {
	ADN.doInit();
});