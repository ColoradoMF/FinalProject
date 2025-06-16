package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.PriceReport;
import com.skilldistillery.fuel4less.entities.User;
import com.skilldistillery.fuel4less.repositories.PriceReportRepository;
import com.skilldistillery.fuel4less.repositories.UserRepository;

@Service
public class PriceReportServiceImpl implements PriceReportService {
	
	@Autowired
	PriceReportRepository priceReportRepo;
	
	@Autowired
	UserRepository userRepo;

	@Override
	public PriceReport findById(int id) {
		return priceReportRepo.findById(id).orElse(null);
	}

	@Override
	public List<PriceReport> findAll() {
		return priceReportRepo.findAll();
	}

	@Override
	public PriceReport createPriceReport(PriceReport newPriceReport, String userName) {
		User user = userRepo.findByUsername(userName);
		if(user != null) {
			newPriceReport.setUser(user);
			return priceReportRepo.saveAndFlush(newPriceReport);			
		}
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

	@Override
	public List<PriceReport> getMostRecent(int gasStationId) {
		return priceReportRepo.getMostRecentPriceReport(gasStationId);
	}
	

}
