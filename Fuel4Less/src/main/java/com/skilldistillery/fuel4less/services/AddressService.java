package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.Address;

public interface AddressService {
	
	Address findById(int id);
	List <Address> findAll();
	Address createAddress(String username, Address newAddress);
	Address updateAddress(int addressId, Address updateAddress);
	boolean deleteAddressById(int addressId);

}
