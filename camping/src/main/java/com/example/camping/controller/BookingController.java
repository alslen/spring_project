package com.example.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/booking/*")
public class BookingController {
	
	
	@GetMapping("book")
	public String book() {
		return "/booking/bookingForm";
	}
}
