package com.example.camping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.camping.model.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
	Member findByusername(String username);
	
	@Query(value="select count(*) from member where username > ?1",  nativeQuery = true)
	public int idcheck(String username);
	
	//@Query (value="select count(*) from member where username=#{username}", nativeQuery = true)
	//String findById(String username);
}
