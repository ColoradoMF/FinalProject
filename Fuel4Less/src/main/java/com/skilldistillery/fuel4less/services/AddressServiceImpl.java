package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.Address;
import com.skilldistillery.fuel4less.entities.User;
import com.skilldistillery.fuel4less.repositories.AddressRepository;
import com.skilldistillery.fuel4less.repositories.UserRepository;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressRepository addressRepo;
	
	@Autowired
	private UserRepository userRepo;

	@Override
	public Address findById(int id) {
		return null;
	}

	@Override
	public List<Address> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Address createAddress(String username, Address newAddress) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			return addressRepo.saveAndFlush(newAddress);
		}
		return null;
	}

	@Override
	public Address updateAddress(int addressId, Address updateAddress) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteAddressById(int addressId) {
		// TODO Auto-generated method stub
		return false;
	}

}
