package com.skilldistillery.fuel4less.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.skilldistillery.fuel4less.entities.PriceReport;

public interface PriceReportRepository extends JpaRepository<PriceReport, Integer> {

	PriceReport findFirstByFuelType_IdOrderByCreateDateDesc(int fuelTypeId);

	@Query(value = "SELECT pr.price_per_gallon, ft.name AS fuel_type_name FROM price_report pr "
			+ "JOIN fuel_type ft ON pr.fuel_type_id = ft.id JOIN "
			+ "(SELECT fuel_type_id, MAX(create_date) AS max_date FROM price_report GROUP BY fuel_type_id ) latest "
			+ "ON pr.fuel_type_id = latest.fuel_type_id AND pr.create_date = latest.max_date "
			+ "JOIN gas_station gs ON pr.gas_station_id = gs.id "
			+ "WHERE gs.id = ?1", nativeQuery=true)
	List<PriceReport> getMostRecentPriceReport(int id);

}
