package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.GasStation;

public interface GasStationService {
	GasStation findById(int id);
	GasStation createGasStation(GasStation newGasStation);
	GasStation updateGasStation(int gasStationId, GasStation updateGasStation);
	boolean deleteGasStationById(int gasStationId);
	List<GasStation> searchByZipCode(String name);

}
