package com.example.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookingController {
	@GetMapping("map")
	public String map() {
		return "/booking/mapApi";
	}
}
