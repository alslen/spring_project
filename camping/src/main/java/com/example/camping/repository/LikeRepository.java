package com.example.camping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.camping.model.Wishlist;

public interface LikeRepository extends JpaRepository<Wishlist, Long>{

}
