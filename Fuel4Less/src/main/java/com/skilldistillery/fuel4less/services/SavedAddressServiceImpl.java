package com.skilldistillery.fuel4less.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.Address;
import com.skilldistillery.fuel4less.entities.SavedAddress;
import com.skilldistillery.fuel4less.entities.SavedAddressId;
import com.skilldistillery.fuel4less.entities.User;
import com.skilldistillery.fuel4less.repositories.AddressRepository;
import com.skilldistillery.fuel4less.repositories.SavedAddressRepository;
import com.skilldistillery.fuel4less.repositories.UserRepository;

@Service
public class SavedAddressServiceImpl implements SavedAddressService {
	
	@Autowired
	private SavedAddressRepository savedAddressRepo;
	
	@Autowired
	private AddressRepository addressRepo;
	
	@Autowired
	private UserRepository userRepo;

	@Override
	public SavedAddress createSavedAddress(String username, SavedAddress newSavedAddress) {
		User user = userRepo.findByUsername(username);
		Address address = addressRepo.saveAndFlush(newSavedAddress.getAddress());
		if (user != null && address != null) {
			SavedAddressId id = new SavedAddressId(user.getId(), address.getId());
			newSavedAddress.setId(id);
			newSavedAddress.setAddress(address);
			newSavedAddress.setUser(user);
			newSavedAddress.setEnabled(true);
//			newSavedAddress.setAddress(addressRepo.saveAndFlush(newSavedAddress.getAddress()));
			return savedAddressRepo.saveAndFlush(newSavedAddress);
		}
		return null;
	}

	@Override
	public boolean deleteSavedAddress(String username, SavedAddressId savedAddressId) {
		boolean deleted = false;
		SavedAddress savedAddressToDestroy = savedAddressRepo.findById(savedAddressId).orElse(null);
		if ( savedAddressToDestroy != null ) {
			savedAddressRepo.delete(savedAddressToDestroy);
			deleted = true;
		}
		return deleted;
	}
}
