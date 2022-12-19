package com.example.camping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.camping.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Long>{

	@Query(value="select * from review where camp=?1", nativeQuery = true)
	public List<Review> findByCamping(Long camp_id);
}
