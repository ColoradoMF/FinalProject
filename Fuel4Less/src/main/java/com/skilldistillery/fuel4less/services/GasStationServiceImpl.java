package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.GasStation;
import com.skilldistillery.fuel4less.repositories.GasStationRepository;

@Service
public class GasStationServiceImpl implements GasStationService {

	@Autowired
	private GasStationRepository gasStationRepo;
	
	@Override
	public GasStation findById(int id) {
		return gasStationRepo.findById(id).orElse(null);
	}

	@Override
	public GasStation createGasStation(GasStation newGasStation) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GasStation updateGasStation(int id, GasStation updateGasStation) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteGasStationById(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<GasStation> searchByZipCode(String zipCode) {
		return gasStationRepo.findByAddress_ZipCode(zipCode);
	}

}
