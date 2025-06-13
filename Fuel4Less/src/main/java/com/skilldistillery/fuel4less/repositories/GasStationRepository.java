package com.skilldistillery.fuel4less.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.fuel4less.entities.GasStation;

public interface GasStationRepository extends JpaRepository <GasStation, Integer>{
	
	List<GasStation> findByAddress_ZipCode(String zipCode);

}
