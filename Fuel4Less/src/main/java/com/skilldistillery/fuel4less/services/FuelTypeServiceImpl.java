package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.FuelType;
import com.skilldistillery.fuel4less.repositories.FuelTypeRepository;

@Service
public class FuelTypeServiceImpl implements FuelTypeService {
	
	@Autowired
	private FuelTypeRepository fuelTypeRepo;

	@Override
	public FuelType findById(int id) {
		return fuelTypeRepo.findById(id).orElse(null);
	}

	@Override
	public List<FuelType> findAll() {
		return fuelTypeRepo.findAll();
	}

}
