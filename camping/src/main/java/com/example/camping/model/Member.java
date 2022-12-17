package com.example.camping.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Member {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private String username;  // 아이디
	private String password;  // 비밀번호
	private String name;  // 이름
	private String email; // 이메일
	private String birth; // 생년월일
	private String phone;  // 전화번호
	private String role;
	
	@OneToMany(mappedBy = "member")
	private List<Review> review;
	
	@OneToMany(mappedBy = "member")
	private List<Booking> booking;
	
	@OneToMany(mappedBy = "id")
	private List<Wishlist> wishList;
}
