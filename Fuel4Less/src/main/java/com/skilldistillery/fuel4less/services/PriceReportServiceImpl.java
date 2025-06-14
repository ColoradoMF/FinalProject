package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.PriceReport;
import com.skilldistillery.fuel4less.repositories.PriceReportRepository;

@Service
public class PriceReportServiceImpl implements PriceReportService {
	
	@Autowired
	PriceReportRepository priceReportRepo;

	@Override
	public PriceReport findById(int id) {
		return priceReportRepo.findById(id).orElse(null);
	}

	@Override
	public List<PriceReport> findAll() {
		return priceReportRepo.findAll();
	}

	@Override
	public PriceReport createPriceReport(PriceReport newPriceReport) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PriceReport updatePriceReport(int priceReportId, PriceReport updatePriceReport) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deletePriceReportById(int priceReportId) {
		// TODO Auto-generated method stub
		return false;
	}

}
