package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.PriceReport;

public interface PriceReportService {
	
	PriceReport findById(int id);
	List<PriceReport> findAll();
	PriceReport createPriceReport(int gasStationId, PriceReport newPriceReport, String userName);
	PriceReport updatePriceReport(int priceReportId, PriceReport updatePriceReport);
	boolean deletePriceReportById(int priceReportId);
	List<PriceReport> getMostRecent(int gasStationId);
	

}
