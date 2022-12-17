package com.example.camping.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Wishlist {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long wishNum;
	
	private Long count;  // wishList개수
	
	@ManyToOne
	@JoinColumn(name = "member_id")
	private Member id;
	
	@OneToOne
	private Camping camping;
	
	@PrePersist //DB에 해당 테이블의 insert연산을 실행 할 때 같이 실행
	public void prePerist() { // 초기 값을 지정
		this.count = this.count==null?0:this.count;
	}
}
