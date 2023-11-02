package com.kh.okkh.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	
	@RequestMapping("mySchedule.ca")
	public String selectSchedule() {
		
		return "calendar/mySchedule";
	}


	

}
