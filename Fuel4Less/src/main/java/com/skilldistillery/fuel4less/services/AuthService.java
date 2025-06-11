package com.skilldistillery.fuel4less.services;

import com.skilldistillery.fuel4less.entities.User;

public interface AuthService {
	public User register(User user);
	public User getUserByUsername(String username);
}
