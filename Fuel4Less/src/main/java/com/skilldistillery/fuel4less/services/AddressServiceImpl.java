package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.fuel4less.entities.Address;
import com.skilldistillery.fuel4less.repositories.AddressRepository;

public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressRepository addressRepo;

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
	public Address createAddress(Address newAddress) {
		// TODO Auto-generated method stub
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
