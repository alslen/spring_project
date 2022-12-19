package com.example.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.camping.model.Camping;
import com.example.camping.model.Picture;
import com.example.camping.service.CampingService;
import com.example.camping.service.PictureService;

@Controller
public class CampingCtroller {

	@Autowired
	private CampingService campService;
	
	@GetMapping("/")
	public String list() {
		return "redirect:/list";
	}
	
	// 캠핑장 추가폼
	@GetMapping("insert")
	public String insert() {
		return "/camping/campingInsert";
	}
	
	// 캠핑장 추가
	@PostMapping("insert")
	public String insert(Camping camp) {
		campService.insert(camp);
		return "redirect:/list";
	}
	// 전체list
	@GetMapping("list")
	public String list(Model model) {
		List<Camping> campings = campService.list();
		model.addAttribute("clist", campings);
		//model.addAttribute(pi, model)
		return "/camping/CampingList";
	}
	
	// 캠핑장 이미지를 클릭하면
	@GetMapping("camp")
	public String camp(Model model) {
		List<Camping> campings = campService.list();
		model.addAttribute("clist", campings);
		return "/camping/camp";
	}
	
	// 카라반 이미지를 클릭하면
		@GetMapping("car")
		public String car(Model model) {
			List<Camping> campings = campService.list();
			model.addAttribute("clist", campings);
			return "/camping/car";
		}
		
		// 캠핑장 이미지를 클릭하면
		@GetMapping("gram")
		public String gram(Model model) {
			List<Camping> campings = campService.list();
			model.addAttribute("clist", campings);
			return "/camping/gram";
		}
		// 캠핑장 상세보기
		@GetMapping("/detail/{camp_id}")
		public String detail(@PathVariable Long camp_id,Model model) {
			model.addAttribute("camp", campService.detail(camp_id));
			return "/camping/campDetail";
		}
				
		// 캠핑장 삭제
		@DeleteMapping("/camping/delete/{camp_id}")
		@ResponseBody
		public String delete(@PathVariable Long camp_id) {
			campService.delete(camp_id);
			return "success";
		}
		
		// 캠핑장 수정 폼
		@GetMapping("/camping/update/{camp_id}")
		public String update(@PathVariable Long camp_id, Model model) {
			model.addAttribute("camp",campService.detail(camp_id)) ;
			return "/camping/campUpdate";
		}
		
		// 캠핑장 수정
		@PutMapping("/camping/update")
		@ResponseBody
		public String update(@RequestBody Camping camping) {
			campService.update(camping);
			return "success";
		}
}
