package com.example.camping.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.camping.model.Camping;
import com.example.camping.model.Member;
import com.example.camping.model.Picture;
import com.example.camping.model.Wishlist;
import com.example.camping.repository.CampingRepository;
import com.example.camping.repository.LikeRepository;
import com.example.camping.repository.MemberRepository;
import com.example.camping.repository.PictureRepository;

@Service
public class CampingService {

	@Autowired
	private CampingRepository campRepository;

	@Autowired
	private PictureRepository pictureRepository;

	@Autowired
	private LikeRepository likeRepository;

	@Autowired
	private MemberRepository memberRepository;

	// 캠핑장 추가
	public void insert(Camping camp) {

		UUID uuid = UUID.randomUUID();
		List<MultipartFile> fileList = camp.getUpload();
		String uploadFileName = "";
		if (!fileList.isEmpty()) {
			for (MultipartFile f : fileList) {
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
	public List<Camping> list() {
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
	
	@Transactional
	public void saveLike(Wishlist wishlist) {
		
		likeRepository.save(wishlist);
		
		Wishlist w = likeRepository.findById(wishlist.getWishNum()).get();
		//w.setCount(wishlist.getCount()+1);
	}

	  public int findLike(Long camp_id, Long id) { 
		  Wishlist findLike = likeRepository.findByLike(camp_id, id);
		  if(findLike == null) { return 0; } 
		  else { return 1; } 
		  
	  }
//	  
//	  public int saveLike(Long camp_id, Long id) { 
//		  Optional<Wishlist> findLike =  likeRepository.findByCampingAndId(camp_id, id);
//		  System.out.println(findLike.isEmpty());
//		  
//		  if(findLike.isEmpty()) { 
//			  Member member = memberRepository.findById(id).get();
//			  Camping camping = campRepository.findById(camp_id).get();
//			  Wishlist like = Wishlist.toWishlist(member,camping);
//			  likeRepository.save(like); 
//			  //CampingRepository.plusLike(camp_id); 
//			  return 1; 
//			  }
//	  
//		  else { 
//			 likeRepository.deleteByCampingAndId(camp_id, id);
//			 //CampingRepository.minusLike(camp_id); 
//			 return 0; 
//		  }
//		  
//	  }

}
