package com.example.camping.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Booking {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long bookNum;  // 예약번호
	private String check_in;
	private String check_out;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	private Member member;  // 고객 참조
	
	@ManyToOne
	@JoinColumn(name="camping_id")
	private Camping camping;  
	
	// 예약 상태(1:예약 완료, 2: 취소 완료, 3:입실완료, 4:이용완료)
	private Long status;  
	
	@ManyToOne
	@JoinColumn(name="pay_code")
	private Pay pay;
}
