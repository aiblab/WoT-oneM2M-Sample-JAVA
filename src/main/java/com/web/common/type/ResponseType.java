package com.web.common.type;

public class ResponseType { 
	public Integer code;
	public String message;
	
	ResponseType(Integer code, String message) {
		this.code = code;
		this.message = message;
	}
	
	public Integer getCode() {
		return code;
	}
	
	public String getMessage() {
		return message;
	}
}
