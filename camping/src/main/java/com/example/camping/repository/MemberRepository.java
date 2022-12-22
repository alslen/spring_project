package com.example.camping.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	
	@Query(value="select * from member where username like CONCAT('%',:word,'%')",
			nativeQuery = true)
	public Page<Member> findByUsername(@Param("word")String word, Pageable pageable);
	@Query(value="select * from member where phone like CONCAT('%',:word,'%')",
			nativeQuery = true)
	public Page<Member> findByPhone(@Param("word") String word, Pageable pageable);
	
	@Query(value="select count(*) from member where username like CONCAT('%',:word,'%')",
			nativeQuery = true)
	public Long cntUsername(@Param("word") String word);
	@Query(value="select count(*) from member where phone like CONCAT('%',:word,'%')",
			nativeQuery = true)
	public Long cntPhone(@Param("word") String word);
}
