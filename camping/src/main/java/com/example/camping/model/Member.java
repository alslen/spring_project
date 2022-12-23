package com.example.camping.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Member  implements Serializable{

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
	
	@JsonIgnore
	@OneToMany(mappedBy = "member", cascade = CascadeType.REMOVE)
	private List<Review> review;
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.REMOVE)
	@JsonIgnore
	private List<Booking> booking;
	
	@JsonIgnore
	@OneToMany(mappedBy = "id", cascade = CascadeType.REMOVE)
	private List<Wishlist> wishList;
}
