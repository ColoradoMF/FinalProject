package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.GasStation;
import com.skilldistillery.fuel4less.entities.User;
import com.skilldistillery.fuel4less.repositories.GasStationRepository;
import com.skilldistillery.fuel4less.repositories.UserRepository;

@Service
public class GasStationServiceImpl implements GasStationService {

	@Autowired
	private GasStationRepository gasStationRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	@Override
	public GasStation findById(int id) {
		return gasStationRepo.findById(id).orElse(null);
	}

	@Override
	public GasStation createGasStation(String username, GasStation newGasStation) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			return gasStationRepo.saveAndFlush(newGasStation);
		}
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
