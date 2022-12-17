package com.example.camping.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.example.camping.model.Camping;

public interface CampingRepository extends JpaRepository<Camping, Long>{
	
}
