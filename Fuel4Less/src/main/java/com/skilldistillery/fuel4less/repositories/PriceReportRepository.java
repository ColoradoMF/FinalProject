package com.skilldistillery.fuel4less.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.fuel4less.entities.PriceReport;

public interface PriceReportRepository extends JpaRepository <PriceReport, Integer>{
	
	PriceReport findFirstByFuelType_IdOrderByCreateDateDesc(int fuelTypeId);

}
