package com.skilldistillery.fuel4less.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.fuel4less.entities.Address;

public interface AddressRepository extends JpaRepository <Address, Integer>{
	

}
