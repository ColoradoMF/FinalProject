package com.skilldistillery.fuel4less.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.fuel4less.entities.FuelType;

public interface FuelTypeRepository extends JpaRepository <FuelType, Integer>{

}
