package com.kh.okkh.common.errorPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorPageController {
	
	@RequestMapping("/error400")
	public String badRequest() {
		return "common/error400";
	}

}
