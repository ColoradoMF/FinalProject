package com.skilldistillery.fuel4less.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.fuel4less.entities.User;

public interface UserRepository extends JpaRepository <User, Integer> {
	
	User findByUsername(String username);

}
