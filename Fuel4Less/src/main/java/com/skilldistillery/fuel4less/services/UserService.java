package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.User;

public interface UserService {
	
	User getUserById(int id);
	
	User createUser(User user);
	
	User updateUser(String username, User user);
	
	boolean deleteUser(int id);
	
	List<User> findAll();

	User findById(int userId);
	
	void addFavoriteGasStation(String username, int gasStationId);
	
	void removeFavoriteGasStation(String username, int gasStationId);
	

}
