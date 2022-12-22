package com.example.camping.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.camping.model.Booking;
import com.example.camping.repository.BookingRepository;

@Service
public class BookingService {

	@Autowired
	private BookingRepository bookingRepository;
	
	@Transactional
	public  List<Booking> findById(Long num) {
		 @SuppressWarnings("unchecked")
		List<Booking> booking = (List<Booking>) bookingRepository.findById(num).get();
		return booking;
	}
	
	public void insert(Booking booking) {
		bookingRepository.save(booking);
	}
}
