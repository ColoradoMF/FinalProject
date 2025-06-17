package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.Address;
import com.skilldistillery.fuel4less.entities.SavedAddress;

public interface SavedAddressService {
	
	SavedAddress createSavedAddress(String username, SavedAddress newSavedAddress);

}
