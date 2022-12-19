package com.example.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.camping.model.Review;
import com.example.camping.repository.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;
	
	// 댓글 추가
	public void insert(Review review) {
		reviewRepository.save(review);
	}
	
	// 댓글 리스트
	public List<Review> list(Long camp_id){
		return reviewRepository.findByCamping(camp_id);
	}
	
	// 댓글 개수
	public int count(Long camp_id) {
		List<Review> rlist = reviewRepository.findByCamping(camp_id);
		return rlist.size();
	}
	
	// 댓글 삭제
	public void delete(Long reviewNum) {
		reviewRepository.deleteById(reviewNum);
	}
	
	// 댓글 상세보기
	public Review detail(Long reviewNum) {
		return reviewRepository.findById(reviewNum).get();
	}
	
}
