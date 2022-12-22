package com.example.camping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.camping.model.Booking;
import com.example.camping.service.BookingService;
import com.example.camping.service.CampingService;
import com.example.camping.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/full-calendar")
public class CalendarController {
	@Autowired
	private BookingService bookingService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CampingService campingService;
	
	
	//예약하기폼
	@GetMapping("/schedulePopup/{id}/{camp_id}")
	public String schedulePopup(@PathVariable Long id,@PathVariable Long camp_id,Model model) {
		model.addAttribute("camping_id",campingService.detail(camp_id));
		model.addAttribute("id",memberService.findById(id));
		System.out.println("camp_id :"+camp_id);
		return "/board/schedulePopup";
	}
	//예약하기
	@GetMapping("/insert")
	public void scheduleinsert(Booking booking) {
		    bookingService.insert(booking);
	}
	
	
	//달력 전체보기 테스트
	@GetMapping("/calendar/{camp_id}")
	public String month(@PathVariable Long camp_id, Model model) {
		model.addAttribute("id",camp_id);
		return "/board/calendar";
	}
	//달력 전체보기
	@GetMapping("/calendar-admin")
    @ResponseBody
    public List<Map<String, Object>> monthPlan(Long camp_id) {
        List<Booking> listAll = bookingService.findById(camp_id);
 
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
 
        HashMap<String, Object> hash = new HashMap<>();
 
        for (int i = 0; i < listAll.size(); i++) {
            hash.put("title", listAll.get(i).getCamping());
            hash.put("start", listAll.get(i).getCheck_in());
            hash.put("end", listAll.get(i).getCheck_out());
//            hash.put("time", listAll.get(i).getScheduleTime());
 
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        }
        
        log.info("jsonArrCheck: {}", jsonArr);
        return jsonArr; 
	}
}
