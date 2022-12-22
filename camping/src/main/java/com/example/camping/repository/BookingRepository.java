package com.example.camping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.camping.model.Booking;

public interface BookingRepository extends JpaRepository<Booking, Long>{

}
