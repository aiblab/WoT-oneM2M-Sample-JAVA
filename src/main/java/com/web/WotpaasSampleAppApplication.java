package com.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Configuration
@PropertySource(value = "classpath:application.properties")
@ComponentScan(basePackages = { "com" })
@EnableAutoConfiguration

@SpringBootApplication
public class WotpaasSampleAppApplication {

	public static void main(String[] args) {

		SpringApplication application = new SpringApplication(WotpaasSampleAppApplication.class);

		String vcap_services = System.getenv("VCAP_SERVICES");
		try {
			if (vcap_services != null) {
				JSONObject jsonObj = JSONObject.fromObject(vcap_services);
				JSONArray userPro = jsonObj.getJSONArray("HandyPIA-IoT-Platform");
				jsonObj = JSONObject.fromObject(userPro.get(0));
				jsonObj = jsonObj.getJSONObject("credentials");
				String onem2mUrl = jsonObj.getString("onem2mBaseUrl");

				List<String> ext_args = new ArrayList<String>();
				for (String arg : args) {
					ext_args.add(arg);
				}

				String[] splitedStr = onem2mUrl.split("/");

				ext_args.add("--oneM2M_scl_base_url=" + onem2mUrl);
				ext_args.add("--oneM2M_scl_base_origin=" + splitedStr[splitedStr.length - 2]);

				String[] ext_args_array = new String[ext_args.size()];
				ext_args.toArray(ext_args_array);
				application.run(ext_args_array);

			} else {
				application.run(args);
			}
		} catch (Exception e) {
			application.run(args);
		}
	}
}
