package com.example.camping.repository;

import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.camping.model.Member;
import com.example.camping.model.WishListDTO;
import com.example.camping.model.Wishlist;

public interface LikeRepository extends JpaRepository<Wishlist, Long>{

	//Optional<Wishlist> findByCamping_camp_idAndMember_Id(Long camp_id, Long id);
//	void deleteByCampingAndId(Long camp_id, Long id);
	
	@Query(value = "select * from wishlist where camping=?1 and member_id=?2", nativeQuery = true)
	public Wishlist findByLike(Long camping, Long id);
	
	

}
