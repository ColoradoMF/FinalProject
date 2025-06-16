package com.skilldistillery.fuel4less.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.NativeQuery;

import com.skilldistillery.fuel4less.entities.PriceReport;

public interface PriceReportRepository extends JpaRepository<PriceReport, Integer> {

	PriceReport findFirstByFuelType_IdOrderByCreateDateDesc(int fuelTypeId);

	@NativeQuery(value ="SELECT pr.id, pr.last_update, pr.create_date, pr.remarks, pr.price_per_gallon, pr.enabled, ft.id "
			+ "AS fuel_type_id, pr.gas_station_id, pr.user_id FROM price_report pr JOIN fuel_type ft ON pr.fuel_type_id = ft.id JOIN (SELECT gas_station_id, fuel_type_id, MAX(create_date) AS max_date FROM price_report GROUP BY gas_station_id, fuel_type_id) latest ON pr.gas_station_id = latest.gas_station_id AND pr.fuel_type_id = latest.fuel_type_id AND pr.create_date = latest.max_date WHERE pr.gas_station_id =  ?1")
	
	List<PriceReport> getMostRecentPriceReport(int stationId);
	
	List<PriceReport> findAll();
	

}
