package com.skilldistillery.fuel4less.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.fuel4less.entities.SavedAddress;
import com.skilldistillery.fuel4less.entities.SavedAddressId;

public interface SavedAddressRepository extends JpaRepository <SavedAddress, SavedAddressId>{
	

}
