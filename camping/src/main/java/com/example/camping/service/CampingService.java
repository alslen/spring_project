package com.example.camping.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.camping.model.Camping;
import com.example.camping.model.Picture;
import com.example.camping.repository.CampingRepository;
import com.example.camping.repository.PictureRepository;

@Service
public class CampingService {

	@Autowired
	private CampingRepository campRepository;

	@Autowired
	private PictureRepository pictureRepository;

	// 캠핑장 추가
	public void insert(Camping camp) {

		UUID uuid = UUID.randomUUID();
		List<MultipartFile> fileList = camp.getUpload();
		String uploadFileName = "";
		if (!fileList.isEmpty()) {
			for(MultipartFile f : fileList) {
				uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
				File saveFile = new File(uploadFileName);
				Picture p = new Picture();
				p.setCamping(camp);
				p.setPic_name(uploadFileName);
				pictureRepository.save(p);
				try {
					f.transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}

		campRepository.save(camp);
	}
	
	// 캠핑장 리스트
	@Transactional
	public List<Camping> list(){
		return campRepository.findAll();
	}
	
	// 캠핑장 상세보기
		public Camping detail(Long camp_id) {
			return campRepository.findById(camp_id).get();
		}
		
	// 삭제
	public void delete(Long camp_id) {
		campRepository.deleteById(camp_id);
	}
	
	// 캠핑장 수정
	@Transactional
	public void update(Camping camping) {
		Camping c = campRepository.findById(camping.getCamp_id()).get();
		c.setAddress(camping.getAddress());
		c.setCamp_category(camping.getCamp_category());
		c.setCamp_email(camping.getCamp_email());
		c.setCamp_tel(camping.getCamp_tel());
		c.setCamp_title(camping.getCamp_title());
		c.setCount(camping.getCount());
		c.setMaster(camping.getMaster());
		c.setRoom_info(camping.getRoom_info());
		c.setPrice(camping.getPrice());
		
	}

}
