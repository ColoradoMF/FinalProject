package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.User;

public interface UserService {
	
	User getUserById(int id);
	
	User createUser(User user);
	
	User updateUser(int id, User user);
	
	boolean deleteUser(int id);
	
	List<User> findAll();

	User findById(int userId);
	

}
