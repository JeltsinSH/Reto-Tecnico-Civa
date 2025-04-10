package com.civa.buses.repository;

import com.civa.buses.model.Bus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusRepository extends JpaRepository<Bus, Long> {
	
}