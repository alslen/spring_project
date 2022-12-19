package com.example.camping.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.camping.model.Wishlist;
import com.example.camping.repository.LikeRepository;

@Service
public class LikeService {

	@Autowired
	private LikeRepository likeRepository;
	
	@Transactional
	public void insert(Wishlist wishlist) {
		likeRepository.save(wishlist);
		wishlist.setCount(wishlist.getCount()+1);
	}
}
