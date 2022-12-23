package com.example.camping.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.camping.model.Camping;

public interface CampingRepository extends JpaRepository<Camping, Long>{

	@Query(value="select * from camping order by like_cnt desc", nativeQuery = true)
	public List<Camping> campLike();
	
	@Query(value="select * from camping order by reg_date desc", nativeQuery = true)
	public List<Camping> campNew();
}
