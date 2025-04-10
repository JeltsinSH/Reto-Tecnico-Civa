package com.civa.buses.service;

import com.civa.buses.model.Bus;
import com.civa.buses.repository.BusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BusService {

    @Autowired
    private BusRepository busRepository;

    public List<Bus> getAllBuses() {
        return busRepository.findAll();
    }

    public Bus getBusById(Long id) {
        Optional<Bus> bus = busRepository.findById(id);
        return bus.orElseThrow(() -> new RuntimeException("No existe Bus con id: " + id));
    }
}