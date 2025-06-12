package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.FuelType;

public interface FuelTypeService {
	FuelType findById(int id);
	List<FuelType> findAll();
	

}
